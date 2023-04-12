import 'dart:io';
import 'Board.dart';

class ConsoleUI {
  void showMessage(String msg) {
    print(msg);
  }

  askServerUrl() {
    print("Enter server URL (default: https://www.cs.utep.edu/cheon/cs3360/project/omok/): ");
    var url = stdin.readLineSync();
    while(!Uri.parse(url!).isAbsolute){
      print("Invalid URL");
      url = stdin.readLineSync();
    }
    return url;

  }

  askStrategy(info) {
    var s = info['strategies'];
    print("Select the server strategy (enter a number): 1. ${s[0]} 2. ${s[1]}");
    var line = stdin.readLineSync();
    var i = int.parse(line!);
    return s[i-1];
  }

  askMove() {
    print("Please make your move");
    print("X:");
    var x = int.parse(stdin.readLineSync()!);
    print("Y:");
    var y = int.parse(stdin.readLineSync()!);

    Map moveMap = Map();
    moveMap['x'] = x;
    moveMap['y'] = y;

    return moveMap;
  }

  bool check(play) {
    if (play['isWin'] || play['isDraw']) {
      return true;
    }
    else{
      return false;
    }
  }

  void gameOver(Board board, play) {
    var ackMove = play['ack_move'];
    var move = play['move'];
    if(ackMove['isWin']) {
      board.highlightLastMove('O', play['ack_move']);
      board.showBoard();
      print('Congratulations you won!!  Winning row: ${ackMove['row']}');
    }else if(ackMove['isDraw'] || move['isDraw']) {
      print('It was a draw!');
    }else if(move['isWin']){
      board.highlightLastMove('X', play['move']);
      board.showBoard();
      print('You lost to a robot!!  Winning row: ${move['row']}');
    }
  }
}