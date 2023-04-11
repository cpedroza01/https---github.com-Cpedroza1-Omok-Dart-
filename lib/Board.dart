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
  var row;

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
  this.yStone = move['y'];
  this.xStone = move['x'];
}

List getServerMove(x,y){
  yStone = y;
  xStone = x;
  stone = [xStone, yStone];
  return stone;
}

void makePlayerMove(Map move){
  if(move['y'] == 1){
    var temp = move['x'] - 1;
    y1[temp] = 'O';
  }else if(move['y'] == 2){
    var temp = move['x'] - 1;
    y2[temp] = 'O';
  }else if(move['y'] == 3){
    var temp = move['x'] - 1;
    y3[temp] = 'O';
  }else if(move['y'] == 4){
    var temp = move['x'] - 1;
    y4[temp] = 'O';
  }else if(move['y'] == 5){
    var temp = move['x'] - 1;
    y5[temp] = 'O';
  }else if(move['y'] == 6){
    var temp = move['x'] - 1;
    y6[temp] = 'O';
  }else if(move['y'] == 7){
    var temp = move['x'] - 1;
    y7[temp] = 'O';
  }else if(move['y'] == 8){
    var temp = move['x'] - 1;
    y8[temp] = 'O';
  }else if(move['y'] == 9){
    var temp = move['x'] - 1;
    y9[temp] = 'O';
  }else if(move['y'] == 10){
    var temp = move['x'] - 1;
    y10[temp] = 'O';
  }else if(move['y'] == 11){
    var temp = move['x'] - 1;
    y11[temp] = 'O';
  }else if(move['y'] == 12){
    var temp = move['x'] - 1;
    y12[temp] = 'O';
  }else if(move['y'] == 13){
    var temp = move['x'] - 1;
    y13[temp] = 'O';
  }else if(move['y'] == 14){
    var temp = move['x'] - 1;
    y14[temp] = 'O';
  }else if(move['y'] == 15){
    var temp = move['x'] - 1;
    y15[temp] = 'O';
  }
}

void makeServerMove(List stone){
  if(stone[1] == 0){
    var move = stone[0];
    y1[move] = 'X';
  }else if(stone[1] == 1){
    var move = stone[0];
    y2[move] = 'X';
  }else if(stone[1] == 2){
    var move = stone[0];
    y3[move] = 'X';
  }else if(stone[1] == 3){
    var move = stone[0] ;
    y4[move] = 'X';
  }else if(stone[1] == 4){
    var move = stone[0] ;
    y5[move] = 'X';
  }else if(stone[1] == 5){
    var move = stone[0];
    y6[move] = 'X';
  }else if(stone[1] == 6){
    var move = stone[0];
    y7[move] = 'X';
  }else if(stone[1] == 7){
    var move = stone[0];
    y8[move] = 'X';
  }else if(stone[1] == 8){
    var move = stone[0];
    y9[move] = 'X';
  }else if(stone[1] == 9){
    var move = stone[0];
    y10[move] = 'X';
  }else if(stone[1] == 10){
    var move = stone[0];
    y11[move] = 'X';
  }else if(stone[1] == 11){
    var move = stone[0];
    y12[move] = 'X';
  }else if(stone[1] == 12){
    var move = stone[0];
    y13[move] = 'X';
  }else if(stone[1] == 13){
    var move = stone[0];
    y14[move] = 'X';
  }else if(stone[1] == 14){
    var move = stone[0];
    y15[move] = 'X';
  }
}

void gameOver(playerWin, playerDraw, serverWin, serverDraw, body){
  if(playerWin){
    var ackMove = body['ack_move'];
    this.row = ackMove['row'];
    print('Congratulations you won!!  Winning row: $row');
  }else if(playerDraw || serverDraw){
    print('It was a draw!');
  }else if(serverWin){
    var move = body['move'];
    this.row = move['row'];
    print('You lost to a robot!!  Winning row: $row');
  }
}

  void highlightLastMove(text){
    var lastX = this.row[0];
    var lastY = this.row[1];

    if(lastY == 0){
      y1[lastX] = '\x1B[31m$text\x1B[0m';
    }else if(lastY == 1){
      y2[lastX] = '\x1B[31m$text\x1B[0m';
    }else if(lastY == 2){
      y3[lastX] = '\x1B[31m$text\x1B[0m';
    }else if(lastY == 3){
      y4[lastX] = '\x1B[31m$text\x1B[0m';
    }else if(lastY == 4){
      y5[lastX] = '\x1B[31m$text\x1B[0m';
    }else if(lastY == 5){
      y6[lastX] = '\x1B[31m$text\x1B[0m';
    }else if(lastY == 6){
      y7[lastX] = '\x1B[31m$text\x1B[0m';
    }else if(lastY == 7){
      y8[lastX] = '\x1B[31m$text\x1B[0m';
    }else if(lastY == 8){
      y9[lastX] = '\x1B[31m$text\x1B[0m';
    }else if(lastY == 9){
      y10[lastX] = '\x1B[31m$text\x1B[0m';
    }else if(lastY == 10){
      y11[lastX] = '\x1B[31m$text\x1B[0m';
    }else if(lastY == 11){
      y12[lastX] = '\x1B[31m$text\x1B[0m';
    }else if(lastY == 12){
      y13[lastX] = '\x1B[31m$text\x1B[0m';
    }else if(lastY == 13){
      y14[lastX] = '\x1B[31m$text\x1B[0m';
    }else if(lastY == 14){
      y15[lastX] = '\x1B[31m$text\x1B[0m';
    }

  }
}