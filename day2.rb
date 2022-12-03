# Advent of Code 2022, day 2

def star_one(input)
    opponent_moves = ['A', 'B', 'C']
    winning_moves = ['Y', 'Z', 'X']
    equal_moves = ['X', 'Y', 'Z']
    total = 0

    input.each_line do |line| # read input line by line
        moves = line.split # obtain both moves
        opponent = moves[0] # opponent move
        mine = moves[1] # my planned move

        total += equal_moves.index(mine) + 1 # add move value

        opponent_index = opponent_moves.index(opponent) # obtain move index
        winning = winning_moves[opponent_index] # obtain the winning move against their move
        equal = equal_moves[opponent_index] # obtain the drawing move against their move

        # get result value
        if mine === winning then total += 6
        elsif mine === equal then total += 3 end
    end

    return total
end

def star_two(input)
    opponent_moves = ['A', 'B', 'C']
    winning_moves = ['Y', 'Z', 'X']
    losing_moves = ['Z', 'X', 'Y']
    equal_moves = ['X', 'Y', 'Z']
    total = 0

    input.each_line do |line|
        moves = line.split
        opponent = moves[0]
        result = moves[1]
        opponent_index = opponent_moves.index(opponent)

        total += 3 * equal_moves.index(result) # add result to value

        # add move value
        if result === 'Y' then total += opponent_index + 1
        elsif result === 'Z' then total += equal_moves.index(winning_moves[opponent_index]) + 1
        else total += equal_moves.index(losing_moves[opponent_index]) + 1 end
    end

    return total
end

# Read input from file
input = File.read("input/2")
print "star one: ", star_one(input)
puts
print "star two: ", star_two(input)