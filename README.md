# LightGraphsIO [![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://miguelraz.github.io/LightGraphsIO.jl/stable) [![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://miguelraz.github.io/LightGraphsIO.jl/dev) [![Build Status](https://github.com/miguelraz/LightGraphsIO.jl/workflows/CI/badge.svg)](https://github.com/miguelraz/LightGraphsIO.jl/actions) [![Build Status](https://ci.appveyor.com/api/projects/status/github/miguelraz/LightGraphsIO.jl?svg=true)](https://ci.appveyor.com/project/miguelraz/LightGraphsIO-jl) [![Coverage](https://codecov.io/gh/miguelraz/LightGraphsIO.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/miguelraz/LightGraphsIO.jl) [![Coverage](https://coveralls.io/repos/github/miguelraz/LightGraphsIO.jl/badge.svg?branch=master)](https://coveralls.io/github/miguelraz/LightGraphsIO.jl?branch=master) [![Code Style: Blue](https://img.shields.io/badge/code%20style-blue-4495d1.svg)](https://github.com/invenia/BlueStyle)

Hello!

This is a Work In Progress of a GraphsIO.jl rewrite! The plan is to be compatible with Julia 1.6 and above.

The plans are:
 
- [] Support all preexisting formats
- [] Formalize the testing structure
- [] Make it idiomatic Julia
- [] Use Parsers.jl + Mmapping as a backend
- [] Use artifacts for downloading graphs
- [] (Dream feature) Make it multithreaded
- [] (Dream feature) Post benchmarks

You are more than encourage to help out and / or reach out.

Currently, the following functionality is provided:V

Format        | Read | Write | Multiple Graphs| Format Name  |
--------------|------|-------|----------------|--------------|
[EdgeList]    |   x  |  x    | x              |EdgeListFormat|
[GML]         |   x  |  x    | x              |GMLFormat     |
[Graph6]      |   x  |  x    | x              |Graph6Format  |
[GraphML]     |   x  |  x    | x              |GraphMLFormat |
[Pajek NET]   |   x  |  x    | x              |NETFormat     |
[GEXF]        |   x  |  x    | x              |GEXFFormat    |
[DOT]         |   x  |  x    | x              |DOTFormat     |
[CDF]         |   x  |  x    | x              |CDFFormat     |

[EdgeList]: a simple list of sources and dests separated by whitespace and/or comma, one pair per line.
[GML]: https://en.wikipedia.org/wiki/Graph_Modelling_Language
[Graph6]: https://users.cecs.anu.edu.au/~bdm/data/formats.html
[GraphML]: https://en.wikipedia.org/wiki/GraphML
[Pajek NET]: https://gephi.org/users/supported-graph-formats/pajek-net-format/
[GEXF]: https://gephi.org/gexf/format/
[DOT]: https://en.wikipedia.org/wiki/DOT_(graph_description_language)

