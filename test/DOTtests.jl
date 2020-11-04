using Test, LightGraphs, Parsers, LightGraphsIO
using LightGraphs.Experimental

@testset "DOT tests" begin
    g = SimpleGraph(10,10)
    dg = SimpleDiGraph(10,10)

    read_g = load_graph("graph.dot", DOTFormat)
    read_dg = load_graph("digraph.dot", DOTFormat)

    # Single graph read/write
    @test_broken has_isomorph(g, read_g)
    @test_broken has_isomorph(dg, read_dg)

    # Multiple graphs read/write
    #
end

