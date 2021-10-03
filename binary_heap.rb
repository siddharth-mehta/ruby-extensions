class MaxHeap
    def initialize(list = [])
        @array = list
        create_heap()
    end

    # Public Interface
    
    def insert(value)
        @array << value
        create_heap()
    end

    def delete_max
        @array[0] = @array[@array.length - 1]
        @array.delete_at(@array[@array.length - 1])
        fix_one_error(0)
    end

    def get_max
        @array[0]
    end

    # Private Interface

    def create_heap
        last_non_leaf_index = (@array.length / 2) - 1

        index = last_non_leaf_index
        while index >= 0
            fix_one_error(index)
            index -= 1
        end
    end

    def fix_one_error(index)
        return if leaf?(index)
        return if (!left_child(index).nil? and @array[index] >= left_child(index)) and (!right_child(index).nil? and @array[index] > right_child(index))

        if !left_child(index).nil? and @array[index] < left_child(index)
            swap(index, left_child_index(index))
            fix_one_error(left_child_index(index))
        elsif !right_child(index).nil? and @array[index] < right_child(index)
            swap(index, right_child_index(index))
            fix_one_error(right_child_index(index))
        end
    end

    def leaf?(index)
        index >= (@array.length/2)
    end

    def left_child(index)
        @array[left_child_index(index)]
    end
    
    def left_child_index(index)
        2 * index + 1
    end

    def right_child(index)
        @array[right_child_index(index)]
    end

    def right_child_index(index)
        2 * index + 2
    end

    def swap(index1, index2)
        temp = @array[index1]
        @array[index1] = @array[index2]
        @array[index2] = temp
    end
end