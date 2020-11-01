using LightGraphsIO
using Test

#@testset "LightGraphsIO" begin
    include("internalstests.jl")
    include("DOTtests.jl")
    include("Edgelisttests.jl")
    include("GMLtests.jl")
    include("NETtests.jl")
    include("GEXFtests.jl")
    include("Graph6tests.jl")
    include("GraphMLtests.jl")
    include("CDFtests.jl")
    include("LGCompressedtests.jl")
#end
