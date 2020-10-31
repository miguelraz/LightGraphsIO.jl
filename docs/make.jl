using LightGraphsIO
using Documenter

makedocs(;
    modules=[LightGraphsIO],
    authors="Miguel Raz",
    repo="https://github.com/miguelraz/LightGraphsIO.jl/blob/{commit}{path}#L{line}",
    sitename="LightGraphsIO.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://miguelraz.github.io/LightGraphsIO.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/miguelraz/LightGraphsIO.jl",
)
