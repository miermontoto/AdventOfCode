# Advent of Code 2022, day 8
def visible?(grid, i, j)
    current = grid[i][j]
    visible_vert = [0..i-1, i+1...grid.size].any? { |l| l.none? { |k| grid[k][j] >= current } }
    visible_horz = [0..j-1, j+1...grid.first.size].any? { |l| l.none? { |k| grid[i][k] >= current } }
    visible_vert || visible_horz
end

def scenic?(grid, i, j)
    current = grid[i][j]

    scenic_top = (1..i).find { |k| grid[i-k][j] >= current } || i
    scenic_bottom = (1..grid.size - i - 1).find { |k| grid[i+k][j] >= current } || grid.size - i - 1
    scenic_left = (1..j).find { |k| grid[i][j-k] >= current } || j
    scenic_right = (1..grid.first.size - j - 1).find { |k| grid[i][j+k] >= current } || grid.first.size - j - 1

    scenic_top * scenic_bottom * scenic_left * scenic_right
end

def read_trees(input)
    grid = input.lines.map { |line| line.chars.map(&:to_i) }
    [grid, grid.size, grid.first.size]
end

def star_one(input)
    grid, x, y = read_trees(input)
    x*2 + y*2 - 6 + (1..x-2).sum { |i| (1..y-3).count { |j| visible?(grid, i, j) } }
end

def star_two(input)
    grid, x, y = read_trees(input)
    (1..x-2).map { |i| (1..y-3).map { |j| scenic?(grid, i, j) } }.flatten.max
end

input = File.read("input/8")
puts "star one: #{star_one(input)}"
puts "star two: #{star_two(input)}"
