# Advent of Code 2022, day 9

class Piece
    def initialize(grid)
        @x = 0
        @y = grid.first.size - 1
        @log = []
    end

    def x()
        @x
    end

    def y()
        @y
    end

    def log()
        @log
    end

    def touching?(other)
        (other.x - self.x).abs <= 1 or (other.y - self.y).abs <= 1
    end

    def move(dir)
        case dir
        when 'U'
            @y = self.y - 1
        when 'D'
            @y = self.y + 1
        when 'L'
            @x = self.x - 1
        when 'R'
            @x = self.x + 1
        end

        @log.push([self.x, self.y])
        print "Pushing [#{self.x},#{self.y}]\n"
    end

    def set_pos(x, y)
        @x = x
        @y = y
    end
end


def star_one(input)
    grid = Array.new(4, Array.new(4))
    head = Piece.new(grid)
    tail = Piece.new(grid)

    possible_dir = ['U', 'D', 'L', 'R']
    reverse_dir = ['D', 'U', 'R', 'L']

    input.each_line do |line|
        dir = line.split.first
        times = line.split.last.to_i

        times.times do
            head.move(dir)
            if not tail.touching?(head)
                tail.set_pos(head.x, head.y)
                tail.move(reverse_dir[possible_dir.index(dir)])
            end
        end
    end
    puts head.log
    tail.log.uniq.count
end

def star_two(input)
end

input = File.read("input/9")
puts "star one: #{star_one(input)}"
puts "star two: #{star_two(input)}"
