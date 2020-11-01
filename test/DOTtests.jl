using Test, LightGraphs, Parsers, LightGraphsIO
using LightGraphs.Experimental

@testset "DOT tests" begin
    g1 = complete_graph(6)
    dg = DiGraph(4)
    for e in [Edge(1,2), Edge(1,3), Edge(2,2), Edge(2,3), Edge(2,4), Edge(4,3)]
        add_edge!(dg, e)
    end
    g1 = SimpleGraph(5,10)
    g2 = SimpleGraph(5,2)
    dg2 = SimpleDiGraph(5,8)

    # Single graph read/write
    @test_broken has_isomorph(g1, read_g1)
    @test_broken has_isomorph(g2, read_g2)
    @test_broken has_isomorph(dg, read_dg)

    # Multiple graphs read/write
    #
end

