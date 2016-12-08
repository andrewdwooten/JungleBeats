require "minitest/autorun"
require "minitest/pride"
require_relative  'JungleBeatClasses'

class NodeTest < MiniTest::Test
    def test_is_it_a_node
        node = Node.new("whoop")
        assert_equal Node, node.class
    end

    def test_what_is_the_data
        node = Node.new("plop")
        assert_equal "plop", node.data
    end

    def test_what_is_the_next_node
        node = Node.new("bap")
        assert_equal nil, node.next_node
    end

    def test_can_two_nodes_link
        node = Node.new("bap")
        node_2 = Node.new("bop")
        node.next_node = node_2
        assert_equal node_2, node.next_node
        assert_equal "bop", node.next_node.data
    end

    def test_can_four_nodes_link
        node = Node.new("bippity")
        node_2 = Node.new("boppity")
        node_3 = Node.new("boo")
        node_4 = Node.new("callamazoo")
        node.next_node = node_2
        node_2.next_node = node_3
        node_3.next_node = node_4
        assert_equal "boo", node.next_node.next_node.data
        assert_equal "callamazoo", node_2.next_node.next_node.data
    end
        
end

class LinkedListTest < MiniTest::Test

    def test_is_it_a_list
        list = LinkedList.new
        assert_equal LinkedList, list.class
    end

    def test_whats_in_the_head
        list = LinkedList.new
        assert_equal nil, list.head
    end

    def test_does_the_head_hold_data
        list = LinkedList.new
        list.append("whoop")
        assert_equal "whoop", list.head.data
    end

    def test_does_nil_head_accept_appendages
        list = LinkedList.new
        list.append("doop")
        assert_equal "doop", list.head.data
    end
    
    def test_does_list_with_full_head_accept_appendages
        list = LinkedList.new
        list.append("hoop")
        list.append("schoop")
        assert_equal "schoop", list.head.next_node.data
    end

    def test_count_list_with_only_head
        list = LinkedList.new
        list.append("ska-doosh")
        assert_equal 1, list.count
    end

    def test_count_list_with_multiple_nodes
        list = LinkedList.new
        list.append("ska-pow")
        list.append("wha-boom")
        list.append("bang")
        assert_equal 3, list.count
    end

    def test_will_list_output_string
        list = LinkedList.new
        list.append("flim")
        list.append("flam")
        assert_equal "flim flam", list.to_string
    end

    def test_will_list_output_5_nodes_to_string
        list = LinkedList.new
        list.append("I")
        list.append("really")
        list.append("need")
        list.append("a")
        list.append("Monster")
        assert_equal "I really need a Monster", list.to_string
    end

    def test_will_counter_count_appendages
        list = LinkedList.new
        list.append("crash")
        list.append("bam")
        list.append("bing")
        list.append("boop")
        assert_equal 4, list.count
    end

    def test_will_list_output_fixnum_data_as_string
        list = LinkedList.new
        list.append(4)
        assert_equal "4", list.to_string
    end 
    
    def test_will_populated_list_allow_prepend
        list = LinkedList.new
        list.append(1)
        list.append(2)
        list.append(3)
        list.prepend(4)
        assert_equal 4, list.head.data
    end

    def test_will_item_insert_into_empty_list
        list = LinkedList.new
        list.insert(4, "schablayammm")
        assert_equal "schablayammm", list.head.data
    end

    def test_will_item_insert_into_head_only_list
        list = LinkedList.new
        list.append("larp")
        list.insert(1, "boop")
        assert_equal "boop", list.head.next_node.data
    end

    def test_will_item_insert_into_populated_list
        list = LinkedList.new
        list.append("boop")
        list.append("doop")
        list.append("koop")
        list.insert(2, "hoop")
        assert_equal 4, list.count
        assert_equal "hoop", list.head.next_node.next_node.data
    end

    def test_will_item_with_out_of_bounds_reference_insert_into_list
        skip
        list = LinkedList.new
        list.append("boop")
        list.append("doop")
        list.append("koop")
        list.insert(5, "hoop")
        assert_equal 4, list.count
        assert_equal "hoop", list.head.next_node.next_node.data
    end

    def test_can_we_find_items_two_through_four
        list = LinkedList.new
        list.append("joy")
        list.append("anger")
        list.append("sadness")
        list.append("fear")
        list.append("glee")
        assert_equal "anger sadness fear ", list.find(2,4)
    end

    def test_can_we_detect_item
        list = LinkedList.new
        list.append("hip")
        list.append("hop")
        list.append("hep")
        assert_equal true, list.includes?('hip')
        assert_equal false, list.includes?('boop')
    end

    def test_can_we_detect_lack_of_item
        list = LinkedList.new
        list.append("hip")
        list.append("hop")
        list.append("hep")
        assert_equal false, list.includes?('bloomingdales')
    end

    def test_can_we_remove_the_last_node
        list = LinkedList.new
        list.append("POW")
        list.append("BANG")
        list.append("BLAMM")
        list.append("KRUNCH")
        assert_equal "KRUNCH", list.pop
        assert_equal "BLAMM", list.pop
    end
end

class JungleBeatTest < MiniTest::Test

    def test_is_it_a_Jungle_Beat
        jb = JungleBeat.new
        assert_equal JungleBeat, jb.class
    end

    def test_is_a_list_in_a_new_Jungle_Beat
        jb = JungleBeat.new
        assert_equal LinkedList, jb.list.class
    end

    def test_does_the_Jungle_Beat_have_a_head
        jb = JungleBeat.new
        assert_equal nil , jb.list.head
    end

    def test_can_we_append_to_Jungle_Beat
    end

end


