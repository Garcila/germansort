# Sort the array from lowest to highest
# def sort(arr)
#   arr.sort
# end

def germansort(arr)
    if arr.count <= 1
      return arr
    end

    mid = arr.count / 2
    part_a = germansort arr.slice(0, mid)
    part_b = germansort arr.slice(mid, arr.count - mid)

    arr = []
    offset_a = 0
    offset_b = 0
    while offset_a < part_a.count && offset_b < part_b.count
        a = part_a[offset_a]
        b = part_b[offset_b]

        if a <= b
            arr << a
            offset_a += 1
        else
            arr << b
            offset_b += 1
        end
    end

    while offset_a < part_a.count
        arr << part_a[offset_a]
        offset_a += 1
    end

    while offset_b < part_b.count
        arr << part_b[offset_b]
        offset_b += 1
    end

    return arr
end

# Find the maximum 
def maximum(arr)
  germansort(arr).last
end

def minimum(arr)
  germansort(arr).first
end
 
# expect it to return 42 below
result = maximum([2, 42, 22, 02])
puts "max of 2, 42, 22, 02 is: #{result}"

# expect it to return 2 below
result = minimum([2, 42, 22, 02])
puts "min of 2, 42, 22, 02 is: #{result}"

 
# expect it to return nil when empty array is passed in
result = maximum([])
puts "max on empty set is: #{result.inspect}"
result = minimum([])
puts "min on empty set is: #{result.inspect}"
 
result = maximum([-23, 0, -3])
puts "max of -23, 0, -3 is: #{result}"
 
result = maximum([6])
puts "max of just 6 is: #{result}"