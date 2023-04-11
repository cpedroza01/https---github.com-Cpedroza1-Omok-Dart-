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
  var infoUrl = '//info';
  var newUrl = '//new';
  var playUrl = '//play';
  var pid;

  
  url = server.getService();
  server.getInfo();


  if(server.status = true){
    server.playerSelect();
    server.serverClient(url);
    server.sendStrategy();
    server.getNew();
    Map moves = player.getMove();
    server.sendPlay(moves);
    server.getPlay();
  }
}

