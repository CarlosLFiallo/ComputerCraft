-- Initialize the board
local board = {" ", " ", " ", " ", " ", " ", " ", " ", " "}

-- Function to print the board
local function printBoard(b)
    print(string.format("\n %s | %s | %s\n---+---+---\n %s | %s | %s\n---+---+---\n %s | %s | %s\n",
        b[1], b[2], b[3], b[4], b[5], b[6], b[7], b[8], b[9]))
end

-- Function to check if a player has won
local function checkWin(b, player)
    -- Horizontal, Vertical, Diagonal checks
    return (b[1] == player and b[2] == player and b[3] == player) or
           (b[4] == player and b[5] == player and b[6] == player) or
           (b[7] == player and b[8] == player and b[9] == player) or
           (b[1] == player and b[4] == player and b[7] == player) or
           (b[2] == player and b[5] == player and b[8] == player) or
           (b[3] == player and b[6] == player and b[9] == player) or
           (b[1] == player and b[5] == player and b[9] == player) or
           (b[3] == player and b[5] == player and b[7] == player)
end

-- Function to check if the board is full
local function isBoardFull(b)
    for i = 1, #b do
        if b[i] == " " then
            return false
        end
    end
    return true
end

-- Main game loop
local currentPlayer = "X"
while true do
    printBoard(board)
    print("Player " .. currentPlayer .. "'s turn.")
    print("Enter position (1-9):")
    local position = tonumber(io.read())

    if position >= 1 and position <= 9 and board[position] == " " then
        board[position] = currentPlayer
        if checkWin(board, currentPlayer) then
            printBoard(board)
            print("Player " .. currentPlayer .. " wins!")
            break
        elseif isBoardFull(board) then
            printBoard(board)
            print("It's a tie!")
            break
        end
        currentPlayer = currentPlayer == "X" and "O" or "X"
    else
        print("Invalid move. Try again.")
    end
end
