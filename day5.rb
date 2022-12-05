def read_grid(input)
    info = ""
    input.each_line do |line|
        break if line === "\n"
        info += line
    end
    info = info.lines
    cols = info.pop.strip().split('   ').length
    rows = info.length

end

def star_one(input)
    grid = read_grid(input)

    input.each_line do |line|
        next
    end

    return nil
end

def star_two(input)

end

input = File.read("input/5_mini")
print "star one: ", star_one(input)
puts
print "star two: ", star_two(input)
