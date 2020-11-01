"""
    MyArray{T,N}

    My super awesome array wrapper!

    # Fields
    # - `data::AbstractArray{T,N}`: stores the array being wrapped
    # - `metadata::Dict`: stores metadata about the array
"""
struct MyArray{T,N} <: AbstractArray{T,N}
    data::AbstractArray{T,N}
    metadata::Dict
end

"""
    mysearch(array::MyArray{T}, val::T; verbose=true) where {T} -> Int

    Searches the `array` for the `val`. For some reason we don't want to use Julia's
    builtin search :)

    # Arguments
    # - `array::MyArray{T}`: the array to search
    # - `val::T`: the value to search for
    #
    # # Keywords
    # - `verbose::Bool=true`: print out progress details
    #
    # # Returns
    # - `Int`: the index where `val` is located in the `array`
    #
    # # Throws
    # - `NotFoundError`: I guess we could throw an error if `val` isn't found.
"""
function mysearch(array::AbstractArray{T}, val::T) where T
    nothing
end

"""
    Manager(args...; kwargs...) -> Manager

    A cluster manager which spawns workers.

    # Arguments
    #
    # - `min_workers::Integer`: The minimum number of workers to spawn or an exception is thrown
    # - `max_workers::Integer`: The requested number of workers to spawn
    #
    # # Keywords
    #
    # - `definition::AbstractString`: Name of the job definition to use. Defaults to the
    #     definition used within the current instance.
    #     - `name::AbstractString`: ...
    #     - `queue::AbstractString`: ...
"""
function Manager(...)
    nothing
end
