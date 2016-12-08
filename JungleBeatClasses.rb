class Node
    attr_reader :data
    attr_accessor :next_node, :current_node_number

    def initialize(data)
        @data = data
    end
end

class LinkedList
    attr_accessor :head, :node

    def initialize
        @head
        @node_count = 0
    end

    def append(appendage)
        appendage.to_s
        position = @head
        node = Node.new(appendage)
        if @head == nil
            @head = node
        else
            until position.next_node == nil
                position = position.next_node
            end
        position.next_node = node
        end
        appendage
        @node_count += 1
    end

    def count
        @node_count
    end

    def to_string
        list_contents = "#{nil}"
        position = @head
        list_contents << position.data.to_s
        until position.next_node.nil?
            list_contents << " #{(position.next_node.data).to_s}"
            position = position.next_node
        end
        list_contents
        
    end

    def prepend(prependee)
        displacements = @head
        @head = Node.new(prependee)
        @head.next_node = displacements
    end

    def insert(reference, insertee)
        insertion = Node.new(insertee)
        if @head == nil
            @head = insertion

        elsif @node_count == 1
            @head.next_node = insertion
        else
            counter = 1
            current_position = @head
            displaced_nodes = current_position.next_node
            until counter == reference
                current_position = current_position.next_node
                counter += 1
            end
        insertion.next_node = displaced_nodes
        current_position.next_node = insertion
        insertee
        @node_count +=1
        end
    end

    def find(start, how_many)
        list_contents = []
        position = @head
        list_contents << position.data.to_s
        until position.next_node.nil?
            list_contents << "#{(position.next_node.data).to_s} "
            position = position.next_node
        end
        found_contents = list_contents.values_at(((start) - 1 unless start == 0)..((how_many) - 1))
        final_found = found_contents.join
    end

    def includes?(search_item)
        search_item.to_s
        list_contents = []
        position = @head
        list_contents << position.data.to_s
        until position.next_node.nil?
            list_contents << "#{(position.next_node.data).to_s} "
            position = position.next_node
        end
        list_contents.include?(search_item)
    end

    def pop
        position = @head
        until position.next_node.next_node == nil
            position = position.next_node
        end
        popped = position.next_node.data
        position.next_node = nil
        popped
    end
end

class JungleBeat
    attr_accessor :list 

    def initialize
        @list = LinkedList.new
        temp = ##jb-list-[need to add first node at start]
    end

    def list
        @list = LinkedList.new
        #binding.pry
    end

    def append(appender)
        temp = jb.list
    end

end

