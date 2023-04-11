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
var tempUrl;
var infoUrl = '//info';
var newUrl = '//new';
var playUrl = '//play';
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

void serverClient(Uri url) async {
  this.tempUrl = this.url + infoUrl;
  var response = await this.client.get(Uri.parse(this.tempUrl));
  print(response.body);
    
}

Uri getService(){
  print("Please enter the url of the web service: ");
  this.url = stdin.readLineSync().toString();
  this.tempUrl = this.url + this.infoUrl;
  this.urlProcess = Uri.parse(tempUrl);
  return urlProcess;
}

void getInfo() async {
  var response = await http.get(this.urlProcess); 
  stratList = jsonDecode(response.body) as Map;
  if (response.statusCode >= 200){
    this.status = true;
  }else{
    this.status = false;
  }
  
}

void playerSelect() async{
  print('Please choose your strategy: 1. Smart  2. Random');
  this.strategyChoice = int.parse(stdin.readLineSync()!);

  if(this.strategyChoice == 1){
    this.strategy = 'Smart';
  }else if (this.strategyChoice == 2){
    this.strategy = 'Random';
  }
}

void sendStrategy() async {
  this.tempUrl = this.url + this.newUrl;
  this.tempUrl = tempUrl + '?strategy=$strategy';
  var uri = await Uri.parse(tempUrl);
  http.post(uri);
}

void getNew() async {
  urlProcess = await Uri.parse(tempUrl);
  var response = await http.get(this.urlProcess);
  var body = jsonDecode(response.body) as Map;
  this.pid = body['pid'];
}

void sendPlay(Map moves) async {
  this.tempUrl = this.url + playUrl;
  var xMove = moves['x'];
  var yMove = moves['y'];
  this.tempUrl = tempUrl + '?pid=$pid' + '&x=$xMove' + '&y=$yMove';
  var uri = await Uri.parse(this.tempUrl);
  http.post(uri);
}

void getPlay() async {
  urlProcess = await Uri.parse(this.tempUrl);
  var response = await http.get(this.urlProcess);
  print(this.pid);
  print(response.body);
}


}
