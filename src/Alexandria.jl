module Alexandria

export skipnan

greet() = print("Hello World!")

"""
    skipnan(itr)

Return an iterator over the elements in itr skipping NaN values.

Use `collect` to obtain an `Array` containing the non-`NaN` values in
`itr`. Note that even if `itr` is a multidimensional array, the result
will always be a `Vector` since it is not possible to remove `NaN`s
while preserving dimensions of the input.

# Examples

```julia-repl

julia> sum(skipnan([1, NaN, 2]))
3.0

julia> collect(skipnan([1, NaN, 2]))
2-element Array{Float64,1}:
 1.0
 2.0

julia> collect(skipnan([1 NaN; 2 NaN]))
2-element Array{Float64,1}:
 1.0
 2.0

```
"""
skipnan(x) = Iterators.filter(!isnan, x)


end # module
