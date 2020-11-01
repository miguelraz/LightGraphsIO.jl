using LightGraphs
using LightGraphsIO

@testset "Types" begin
    dg = complete_digraph(5)
    g = complete_graph(5)

    # DOT
    @test typeof(DOTFormat()) <: AbstractGraphFormat
    @test load_graph(1, DOTFormat) == 1
    @test_broken write_graph(g, DOTFormat) == 1

    # EdgeList
    @test typeof(EdgeListFormat()) <: AbstractGraphFormat
    @test load_graph(1, EdgeListFormat) == 2
    @test write_graph(g, EdgeListFormat) == 2

    # GML
    @test typeof(GMLFormat()) <: AbstractGraphFormat
    @test load_graph(1, GMLFormat) == 3
    @test write_graph(g, GMLFormat) == 3

    # NET
    @test typeof(NETFormat()) <: AbstractGraphFormat
    @test load_graph(1, NETFormat) == 4
    @test write_graph(g, NETFormat) == 4

    # GEXF
    @test typeof(GEXFFormat()) <: AbstractGraphFormat
    @test load_graph(1, GEXFFormat) == 5
    @test write_graph(g, GEXFFormat) == 5

    # Graph6
    @test typeof(Graph6Format()) <: AbstractGraphFormat
    @test load_graph(1, Graph6Format) == 6
    @test write_graph(g, Graph6Format) == 6

    # GraphML
    @test typeof(GraphMLFormat()) <: AbstractGraphFormat
    @test load_graph(1, GraphMLFormat) == 7
    @test write_graph(g, GraphMLFormat) == 7

    # CDF
    @test typeof(CDFFormat()) <: AbstractGraphFormat
    @test load_graph(1, CDFFormat) == 8
    @test_broken write_graph(g, CDFFormat) == 8

    # LGCompressed
    @test typeof(LGCompressedFormat()) <: AbstractGraphFormat
    @test load_graph(1, LGCompressedFormat) == 9
    @test write_graph(g, LGCompressedFormat) == 9
end
