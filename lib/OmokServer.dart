import 'package:http/http.dart' as http;
import 'dart:convert'; 
import 'dart:io'; 
import 'Board.dart';
import 'Player.dart';

class OmokServer{

var stratList;
int strategyChoice = 0;
var strategy;
var url;
var urlProcess;
var status;
var infoUrl = 'https://www.cs.utep.edu/cheon/cs3360/project/omok//info';
var newUrl = 'https://www.cs.utep.edu/cheon/cs3360/project/omok//new';
var playUrl = 'https://www.cs.utep.edu/cheon/cs3360/project/omok//play';
var pid;
var client = http.Client();

Player player = new Player();



// void runServerCheck(){
//   getService();
//   getInfo();
//   if(this.status = true){
//     this.playerSelect();
//     this.serverClient();
//     this.sendStrategy();
//     this.getNew();
//     Map moves = player.getMove();
//     this.sendPlay(moves);
//     this.getPlay();
//   }
// }

//we want the client to post and get.
void serverController() async {

}

Uri getService(){
  print("Please enter the url of the web service: ");
  this.url = stdin.readLineSync().toString();
  this.urlProcess = Uri.parse(infoUrl);
  return urlProcess;
}

void getInfo(http.Response response)  {
  stratList = jsonDecode(response.body);
  if (response.statusCode >= 200){
    this.status = true;
  }else{
    this.status = false;
  }
  
}

void playerSelect() {
  print('Please choose your strategy: 1. Smart  2. Random');
  this.strategyChoice = int.parse(stdin.readLineSync()!);

  if(this.strategyChoice == 1){
    this.strategy = 'Smart';
  }else if (this.strategyChoice == 2){
    this.strategy = 'Random';
  }
}

String sendStrategy() {
  var tempUrl = newUrl + '?strategy=$strategy';
  var uri = Uri.parse(tempUrl);
  http.post(uri);
  return tempUrl;
}

void getNew(http.Response response) {
  var body = jsonDecode(response.body) as Map;
  print(response.body);
  this.pid = body['pid'];
  print(this.pid);
}

String sendPlay(Map moves) {
  var xMove = moves['x'];
  var yMove = moves['y'];
  var pid = this.pid;
  var tempUrl = playUrl + '?pid=$pid' + '&x=$xMove' + '&y=$yMove';
  var uri = Uri.parse(tempUrl);
  http.post(uri);
  print(tempUrl);
  return tempUrl;
}

void getPlay(http.Response response) {
  print(this.pid);
  print(response.body);
}


}
