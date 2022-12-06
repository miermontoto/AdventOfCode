def star_one(input)
    max = 0
    sum = 0

    input.each_line do |line|
        if line == "\n" then
            max = [max, sum].max
            sum = 0
            next
        end
        sum += line.to_i
    end

    return max
end

def star_two(input)
    top = Array.new(3, 0)
    sum = 0

    input.each_line do |line|
        if line == "\n" then
            if sum > top.min then
                top[top.length - 1] = sum
                top.sort!.reverse!
            end
            sum = 0
            next
        end
        sum += line.to_i
    end


    return top.sum
end

input = File.read("input/1")
puts "star one: #{star_one(input)}"
puts "star two: #{star_two(input)}"
