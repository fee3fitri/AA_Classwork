# ----- matrix_addition_reloaded -----
# Write a method matrix_addition_reloaded that accepts any number of matrices 
# as arguments. The method should return a new matrix representing the sum of the
# arguments. Matrix addition can only be performed on matrices of similar dimensions,
# so if all of the given matrices do not have the same "height" and "width", then
# return nil.

def matrix_addition(mtx1, mtx2)
  height = mtx1.length
  width = mtx1[0].length
  result = Array.new(height) { [] * width }

  (0...height).each do |x|
    (0...width).each do |y|
      result[x][y] = mtx1[x][y] + mtx2[x][y]
    end
  end

  result

  #[[m1[0][0]+m2[0][0], m1[0][1]+m2[0][1]], [m1[1][0]+m2[1][0], m1[1][1]+m2[1][1]],
  #[m1[2][0]+m2[2][0], m1[2][1]+m2[2][1]]]
end

def matrix_addition_reloaded(*matrices)
  matrix = matrices[0]
  height = matrix.length
  width = matrix[0].length
  result = Array.new(height) { [0] * width }

  matrices.inject(result) do |mtx1, mtx2|
    return nil if mtx2.length != height || mtx2[0].length != width
    matrix_addition(mtx1, mtx2) 
  end
end

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
# p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
# p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
# p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil


# ----- squarocol? -----
# Write a method squarocol? that accepts a 2-dimensional array as an argument. 
# The method should return a boolean indicating whether or not any row or column is 
# completely filled with the same element. 
# You may assume that the 2-dimensional array has "square" dimensions, 
# meaning it's height is the same as it's width.


def squarocol?(grid)
  return true if grid.any? { |row| row.uniq.length == 1}
  return true if grid.transpose.any? { |col| col.uniq.length == 1}
  false
end
  
  # p squarocol?([
  #     [:a, :x , :d],
  #     [:b, :x , :e],
  #     [:c, :x , :f],
  # ]) # true
  
  # p squarocol?([
  #     [:x, :y, :x],
  #     [:x, :z, :x],
  #     [:o, :o, :o],
  # ]) # true
  
  # p squarocol?([
  #     [:o, :x , :o],
  #     [:x, :o , :x],
  #     [:o, :x , :o],
  # ]) # false
  
  # p squarocol?([
  #     [1, 2, 2, 7],
  #     [1, 6, 6, 7],
  #     [0, 5, 2, 7],
  #     [4, 2, 9, 7],
  # ]) # true
  
  # p squarocol?([
  #     [1, 2, 2, 7],
  #     [1, 6, 6, 0],
  #     [0, 5, 2, 7],
  #     [4, 2, 9, 7],
  # ]) # false


def pascals_triangle(num)
  base = [[1]]

  while base.length < num
    previous_level = base[-1]
    next_level = [1]
    next_level += triangle_sum(previous_level)
    next_level << 1
    base << next_level
  end

  base
end

def triangle_sum(arr)
  new_arr = []
  (0...arr.length - 1).each do |i|
      new_arr << arr[i] + arr[i + 1]
  end
  new_arr
end

p pascals_triangle(5)
[
    [1],
    [1, 1],
    [1, 2, 1],
    [1, 3, 3, 1],
    [1, 4, 6, 4, 1]
]

p pascals_triangle(7)
[
    [1],
    [1, 1],
    [1, 2, 1],
    [1, 3, 3, 1],
    [1, 4, 6, 4, 1],
    [1, 5, 10, 10, 5, 1],
    [1, 6, 15, 20, 15, 6, 1]
]