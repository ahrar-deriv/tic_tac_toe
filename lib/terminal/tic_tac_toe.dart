import 'dart:io';

void main() {
  var board = List.generate(3, (_) => List.filled(3, '-'));
  var player = 'X';

  while (true) {
    printBoard(board);
    print('Player $player, choose a row (1-3):');
    var row = int.parse(stdin.readLineSync()!);
    print('Player $player, choose a column (1-3):');
    var col = int.parse(stdin.readLineSync()!);

    if (board[row - 1][col - 1] == '-') {
      board[row - 1][col - 1] = player;

      if (checkWin(board, player)) {
        printBoard(board);
        print('Player $player wins!');
        break;
      }

      if (checkTie(board)) {
        printBoard(board);
        print('Tie game!');
        break;
      }

      player = player == 'X' ? 'O' : 'X';
    } else {
      print('That spot is already taken. Please choose again.');
    }
  }
}

void printBoard(List<List<String>> board) {
  for (var row in board) {
    print(row.join(' '));
  }
}

bool checkWin(List<List<String>> board, String player) {
  for (var i = 0; i < 3; i++) {
    if (board[i][0] == player &&
        board[i][1] == player &&
        board[i][2] == player) {
      return true;
    }
    if (board[0][i] == player &&
        board[1][i] == player &&
        board[2][i] == player) {
      return true;
    }
  }
  if (board[0][0] == player && board[1][1] == player && board[2][2] == player) {
    return true;
  }
  if (board[0][2] == player && board[1][1] == player && board[2][0] == player) {
    return true;
  }
  return false;
}

bool checkTie(List<List<String>> board) {
  for (var row in board) {
    for (var col in row) {
      if (col == '-') {
        return false;
      }
    }
  }
  return true;
}
