# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    end
  end
  return false
end

def full?(board)
  board.each do |position|
    if position == " "
      return false
    end
  end
  return true
end

def draw?(board)
  if won?(board) == false && full?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) == false
    if draw?(board)
      return true
    elsif full?(board) == false
      return false
    end
  else
    return true
  end
end

def winner(board)
  win = won?(board)
  if win == false
      return nil
  else
      return board[win[0]]
  end
end
