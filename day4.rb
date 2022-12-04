def get_ranges(pair)
    first = pair.split(',')[0].split('-').map(&:to_i)
    second = pair.split(',')[1].split('-').map(&:to_i)

    first_range = first[0]..first[1]
    second_range = second[0]..second[1]

    return first_range, second_range
end

def star_one(input)
    total = 0

    input.each_line do |pair|
        first, second = get_ranges(pair)

        if first.cover? second.begin and first.cover? second.end then total += 1
        elsif second.cover? first.begin and second.cover? first.end then total += 1 end
    end

    return total
end

def star_two(input)
    total = 0

    input.each_line do |pair|
        first, second = get_ranges(pair)

        if first.cover? second.begin or second.cover? first.begin then total += 1 end
    end

    return total
end

input = File.read("input/4")
print "star one: ", star_one(input)
puts
print "star two: ", star_two(input)
