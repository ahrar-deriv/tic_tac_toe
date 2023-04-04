import 'dart:io';
import 'dart:math';

void main() {
  var board = List.generate(3, (_) => List.filled(3, '-'));
  var player = 'X';

  while (true) {
    printBoard(board);
    if (player == 'X') {
      print('Player $player, choose a row (1-3):');
      var row = int.parse(stdin.readLineSync()!);
      print('Player $player, choose a column (1-3):');
      var col = int.parse(stdin.readLineSync()!);

      if (board[row - 1][col - 1] == '-') {
        board[row - 1][col - 1] = player;
      } else {
        print('That spot is already taken. Please choose again.');
        continue;
      }
    } else {
      var emptySpots = getEmptySpots(board);
      if (emptySpots.isEmpty) {
        printBoard(board);
        print('Tie game!');
        break;
      }
      var randomIndex = Random().nextInt(emptySpots.length);
      var randomSpot = emptySpots[randomIndex];
      board[randomSpot[0]][randomSpot[1]] = player;
      print('AI player $player chose row ${randomSpot[0] + 1}, column ${randomSpot[1] + 1}');
    }

    if (checkWin(board, player)) {
      printBoard(board);
      if (player == 'X') {
        print('Player $player wins!');
      } else {
        print('AI player $player wins!');
      }
      break;
    }

    player = player == 'X' ? 'O' : 'X';
  }
}

void printBoard(List<List<String>> board) {
  for (var row in board) {
    print(row.join(' '));
  }
}

bool checkWin(List<List<String>> board, String player) {
  for (var i = 0; i < 3; i++) {
    if (board[i][0] == player && board[i][1] == player && board[i][2] == player) {
      return true;
    }
    if (board[0][i] == player && board[1][i] == player && board[2][i] == player) {
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

List<List<int>> getEmptySpots(List<List<String>> board) {
  var emptySpots = <List<int>>[];
  for (var i = 0; i < board.length; i++) {
    for (var j = 0; j < board[i].length; j++) {
      if (board[i][j] == '-') {
        emptySpots.add([i, j]);
      }
    }
  }
  return emptySpots;
}

