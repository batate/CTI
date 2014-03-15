defmodule QuickSort do
  def sort([]), do: []
  def sort([head|tail]) do
    sort( lc( x inlist tail, x < head, do: x) ) ++
    [head] ++ 
    sort( lc( x inlist tail, x > head, do: x) )
  end
end

IO.inspect QuickSort.sort([5, 6, 3, 2, 7, 8])
