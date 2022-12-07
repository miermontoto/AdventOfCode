# Advent of Code 2022, day 7
class ResolvedDir
    @parent
    @name
    @content

    def initialize(parent, name)
        @parent = parent
        @name = name
        @content = []
    end

    def add(file)
        @content.push file if file.is_a? ResolvedDir or file.is_a? ResolvedFile
    end

    def content()
        @content
    end

    def name()
        @name
    end

    def children()
        temp = []
        @content.each do |file|
            temp.push file if file.is_a? ResolvedDir
        end
        temp
    end

    def all_children()
        temp = []
        @content.each do |file|
            if file.is_a? ResolvedDir
                temp.push file
                temp.concat file.all_children
            end
        end
        temp
    end

    def parent()
        @parent
    end

    def size()
        size = 0
        @content.each do |file|
            size += file.size
        end
        size
    end
end

class ResolvedFile
    @name
    @size

    def initialize(name, size)
        @name = name
        @size = size
    end

    def name()
        @name
    end

    def size()
        @size
    end
end

def read_filesystem(input)
    root = ResolvedDir.new(nil, "/")
    parent = root

    input = input.lines
    i = 1
    while i < input.length
        if input[i].start_with? "$ ls" then
            i += 1
            while i < input.length and not input[i].start_with? "$"
                data = input[i].split(" ")
                if data[0] == "dir" then
                    newfile = ResolvedDir.new(parent, data[1])
                else
                    newfile = ResolvedFile.new(data[1], data[0].to_i)
                end
                parent.add(newfile)
                i += 1
            end
        elsif input[i].start_with? "$ cd" then
            target_name = input[i].split(" ")[2]
            if target_name == ".." then parent = parent.parent
            else parent = parent.children.find { |dir| dir.name == target_name } end
            i += 1
        end
    end
    return root
end

def star_one(input)
    root = read_filesystem(input)
    root.all_children.map(&:size).select { |size| size < 100000 }.sum
end

def star_two(input)
    disk_size = 70000000
    update_size = 30000000
    root = read_filesystem(input)
    needed = update_size - (disk_size - root.size)

    root.all_children.sort_by(&:size).find { |dir| dir.size >= needed }.size
end

input = File.read("input/7")
puts "star one: #{star_one(input)}"
puts "star two: #{star_two(input)}"
