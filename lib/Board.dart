class Board {
  var strategy;
  var pid;
  var board;

  ///the game board
  Board(strategy, pid) {
    this.board = [["*","*","*","*","*","*","*","*","*","*","*","*","*","*","*",],
                  ["*","*","*","*","*","*","*","*","*","*","*","*","*","*","*",],
                  ["*","*","*","*","*","*","*","*","*","*","*","*","*","*","*",],
                  ["*","*","*","*","*","*","*","*","*","*","*","*","*","*","*",],
                  ["*","*","*","*","*","*","*","*","*","*","*","*","*","*","*",],
                  ["*","*","*","*","*","*","*","*","*","*","*","*","*","*","*",],
                  ["*","*","*","*","*","*","*","*","*","*","*","*","*","*","*",],
                  ["*","*","*","*","*","*","*","*","*","*","*","*","*","*","*",],
                  ["*","*","*","*","*","*","*","*","*","*","*","*","*","*","*",],
                  ["*","*","*","*","*","*","*","*","*","*","*","*","*","*","*",],
                  ["*","*","*","*","*","*","*","*","*","*","*","*","*","*","*",],
                  ["*","*","*","*","*","*","*","*","*","*","*","*","*","*","*",],
                  ["*","*","*","*","*","*","*","*","*","*","*","*","*","*","*",],
                  ["*","*","*","*","*","*","*","*","*","*","*","*","*","*","*",],
                  ["*","*","*","*","*","*","*","*","*","*","*","*","*","*","*",]];
  }

  ///Will display the board
  void showBoard() {
    print(" X  0  1  2  3  4  5  6  7  8  9 10 11 12 13 14");
    print("Y -----------------------------------------------");
    for(var i=0;i<10;++i) {
      print(' $i  ${board[i]}');
    }
    for(var i=10;i<15;++i) {
      print('$i  ${board[i]}');
    }
  }

  ///Takes the move and changes the board 
  void makeMove(move, player) {
    board[move['y']][move['x']] = player;
  }


  ///highlights the winning row
  void highlightLastMove(player, move) {
    var row = move['row'];
    board[row[0]][row[1]] = '\x1B[31m$player\x1B[0m';
    board[row[2]][row[3]] = '\x1B[31m$player\x1B[0m';
    board[row[4]][row[5]] = '\x1B[31m$player\x1B[0m';
    board[row[6]][row[7]] = '\x1B[31m$player\x1B[0m';
    board[row[8]][row[9]] = '\x1B[31m$player\x1B[0m';
  }

  
}