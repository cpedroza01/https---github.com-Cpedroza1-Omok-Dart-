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
    server.getNew(response);               
    Map moves = player.getMove();


    var tempPlayUrl = server.sendPlay(moves);
    uri = Uri.parse(tempPlayUrl);
    response = await http.get(uri);
    server.getPlay(response); 
  }
}

