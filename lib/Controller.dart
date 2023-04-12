import 'dart:io';

import 'ConsoleUI.dart';
import 'WebServiceInterface.dart';
import 'Board.dart';
import 'package:http/http.dart' as http;

class Controller {
  Future<void> start() async {
    var ui = ConsoleUI();
    ui.showMessage("Welcome to Omok!");
    var url = ui.askServerUrl();
    var net = WebServiceInterface(url);
    //get info
    net.serverUrl = '$url/info';
    var response = await http.get(Uri.parse(net.serverUrl));
    ui.showMessage("Obtaining server information ......");
    validURL(net.checkURL(response)); //
    var info = net.getInfo(response);
    var strategy = ui.askStrategy(info);

    //get new
    net.serverUrl = '$url/new/?strategy=$strategy';
    ui.showMessage("Creating a new game ($strategy) ...");
    response = await http.get(Uri.parse(net.serverUrl));
    validURL(net.checkURL(response)); //
    var newGame = net.getNew(response);
    var pid = newGame['pid'];
    var board = Board(strategy, pid);

    //get play
    var play;
    do {
      board.showBoard();
      //player move
      var move = ui.askMove();
      board.makeMove(move, 'O');
      net.serverUrl = '$url/play/?pid=$pid&x=${move['x']}&y=${move['y']}';
      response = await http.get(Uri.parse(net.serverUrl));
      validURL(net.checkURL(response)); //
      play = net.getPlay(response);
      if (ui.check(play['ack_move'])) {
        break;
      }
      //server move
      board.makeMove(play['move'], 'X');
      if (ui.check(play['move'])) {
        break;
      }
    }while(true);

    ui.gameOver(board, play);
  }

  void validURL(bool checkURL) {
    if(!checkURL) exit(0);
  }
}