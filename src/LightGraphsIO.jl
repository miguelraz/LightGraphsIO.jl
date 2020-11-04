module LightGraphsIO


using LightGraphs
using Parsers

abstract type AbstractGraphFormat end
struct DOTFormat <: AbstractGraphFormat end
struct EdgeListFormat <: AbstractGraphFormat end
struct GMLFormat <: AbstractGraphFormat end
struct NETFormat <: AbstractGraphFormat end
struct GEXFFormat <: AbstractGraphFormat end
struct Graph6Format <: AbstractGraphFormat end
struct GraphMLFormat <: AbstractGraphFormat end
struct CDFFormat <: AbstractGraphFormat end
struct LGCompressedFormat <: AbstractGraphFormat end

function write_file(io, file_name)
    open(file_name, "w") do f
        write(f, String(take!(io)))
    end
end

################ DOT

"""
    load_graph(file, ::Type{DOTFormat}) -> Union{SimpleGraph, SimpleDiGraph}

    Parses and produces a `file` written in the `DOTFormat`. 
    CAVEAT:
    * Parses simple directed and undirected graphs.
    * Assumes 1 graph per file (for now)
    * Please sponsor/PR/file issues for more parsing support.

    # Arguments
    # - `file`: the file were the graph is written
    # - `DOTFormat`: DOT graph format
    #
    # # Returns
    # - `g`: a simple un/directed LightGraphs.jl graph
"""
function load_graph(file, ::Type{DOTFormat})
    if occursin("digraph", readline(file))
        _load_graph(SimpleDiGraph(0), DOTFormat, file)
    else
        _load_graph(SimpleGraph(0), DOTFormat, file)
    end
    return nothing    
end

### Jacob Says:
# I'd be happy to talk through things. It sounds like Parsers.jl (https://github.com/JuliaData/Parsers.jl)
# could be helpful, though I know it can be a bit intimidating to dive into.
#
# Basically you can create a Parsers.Options with the config you want (e.g. delim='\t', comment="#" )
# then you would call Parsers.xparse , which is the internal (yet part of the public API)
# method that Parsers.parse and Parsers.tryparse call. 
#
# For best performance, I'd recommend Mmap.mmap(file) you get a Vector{UInt8}, then pass that to xparse .
# You can see an example of how CSV.jl uses xparse directly for parsing column names from a file:
# https://github.com/JuliaData/CSV.jl/blob/master/src/detection.jl#L231.
#
# Anyway, that's probably enough to get started, but happy to chat if something doesn't make sense.

### Jacob also says
# One last thing that's probably helpful; xparse won't throw any errors (by design),
# but you get back a code return value.
#
# It's a bitmask of basically everything that happened while parsing and whether it ran into problems or whatnot.
#
# The documented codes are here:
# https://github.com/JuliaData/Parsers.jl/blob/ab5ef1bbdc81fe8ee979a5b287ea065d991ba0ce/src/utils.jl#L44.
#
# In particular, you can check Parsers.newline(code) to see if a newline was encountered while parsing
# to know if you hit the end of the line.


function _load_graph(g::SimpleGraph, ::Type{DOTFormat}, file)
    # 1. Create a Parsers.Options with the right presets
    # 2. Mmap the file (Mmap.mmap(file)) to get a Vector{UInt8}
    # 3. Pass that to Parsers.xparse
    # 4. Throw errors appropriately with the returned bytecode value
    return nothing 
end

function _load_graph(g::SimpleDiGraph, ::Type{DOTFormat}, file)
    return nothing
end

function write_graph(g::SimpleGraph, ::Type{DOTFormat}, file_name="graph.dot", graph_name="")
    io = IOBuffer()
    println(io, "graph ", graph_name == "" ? '{' : string(graph_name, " {"))
    for e in edges(g)
        source = string(src(e))
        dest = string(dst(e))
        println(io, '\t', source, " -- ", dest)
    end
    write(io, '}')
    write_file(io, file_name)
end
    
function write_graph(g::SimpleDiGraph, ::Type{DOTFormat}, file_name="digraph.dot", graph_name="")
    io = IOBuffer()
    println(io, "digraph ", graph_name == "" ? '{' : string(graph_name, " {"))
    for v in vertices(g)
        out_nbrs = outneighbors(g, v)
        length(out_nbrs) == 0 && continue
        println(io, '\t', string(v), " -> {", join(out_nbrs, ','), '}')
    end
    write(io, '}')
    write_file(io, file_name)
    return nothing
end

################ EdgeList
function load_graph(file, ::Type{EdgeListFormat})
    2
end

function write_graph(g, ::Type{EdgeListFormat}, file_name="graph.edgelist")
    io = IOBuffer()
    for e in edges(g)
        println(io, join((src(e), dst(e)), ','))
    end
    write_file(io, filename)
    return nothing
end


################ GML
function load_graph(file, ::Type{GMLFormat})
    3
end

function write_graph(g, ::Type{GMLFormat}, file_name="graph.gml", graph_name="")
    io = IOBuffer()
    println(io, "graph\n[")
    length(graph_name) > 0 && println(io, "label ", graph_name)
    is_directed(g) && println(io, "directed 1")
    for i in 1:nv(g)
        println(io, "\tnode")
        println(io, "\t[")
        println(io, "\t\tid ",i)
        println(io, "\t]")
    end
    for e in LightGraphs.edges(g)
        s, t = Tuple(e)
        println(io, "\tedge")
        println(io, "\t[")
        println(io, "\t\tsource ", s)
        println(io, "\t\ttarget ", t)
        println(io, "\t]")
    end
    write(io, ']')
    write_file(io, file_name)
    return nothing
end


################ NET
function load_graph(file, ::Type{NETFormat})
    4
end

function write_graph(g, ::Type{NETFormat}, file_name="graph.net")
    io = IOBuffer()
    println(io, "*Vertices ", nv(g))
    println(io, is_directed(g) ? "*Arcs" : "*Edges")
    for e in edges(g)
        println(io, src(e), ' ', dst(e))
    end
    write_file(io, (is_directed(g) ? "di" : "") * file_name)
    return nothing
end

############### GEXF 
function load_graph(file, ::Type{GEXFFormat})
    5
end

function write_graph(g, ::Type{GEXFFormat})

    5 #LOL not rewriting EzXML soon
end

############### Graph6
function load_graph(file, ::Type{Graph6Format})
    6
end

function write_graph(g, ::Type{Graph6Format}, file_name="graph.g6")
    A = adjacency_matrix(g, Bool)
    n = nv(g)
    nbits = div(n * (n - 1), 2)
    x = BitVector(undef, nbits)
    ind = 0
    for col in 2:n, row in 1:(col - 1)
        x[ind] = A[row, col]
        ind += 1
    end
    #join(">>graph6<<",string(
    return nothing
end

############### GraphML
function load_graph(file, ::Type{GraphMLFormat})
    7
end

function write_graph(g, ::Type{GraphMLFormat})
    
end

############### CDF
function load_graph(file, ::Type{CDFFormat})
    8
end

function write_graph(g, ::Type{CDFFormat})
    8
end

############### LGCompressed
function load_graph(file, ::Type{LGCompressedFormat})
    9
end

function write_graph(g, ::Type{LGCompressedFormat}, file_name="graph.jgz")
    
end

# Exports!
export AbstractGraphFormat
export DOTFormat
export EdgeListFormat, GMLFormat
export NETFormat,      GEXFFormat
export Graph6Format,   GraphMLFormat
export CDFFormat,      LGCompressedF
export load_graph, write_graph

end # module
