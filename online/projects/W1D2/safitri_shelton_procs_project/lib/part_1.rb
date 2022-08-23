def my_map(arr, &blk)
    new_arr = []
    arr.each do |n|
        new_arr << blk.call(n)
    end
    new_arr
end

def my_select(arr, &blk)
    new_arr = []
    arr.each do |n|
        new_arr << n if blk.call(n)
    end
    new_arr
end

def my_count(arr, &blk)
    count = 0
    arr.each do |n|
        count += 1 if blk.call(n)
    end
    count
end

def my_any?(arr, &blk)
    count = 0
    arr.each do |n|
        count += 1 if blk.call(n)
    end
    count > 0
end

def my_all?(arr, &blk)
    new_arr = []
    arr.each do |n|
        new_arr << n if blk.call(n)
    end
    new_arr.length == arr.length
end

def my_none?(arr, &blk)
    new_arr = []
    arr.each do |n|
        new_arr << n if blk.call(n)
    end
    new_arr.length == 0
end