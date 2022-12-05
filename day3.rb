# Advent of Code 2022, day 3

def get_letter_value(char) # if uppercase, the value would be negative, so adjust accordingly
    return char.ord - 96 < 0 ? char.ord - 38 : char.ord - 96
end

def star_one(input)
    total = 0

    input.each_line do |bag|
        first_half = bag[0, bag.size / 2].chars
        second_half = bag[bag.size / 2, bag.size].chars

        first_half.each do |item|
            if second_half.include? item then
                total += get_letter_value(item)
                break # supposing that there is only one item in common
            end
        end
    end

    return total
end

def star_two(input)
    total = 0

    input.each_line.each_slice(3) do |group|
        first = group[0].chars
        second = group[1].chars
        third = group[2].chars

        first.each do |item|
            next if item === "\n"
            if second.include? item and third.include? item then
                total += get_letter_value(item)
                break
            end
        end
    end

    return total
end


input = File.read("input/3")
puts "star one: #{star_one(input)}"
puts "star two: #{star_two(input)}"
