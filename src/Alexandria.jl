module Alexandria

export skipnan, db2pow, pow2db, mag2db, db2mag, member

"""
    skipnan(itr)

Return an iterator over the elements in `itr` skipping `NaN` values.

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
skipnan(itr) = Iterators.filter(!isnan, itr)


"""
    db2pow(ydb)
Convert decibels to power
"""
db2pow(ydb::Real) = 10^(ydb/10)

"""
    pow2db(y)
Convert power to decibels.
"""
pow2db(y::Real) = 10log10(y)

"""
    mag2db(y)
Convert magnitude to decibels.
"""
mag2db(y::Real) = 20log10(y)

"""
    db2mag(ydb)
Convert decibels to magnitude.
"""
db2mag(ydb::Real) = 10^(ydb/20)

"""
    member(needle, haystack)

Returns `true` if `haystack` contains `needle`.
"""
function member(needle, haystack)
    !isnothing(findfirst(x -> x == needle, haystack))
end


end # module
