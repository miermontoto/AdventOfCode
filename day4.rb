def get_ranges(pair)
    first = pair.split(',')[0].split('-').map(&:to_i)
    second = pair.split(',')[1].split('-').map(&:to_i)

    first_range = first[0]..first[1]
    second_range = second[0]..second[1]

    return first_range, second_range
end

class Range
    def overlaps?(other)
        return (self.cover? other.begin or other.cover? self.begin)
    end

    def encapsulates?(other)
        return (self.begin <= other.begin and other.end <= self.end)
    end
end

def star_one(input)
    total = 0

    input.each_line do |pair|
        first, second = get_ranges(pair)
        total += 1 if first.encapsulates? second or second.encapsulates? first
    end

    return total
end

def star_two(input)
    total = 0

    input.each_line do |pair|
        first, second = get_ranges(pair)
        total += 1 if first.overlaps? second
    end

    return total
end

input = File.read("input/4")
print "star one: ", star_one(input)
puts
print "star two: ", star_two(input)
