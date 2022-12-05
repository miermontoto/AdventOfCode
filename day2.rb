# Advent of Code 2022, day 2

$moves = {
    'win' => ['Y', 'Z', 'X'],
    'draw' => ['X', 'Y', 'Z'],
    'lose' => ['Z', 'X', 'Y'],
    'opponent' => ['A', 'B', 'C']
}

def star_one(input)
    total = 0

    input.each_line do |line|
        moves = line.split # obtain both moves
        opponent = moves[0]
        mine = moves[1]

        total += $moves['draw'].index(mine) + 1 # add move value

        index = $moves['opponent'].index(opponent) # obtain move index
        winning = $moves['win'][index] # obtain the winning move against their move
        drawing = $moves['draw'][index] # obtain the drawing move against their move

        # get result value
        if mine === winning then total += 6
        elsif mine === drawing then total += 3 end
        # if the move is losing, no value is added.
    end

    return total
end

def star_two(input)
    total = 0

    input.each_line do |line|
        moves = line.split
        opponent = moves[0]
        result = moves[1]
        index = $moves['opponent'].index(opponent)

        total += 3 * $moves['draw'].index(result) # add result to value (0 = loss, 3 = draw, 6 = win)

        # add move value
        if result === 'Y' then total += index + 1
        elsif result === 'Z' then total += $moves['draw'].index($moves['win'][index]) + 1
        else total += $moves['draw'].index($moves['lose'][index]) + 1 end
    end

    return total
end

# Read input from file
input = File.read("input/2")
puts "star one: #{star_one(input)}"
puts "star two: #{star_two(input)}"
