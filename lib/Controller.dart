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
    ///get info
    net.serverUrl = '$url/info';
    var response = await http.get(Uri.parse(net.serverUrl));
    ui.showMessage("Obtaining server information ......");
    var info = net.getInfo(response);
    var strategy = ui.askStrategy(info);

    ///get new
    net.serverUrl = '$url/new/?strategy=$strategy';
    ui.showMessage("Creating a new game ($strategy) ...");
    response = await http.get(Uri.parse(net.serverUrl));
    var newGame = net.getNew(response);
    var pid = newGame['pid'];
    var board = Board(strategy, pid);

    ///get play
    var play;
    do {
      board.showBoard();

      ///player move
      var validMove = false;
      var move;
      ///loop to make sure move is valid
      ///also catches exception if input is not a number
      while(validMove == false){
        try{
        move = ui.askMove();
        if(move['x'] > 14 || move['x'] < 0 || move['y'] > 14 || move['y'] < 0){
          print('Please enter a valid number between 0-14.');
          validMove = false;
          continue;
        }else{
          validMove = true;
          break;
        }
        }catch(FormatException){
          print('Input was not a number');
        }
      }

      ///makes valid move
      board.makeMove(move, 'O');
      net.serverUrl = '$url/play/?pid=$pid&x=${move['x']}&y=${move['y']}';
      response = await http.get(Uri.parse(net.serverUrl));
      play = net.getPlay(response);
      if (ui.check(play['ack_move'])) {
        break;
      }
      ///server move
      board.makeMove(play['move'], 'X');
      if (ui.check(play['move'])) {
        break;
      }
    }while(true);

    ui.gameOver(board, play);
  }
}