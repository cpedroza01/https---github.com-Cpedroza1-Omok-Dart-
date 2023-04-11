import 'dart:io';

class Player{

  int yMove=0;
  int xMove=0;
  Map moveMap = new Map();

  Map getMove(){
    print("Please make your move");
    print("X:");
    this.xMove = int.parse(stdin.readLineSync()!);
    print("Y:");
    this.yMove = int.parse(stdin.readLineSync()!);

    this.moveMap['x'] = xMove;
    this.moveMap['y'] = yMove;

    return moveMap;
  }
}