# Advent of Code 2022, day 5

# utility functions to solve both parts
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

    grid.each(&:reverse!)
end

def read_commands(input)
    commands = []

    input.each_line do |line|
        line = line.strip.split(' ').map(&:to_i).reject(&:zero?)
        commands << [line[0], line[1] - 1, line[2] - 1]
    end

    return commands
end

def read_info(input)
    grid, commands = input.split("\n\n")
    return read_grid(grid), read_commands(commands)
end

# actual resolution of both parts
def star_one(input)
    grid, commands = read_info(input)

    commands.each do |iter, src, dest|
        iter.times { grid[dest] << grid[src].pop }
    end

    grid.map(&:last).join
end

def star_two(input)
    grid, commands = read_info(input)

    commands.each do |iter, src, dest|
        grid[dest].concat(grid[src].pop(iter))
    end

    grid.map(&:last).join
end

# main: read input and print results
input = File.read("input/5")
puts "star one: #{star_one(input)}"
puts "star two: #{star_two(input)}"
