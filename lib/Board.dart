import 'package:OmokGame/OmokServer.dart';

import 'Player.dart';
class Board{

  Player player = new Player();
  OmokServer server = new OmokServer();

  var xStone;
  var yStone;
  var serverY;
  var serverX;
  var stone = [2];

  var y1 = ["*","*","*","*","*","*","*","*","*","*","*","*","*","*","*",];
  var y2 = ["*","*","*","*","*","*","*","*","*","*","*","*","*","*","*",];
  var y3 = ["*","*","*","*","*","*","*","*","*","*","*","*","*","*","*",];
  var y4 = ["*","*","*","*","*","*","*","*","*","*","*","*","*","*","*",];
  var y5 = ["*","*","*","*","*","*","*","*","*","*","*","*","*","*","*",];
  var y6 = ["*","*","*","*","*","*","*","*","*","*","*","*","*","*","*",];
  var y7 = ["*","*","*","*","*","*","*","*","*","*","*","*","*","*","*",];
  var y8 = ["*","*","*","*","*","*","*","*","*","*","*","*","*","*","*",];
  var y9 = ["*","*","*","*","*","*","*","*","*","*","*","*","*","*","*",];
  var y10 = ["*","*","*","*","*","*","*","*","*","*","*","*","*","*","*",];
  var y11 = ["*","*","*","*","*","*","*","*","*","*","*","*","*","*","*",];
  var y12 = ["*","*","*","*","*","*","*","*","*","*","*","*","*","*","*",];
  var y13 = ["*","*","*","*","*","*","*","*","*","*","*","*","*","*","*",];
  var y14 = ["*","*","*","*","*","*","*","*","*","*","*","*","*","*","*",];
  var y15 = ["*","*","*","*","*","*","*","*","*","*","*","*","*","*","*",];

  
  Board(bool pid){
    this.y1;
    this.y2;
    this.y3;
    this.y4;
    this.y5;
    this.y6;
    this.y7;
    this.y8;
    this.y9;
    this.y10;
    this.y11;
    this.y12;
    this.y13;
    this.y14;
    this.y15;
  }

  void showBoard(){
    print(" X  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15");
    print("Y -----------------------------------------------");
    print('1  '+ y1.toString());
    print('2  '+ y2.toString());
    print('3  '+ y3.toString());
    print('4  '+ y4.toString());
    print('5  '+ y5.toString());
    print('6  '+ y6.toString());
    print('7  '+ y7.toString());
    print('8  '+ y8.toString());
    print('9  '+ y9.toString());
    print('10 '+ y10.toString());
    print('11 '+ y11.toString());
    print('12 '+ y12.toString());
    print('13 '+ y13.toString());
    print('14 '+ y14.toString());
    print('15 '+ y15.toString());
  }

void getPlayerMove(Map move){
  this.yStone = move[0];
  this.xStone = move[1];
}

List getServerMove(x,y){
  player.getMove();
  yStone = y;
  xStone = x;
  stone = [xStone, yStone];
  return stone;
}

void makePlayerMove(){
  if(this.yStone == 1){
    var move = xStone - 1;
    y1[move] = 'O';
  }else if(this.yStone == 2){
    var move = xStone - 1;
    y2[move] = 'O';
  }else if(this.yStone == 3){
    var move = xStone - 1;
    y3[move] = 'O';
  }else if(this.yStone == 4){
    var move = xStone - 1;
    y4[move] = 'O';
  }else if(this.yStone == 5){
    var move = xStone - 1;
    y5[move] = 'O';
  }else if(this.yStone == 6){
    var move = xStone - 1;
    y6[move] = 'O';
  }else if(this.yStone == 7){
    var move = xStone - 1;
    y7[move] = 'O';
  }else if(this.yStone == 8){
    var move = xStone - 1;
    y8[move] = 'O';
  }else if(this.yStone == 9){
    var move = xStone - 1;
    y9[move] = 'O';
  }else if(this.yStone == 10){
    var move = xStone - 1;
    y10[move] = 'O';
  }else if(this.yStone == 11){
    var move = xStone - 1;
    y11[move] = 'O';
  }else if(this.yStone == 12){
    var move = xStone - 1;
    y12[move] = 'O';
  }else if(this.yStone == 13){
    var move = xStone - 1;
    y13[move] = 'O';
  }else if(this.yStone == 14){
    var move = xStone - 1;
    y14[move] = 'O';
  }else if(this.yStone == 15){
    var move = xStone - 1;
    y15[move] = 'O';
  }
}

void makeServerMove(List stone){
  if(stone[1] == 1){
    var move = stone[0] - 1;
    y1[move] = 'X';
  }else if(stone[1] == 2){
    var move = stone[0] - 1;
    y2[move] = 'X';
  }else if(stone[1] == 3){
    var move = stone[0] - 1;
    y3[move] = 'X';
  }else if(stone[1] == 4){
    var move = stone[0] - 1;
    y4[move] = 'X';
  }else if(stone[1] == 5){
    var move = stone[0] - 1;
    y5[move] = 'X';
  }else if(stone[1] == 6){
    var move = stone[0] - 1;
    y6[move] = 'X';
  }else if(stone[1] == 7){
    var move = stone[0] - 1;
    y7[move] = 'X';
  }else if(stone[1] == 8){
    var move = stone[0] - 1;
    y8[move] = 'X';
  }else if(stone[1] == 9){
    var move = stone[0] - 1;
    y9[move] = 'X';
  }else if(stone[1] == 10){
    var move = stone[0] - 1;
    y10[move] = 'X';
  }else if(stone[1] == 11){
    var move = stone[0] - 1;
    y11[move] = 'X';
  }else if(stone[1] == 12){
    var move = stone[0] - 1;
    y12[move] = 'X';
  }else if(stone[1] == 13){
    var move = stone[0] - 1;
    y13[move] = 'X';
  }else if(stone[1] == 14){
    var move = stone[0] - 1;
    y14[move] = 'X';
  }else if(stone[1] == 15){
    var move = stone[0] - 1;
    y15[move] = 'X';
  }
}
  
}