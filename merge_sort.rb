def merge_sort(arr)
    size = arr.size
    temp_array = Array.new(size, 0)

    merge_sort_util(arr, temp_array, 0, size - 1)

end

def merge_sort_util(arr, temp_array, lower_index, upper_index)
    if lower_index >= upper_index
        return
    end

    middle_index = (lower_index + upper_index) / 2
    merge_sort_util(arr, temp_array, lower_index, middle_index)
    merge_sort_util(arr, temp_array, middle_index + 1, upper_index)

    merge(arr, temp_array, lower_index, middle_index, upper_index)
end

def merge(arr, temp_array, lower_index, middle_index, upper_index)
    lower_start = lower_index
    lower_stop = middle_index

    upper_start = middle_index + 1
    upper_stop = upper_index

    count = lower_index

    while lower_start <= lower_stop and upper_start <= upper_stop
        if arr[lower_start] < arr[upper_start]
            temp_array[count] = arr[lower_start]
            count += 1
            lower_start += 1
        else
            temp_array[count] = arr[upper_start]
            count += 1
            upper_start += 1
        end    
    end

    while lower_start <= lower_stop
        temp_array[count] = arr[lower_start]
        count += 1
        lower_start += 1        
    end

    while upper_start <= upper_stop
        temp_array[count] = arr[upper_start]
        count += 1
        upper_start += 1        
    end

    i = lower_index

    while i <= upper_index
        arr[i] = temp_array[i]
        i += 1
    end
    return arr
end

p merge_sort([105, 79, 100, 110])