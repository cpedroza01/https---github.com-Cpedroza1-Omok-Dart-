import 'dart:io';
import 'Board.dart';

class ConsoleUI {
  void showMessage(String msg) {
    print(msg);
  }

  ///asks user for server url
  askServerUrl() {
    print("Enter server URL (default: https://www.cs.utep.edu/cheon/cs3360/project/omok/): ");
    var url = stdin.readLineSync();
    while(!Uri.parse(url!).isAbsolute){
      print("Invalid URL");
      url = stdin.readLineSync();
    }
    return url;

  }

  ///asks the user to select a strategy
  askStrategy(info) {
    var s = info['strategies'];
    print("Select the server strategy (enter a number): 1. ${s[0]} 2. ${s[1]}");
    do {
      try {
        var line = stdin.readLineSync();
        var i = int.parse(line!);
        if (i != 1 && i != 2) {
          throw FormatException();
        }

        return s[i-1];// returns if input is 1 or 2

      } catch (FormatException) {
        print('Invalid Input');
      }
    }while(true);
  }

  ///asks the user to make their move and returns a Map of the move
  askMove() {
    var x;
    var y;
    Map moveMap = Map();

    print("Please make your move.  Any number between 0-14.");
    print("X:");
    x = int.parse(stdin.readLineSync()!);
    print("Y:");
    y = int.parse(stdin.readLineSync()!);
  
    moveMap['x'] = x;
    moveMap['y'] = y;
    
    return moveMap;
  }

  ///checks if the move made was a winning move or if it was a draw
  bool check(play) {
    if (play['isWin'] || play['isDraw']) {
      return true;
    }
    else{
      return false;
    }
  }

  ///when someone wins this will print a message with the row
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