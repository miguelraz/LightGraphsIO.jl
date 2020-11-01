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
function load_graph(file, ::Type{DOTFormat})
    1
end

function write_graph(g, ::Type{DOTFormat}, file_name="graph.dot", graph_name="")
    io = IOBuffer()
    is_dir = is_directed(g)
    graph_type = is_dir ? "digraph " : "graph "
    name_and_end = graph_name == "" ? '{' : string(graph_name, " {")
    println(io, graph_type, name_and_end)
    #for i in vertices(g)
    #     println(io, '\t', i)
    #end
    if is_dir
        for v in vertices(g)
            out_nbrs = outneighbors(g, v)
            length(out_nbrs) == 0 && continue
            println(io, '\t', string(v), " -> {", join(out_nbrs, ','), '}')
        end
    else
        for e in edges(g)
            source = string(src(e))
            dest = string(dst(e))
            println(io, '\t', source, " -- ", dest)
        end
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
