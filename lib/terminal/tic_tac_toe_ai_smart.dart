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
      var bestMove = findBestMove(board, player);
      board[bestMove[0]][bestMove[1]] = player;
      print(
          'AI player $player chose row ${bestMove[0] + 1}, column ${bestMove[1] + 1}');
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

List<int> findBestMove(List<List<String>> board, String player) {
  var bestScore = -1000;
  var bestMove = [-1, -1];

  for (var i = 0; i < board.length; i++) {
    for (var j = 0; j < board[i].length; j++) {
      if (board[i][j] == '-') {
        board[i][j] = player;
        var score = minimax(board, 0, false, player);
        board[i][j] = '-';

        if (score > bestScore) {
          bestScore = score;
          bestMove = [i, j];
        }
      }
    }
  }
  return bestMove;
}

int minimax(List<List<String>> board, int depth, bool isMaximizingPlayer,
    String player) {
  if (checkWin(board, 'X')) {
    return -10 + depth;
  }
  if (checkWin(board, 'O')) {
    return 10 - depth;
  }
  if (getEmptySpots(board).isEmpty) {
    return 0;
  }

  if (isMaximizingPlayer) {
    var bestScore = -1000;
    for (var i = 0; i < board.length; i++) {
      for (var j = 0; j < board[i].length; j++) {
        if (board[i][j] == '-') {
          board[i][j] = player;
          var score = minimax(board, depth + 1, false, player);
          board[i][j] = '-';
          bestScore = max(bestScore, score);
        }
      }
    }
    return bestScore;
  } else {
    var bestScore = 1000;
    for (var i = 0; i < board.length; i++) {
      for (var j = 0; j < board[i].length; j++) {
        if (board[i][j] == '-') {
          board[i][j] = player == 'X' ? 'O' : 'X';
          var score = minimax(board, depth + 1, true, player);
          board[i][j] = '-';
          bestScore = min(bestScore, score);
        }
      }
    }
    return bestScore;
  }
}
