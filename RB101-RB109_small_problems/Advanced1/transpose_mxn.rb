=begin
In the previous exercise, you wrote a method to transpose a 3 x 3 matrix as represented by a ruby Array of Arrays.

Matrix transposes aren't limited to 3 x 3 matrices, or even square matrices. 
Any matrix can be transposed by simply switching columns with rows.

Modify your transpose method from the previous exercise so it works with any matrix with at least 1 row and 1 column.

Examples:

transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
transpose([[1]]) == [[1]]
######################################################################
Input: Matrix
Output: Transposed matrix

Explicit Rules:
Modify your transpose method from the previous exercise so it works with any matrix with at least 1 row and 1 column.

Implicit Rules:
The amount of elements in the first row will be the amount of rows in the output
The amount of rows in the matrix will be the amount of elements in each row

Algorithm
Initialize a result empty array
Iterate on numbers from 0 to the length of the first element in the array decreased by one, this is our column index
-Initialize a `row` to the value returned from iterating from 0 to the amount of elements in the matrix decreased by 1, this is our row index
--
-push row into result
Return Result
=end

def transpose(matrix)
  result = []
  (0..(matrix[0].size-1)).each do |column_idx|
    row = (0..(matrix.size-1)).map{|row_idx| matrix[row_idx][column_idx]}
    result << row
  end
  result
end

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]