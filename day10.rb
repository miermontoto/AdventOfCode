# Advent of Code 2022, day 10

def star_one(input)
    reg = 1
    cycle = 1
    target = 20
    sum = 0

    input.each_line do |line|
        instruction = line.split.first
        number = line.split.last.to_i

        case instruction
        when 'noop'
            add = 1
        when 'addx'
            reg += number
            add = 2
        end

        cycle += add
        target -= add
        if target <= 0 then
            if instruction == 'addx' and target == -1 then
                sum += (reg - number) * cycle
            else
                sum += reg * cycle
            end
            target = 40
        end
    end
    sum
end

def star_two(input)
end

input = File.read("input/10")
puts "star one: #{star_one(input)}"
puts "star two: #{star_two(input)}"
