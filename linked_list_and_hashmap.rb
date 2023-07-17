#here is an example of a linked list and hashmap

#linked list

class Node
    attr_accessor :value, :next_node

    def initialize(value, next_node = nil)
        @value = value
        @next_node = next_node
    end
end

class LinkedList
    attr_accessor :head, :tail

    def initialize(head = nil, tail = nil)
        @head = head
        @tail = tail
    end

    # add a node to the end of the list
    def append(value)
        if @head == nil
            @head = Node.new(value)
            @tail = @head
        else
            @tail.next_node = Node.new(value)
            @tail = @tail.next_node
        end
    end
    # add a node to the beginning of the list
    def prepend(value)
        if @head == nil
            @head = Node.new(value)
            @tail = @head
        else
            @head = Node.new(value, @head)
        end
    end
    # add a node at a specific index
    def size
        if @head == nil
            return 0
        else
            count = 1
            current_node = @head
            while current_node.next_node != nil
                count += 1
                current_node = current_node.next_node
            end
            return count
        end
    end
    
    def head
        return @head
    end

    def tail
        return @tail
    end

    def at(index)
        if index >= self.size
            return "index out of range"
        else
            count = 0
            current_node = @head
            while count != index
                current_node = current_node.next_node
                count += 1
            end
            return current_node
        end
    end

    def pop
        if @head == nil
            return "list is empty"
        else
            current_node = @head
            while current_node.next_node != @tail
                current_node = current_node.next_node
            end
            current_node.next_node = nil
            @tail = current_node
        end
    end

    def contains?(value)
        if @head == nil
            return false
        else
            current_node = @head
            while current_node != nil
                if current_node.value == value
                    return true
                end
                current_node = current_node.next_node
            end
            return false
        end
    end

    def find(value)
        if @head == nil
            return
        else
            current_node = @head
            count = 0
            while current_node != nil
                if current_node.value == value
                    return count
                end
                current_node = current_node.next_node
                count += 1
            end
            return nil
        end
    end

    def to_s
        if @head == nil
            return
        else
            current_node = @head
            while current_node != nil
                print "( #{current_node.value} ) -> "
                current_node = current_node.next_node
            end
            print "nil"
        end
    end

    def insert_at(value, index)

        if index >= self.size
            return "index out of range"
        elsif index == 0
            self.prepend(value)
        else
            current_node = @head
            count = 0
            while count != index - 1
                current_node = current_node.next_node
                count += 1
            end
            current_node.next_node = Node.new(value, current_node.next_node)
        end
    end

    def remove_at(index)

        if index >= self.size
            return "index out of range"
        elsif index == 0
            @head = @head.next_node
        else
            current_node = @head
            count = 0
            while count != index - 1
                current_node = current_node.next_node
                count += 1
            end
            current_node.next_node = current_node.next_node.next_node
        end
    end

end

#hashmap

class Hashmap
    attr_accessor :map

    def initialize()
        @map = []
    end

    def set(key, value)
        index = self.hash(key, self.map.length)
        if self.map[index] == nil
            self.map[index] = [[key, value]]
        else
            self.map[index].each do |pair|
                if pair[0] == key
                    pair[1] = value
                    return
                end
            end
            self.map[index].push([key, value])
        end
    end

    def get(key)
        index = self.hash(key, self.map.length)
        if self.map[index] == nil
            return "key not found"
        else
            self.map[index].each do |pair|
                if pair[0] == key
                    return pair[1]
                end
            end
            return "key not found"
        end
    end

    def delete(key)
        index = self.hash(key, self.map.length)
        if self.map[index] == nil
            return "key not found"
        else
            self.map[index].each do |pair|
                if pair[0] == key
                    self.map[index].delete(pair)
                    return
                end
            end
            return "key not found"
        end
    end

    def show
        self.map.each do |bucket|
            if bucket != nil
                bucket.each do |pair|
                    puts "#{pair[0]} => #{pair[1]}"
                end
            end
        end
    end

    def hash(key, size)
        return key.hash % size
    end
end

#testing

list = LinkedList.new
list.append(1)
list.append(2)
list.append(3)
list.prepend(0)
puts 'list size:'
puts list.size
puts 'list head:'
puts list.head.value
puts list.tail.value
puts list.at(2).value
puts list.contains?(3)
puts list.find(2)
list.pop
puts list.contains?(3)
puts list.to_s
list.insert_at(3, 2)
puts list.to_s
list.remove_at(2)
puts list.to_s

map = Hashmap.new
map.set("a", 1)
map.set("b", 2)
map.set("c", 3)
map.set("d", 4)
map.set("e", 5)
map.set("f", 6)

map.show

puts map.get("a")
puts map.get("b")
puts map.get("c")
puts map.get("d")
puts map.get("e")
puts map.get("f")

map.delete("a")

map.show

puts map.get("a")

map.delete("b")

map.show

puts map.get("b")

map.delete("c")

map.show

puts map.get("c")

map.delete("d")

map.show

puts map.get("d")

map.delete("e")

map.show

puts map.get("e")

map.delete("f")

map.show

puts map.get("f")

