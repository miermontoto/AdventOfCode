# Advent of Code 2022, day 5

# utility functions
def read_grid(input)
    lines = input.lines
    cols = lines.pop.strip.split('   ').length
    grid = Array.new(cols) { [] }

    lines.each do |line|
        (1..line.length).step(4) do |pos|
            box = line[pos]
            grid[(pos - 1) / 4].push(box) unless box == ' '
        end
    end

    grid.map(&:reverse!)
end

def read_commands(input)
    commands = []

    input.each_line do |line|
        line = line.strip.split(' ').map(&:to_i).reject(&:zero?)
        commands << [line[0], line[1] - 1, line[2] - 1]
    end

    return commands
end

# generic function to solve both parts
def star(input, lambda)
    grid, commands = input.split("\n\n")
    grid = read_grid(grid)
    commands = read_commands(commands)

    commands.each do |iter, src, dest|
        lambda.call(grid, iter, src, dest)
    end

    grid.map(&:last).join
end

# main: read input and print results
input = File.read("input/5")
lambda1 = -> (grid, iter, src, dest) { iter.times { grid[dest].push(grid[src].pop) } }
lambda2 = -> (grid, iter, src, dest) { grid[dest].concat(grid[src].pop(iter)) }
puts "star one: #{star(input, lambda1)}"
puts "star two: #{star(input, lambda2)}"
