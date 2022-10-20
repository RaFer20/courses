=begin
As we saw in the previous exercises, a matrix can be represented in ruby by an Array of Arrays. For example:
1  5  8
4  7  2
3  9  6

can be described by the Array of Arrays:
matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

A 90-degree rotation of a matrix produces a new matrix in which each side of the matrix is rotated clockwise by 90 degrees. 
For example, the 90-degree rotation of the matrix shown above is:
3  4  1
9  7  5
6  2  8

A 90 degree rotation of a non-square matrix is similar. For example, the rotation of:
3  4  1
9  7  5
is:
9  3
7  4
5  1

Write a method that takes an arbitrary matrix and rotates it 90 degrees clockwise as shown above.

Examples

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2
##########################################################
Input: Matrix
Output: Rotated Matrix

Explicit Rules:

Implicit Rules:
The amount of columns will become the amount of row and vice versa in the return
Each element in the first row will become the last element of every consecutive row

Assumption:
row and columns could be different lengths

Data Structures:
Arrays

Algorithm
Initialize a `result` empty array
Iterate from the length of the last element in the matrix minus one down to 0
-Initialize a 'row' variable as an empty array
-Iterate from 0 up to the matrix size minus 1
--On each iteration prepend the last value of each row to `row`
-Prepend `row` to `result`
Return `result`

=end

def rotate90(matrix)
  result = []
  (matrix.last.size-1).downto(0) do |column_idx|
    row = []
     0.upto(matrix.size-1){|row_idx| row.prepend(matrix[row_idx][column_idx])}
    result.prepend(row)
  end
  result
end

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2

## Futher Exploration
## Can you modify your solution to perform 90, 180, 270, and 360 degree rotations based on an argument?

def rotate90(matrix)
  result = []
  (matrix.last.size-1).downto(0) do |column_idx|
    row = []
     0.upto(matrix.size-1){|row_idx| row.prepend(matrix[row_idx][column_idx])}
    result.prepend(row)
  end
  result
end

def rotate(matrix, degrees)
  rotations = (degrees/90)
  result = []
  (matrix.last.size-1).downto(0) do |column_idx|
    row = []
    0.upto(matrix.size-1){|row_idx| row.prepend(matrix[row_idx][column_idx])}
    result.prepend(row)
  end

  if rotations > 1
    while rotations > 1
    result = rotate90(result)
    rotations -= 1
    end
  end
  result
end

p rotate(matrix1, 90) == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p rotate(matrix1, 360) == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
p rotate(matrix2, 180)

##Counter-clockwise
# def rotate90(matrix)
#   result = []
#   (matrix.last.size-1).downto(0) do |column_idx|
#     row = []
#      0.upto(matrix.size-1){|row_idx| row << matrix[row_idx][column_idx]}
#     result << row
#   end
#   result
# end
