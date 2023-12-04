# Advent of Code 2022, day 6

def star(input, size)
    input.chars.each_cons(size).with_index do |buffer, i|
        return i + size if buffer.length == buffer.uniq.length
    end
end

input = File.read("input/6")
puts "star one: #{star(input, 4)}"
puts "star two: #{star(input, 14)}"
