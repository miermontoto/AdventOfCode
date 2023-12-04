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
                cycle += 1
            when 'addx'
                reg += number
                cycle += 2
        end

        if cycle >= target then
            if instruction == 'addx' and target != cycle then
                sum += (reg - number) * target
            else
                sum += reg * target
            end
            target += 40
        end
    end
    sum
end

def draw(cycle, pos)
    head = cycle % 40
    ((head >= pos) and (head <= (pos + 2))) ? print("#") : print(".")
    if head == 0 then puts end

end

def star_two(input)
    cycle = 1
    pos = 1

    number = 0
    instruction = "null"

    i = 0
    while i < input.lines.length do
        draw(cycle, pos)
        if instruction == "addx" then
            pos += number
            instruction = "null"
        else
            line = input.lines[i]
            instruction = line.split.first
            number = line.split.last.to_i
            i += 1
        end

        cycle += 1
    end
end

input = File.read("input/10")
puts "star one: #{star_one(input)}"
puts "star two:\n"
star_two(input)
