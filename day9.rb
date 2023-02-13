# Advent of Code 2022, day 9

class Piece
    def initialize()
        @x = 0
        @y = 0
        @log = [[@x, @y]]
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
        (other.x - self.x).abs <= 1 and (other.y - self.y).abs <= 1
    end

    def move(dir)
        case dir
        when 'U'
            @y = self.y + 1
        when 'D'
            @y = self.y - 1
        when 'L'
            @x = self.x - 1
        when 'R'
            @x = self.x + 1
        end

        @log.push([self.x, self.y])
    end

    def set_pos(x, y)
        @x = x
        @y = y
    end
end


def star_one(input)
    head = Piece.new()
    tail = Piece.new()

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
    tail.log.uniq.count
end

def star_two(input)
    knots = 10
    pieces = []
    possible_dir = ['U', 'D', 'L', 'R']
    reverse_dir = ['D', 'U', 'R', 'L']

    knots.times do
        pieces.push(Piece.new())
    end

    input.each_line do |line|
        dir = line.split.first
        times = line.split.last.to_i

        times.times do
            pieces.each_with_index do |piece, i|
                if i == 0
                    piece.move(dir)
                    next
                end

                if not piece.touching?(pieces[i - 1])
                    piece.set_pos(pieces[i - 1].x, pieces[i - 1].y)
                    piece.move(reverse_dir[possible_dir.index(dir)])
                end
            end
        end
    end

    pieces.last.log.uniq.count
end

input = File.read("input/9")
puts "star one: #{star_one(input)}"
puts "star two: #{star_two(input)}" # TODO: fix
