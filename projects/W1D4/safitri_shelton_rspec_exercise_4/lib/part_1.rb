def my_reject(arr, &prc)
    arr.select { |n| !prc.call(n) }
end

def my_one?(arr, &prc)
    new_arr = arr.select { |n| prc.call(n) }
    new_arr.length == 1
end

def hash_select(hash, &prc)
    new_hash = {}
    hash.each do |k, v|
        new_hash[k] = v if prc.call(k, v)
    end
    new_hash
    
end

def xor_select(arr, blk1, blk2)
    arr.select { |n| (blk1.call(n) || blk2.call(n)) and !(blk1.call(n) && blk2.call(n)) }
end

def proc_count(val, arr)
    count = 0
    (0...arr.length).each do |i|
         count += 1 if arr[i].call(val)
    end
    count
end