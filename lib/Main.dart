import "package:OmokGame/Board.dart";

import 'package:http/http.dart' as http;
import 'dart:convert'; 
import 'dart:io'; 
import 'Board.dart';
import 'Player.dart';
import 'OmokServer.dart';

void main() async {
  // var url = Uri.parse('https://www.cs.utep.edu/cheon/cs3360/project/omok/info');

  OmokServer server = new OmokServer();
  Player player = new Player();


  var url;
  var tempUrl;
  var infoUrl = 'https://www.cs.utep.edu/cheon/cs3360/project/omok//info';
  var newUrl = 'https://www.cs.utep.edu/cheon/cs3360/project/omok//new';
  var playUrl = 'https://www.cs.utep.edu/cheon/cs3360/project/omok//play';
  var pid;
  var response;
  var uri;
  var playerWin = false;
  var playerDraw = false;
  var serverWin = false;
  var serverDraw = false;
  var winningRow;
  var playBody;

  
  url = server.getService();
  
  //get body from info url
  uri = Uri.parse(infoUrl);
  response = await http.get(uri);
  server.getInfo(response);                


  if(server.status = true){
    server.playerSelect();
    var tempNewUrl = server.sendStrategy();
    uri = Uri.parse(tempNewUrl);
    response = await http.get(uri); 
    var newBody = server.getNew(response);
    var newGame = newBody['response'];
    
    //while loop while iswin and is draw are false
    Board board = new Board(newGame);
    do {
      board.showBoard();
      Map moves = player.getMove();

      //send moves to play
      var tempPlayUrl = server.sendPlay(moves);
      uri = Uri.parse(tempPlayUrl);
      response = await http.get(uri);

      //getting data from play
      playBody = server.getPlay(response);
      var ackMove = playBody['ack_move'];
      var serverMove = playBody['move'];
      var serverX = serverMove['x'];
      var serverY = serverMove['y'];
      playerWin = ackMove['isWin'];
      playerDraw = ackMove['isDraw'];
      serverWin = serverMove['isWin'];
      serverDraw = serverMove['isDraw'];

      //making server move
      var stone = board.getServerMove(serverX, serverY);
      board.makePlayerMove(moves);
      board.makeServerMove(stone);
    
    } while (!playerWin && !playerDraw && !serverDraw && !serverWin);

    board.showBoard();
    board.gameOver(playerWin, playerDraw, serverWin, serverDraw, playBody);
    
    
  }
}

