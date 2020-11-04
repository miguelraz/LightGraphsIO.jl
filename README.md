# LightGraphsIO 
[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://miguelraz.github.io/LightGraphsIO.jl/stable) [![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://miguelraz.github.io/LightGraphsIO.jl/dev) [![Build Status](https://github.com/miguelraz/LightGraphsIO.jl/workflows/CI/badge.svg)](https://github.com/miguelraz/LightGraphsIO.jl/actions) 
[![Build Status](https://ci.appveyor.com/api/projects/status/github/miguelraz/LightGraphsIO.jl?svg=true)](https://ci.appveyor.com/project/miguelraz/LightGraphsIO-jl) [![Coverage](https://codecov.io/gh/miguelraz/LightGraphsIO.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/miguelraz/LightGraphsIO.jl) [![Coverage](https://coveralls.io/repos/github/miguelraz/LightGraphsIO.jl/badge.svg?branch=master)](https://coveralls.io/github/miguelraz/LightGraphsIO.jl?branch=master) [![Code Style: Blue](https://img.shields.io/badge/code%20style-blue-4495d1.svg)](https://github.com/invenia/BlueStyle)

Hello! 

#### Table of Contents
1. What does LightGraphsIO.jl do?
2. How can I get it / use it?
3. What are its features?
4. Where can I get help?
5. Who maintains this project?
6. How can I help this project?

### What does LightGraphsIO.jl do?

This is a package to read and write popular graph formats in a performant fashion (i.e., it should NOT choke on your average dataset.)

This is a Work In Progress of a GraphsIO.jl rewrite! The plan is to be compatible with Julia 1.6 and above. This repo thanks the authors of GraphsIO.jl as most of the heavy lifting was already done there.

### [How can I use it?]()

Download Julia and open up a REPL. Then, type
```julia
using Pkg
Pkg.add("LightGraphsIO")
loadgraph("mygraph.dot", DOTFormat)
```

### [What are its features / benefits?]()

The plans are, in order:
 
- [ ] Have a formal and extensive testing structure
- [ ] Written in idiomatic, fully documented idiomatic Julia
- [ ] Use Parsers.jl + Mmapping as a backend
- [ ] Support all preexisting simple formats (nodes and edges only, see chart below)
- [ ] Post benchmarks
- [ ] Multithreading

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
[LGCompressed]|   x  |  x    | x              |LGCompressed|

[EdgeList]: a simple list of sources and dests separated by whitespace and/or comma, one pair per line.

[GML]: https://en.wikipedia.org/wiki/Graph_Modelling_Language

[Graph6]: https://users.cecs.anu.edu.au/~bdm/data/formats.html

[GraphML]: https://en.wikipedia.org/wiki/GraphML

[Pajek NET]: https://gephi.org/users/supported-graph-formats/pajek-net-format/

[GEXF]: https://gephi.org/gexf/format/

[DOT]: https://en.wikipedia.org/wiki/DOT_(graph_description_language)

[LGCompressed]: Compressed LightGraphs format.

Stretch goals for this project are in order:

- [ ] Use artifacts for downloading graphs (?)
- [ ] Use SIMD
- [ ] Parse formats + features (more than nodes and edges)

### [Where can I get help with this project?]()

Try using the #graphs channel in the Julia Slack/Zulip or post about it on the JuliaLang Discourse.

### [Who maintains / contributes to this project?]()

@miguelraz (wanna fund me for a Master's / PhD? Get in touch!)

### [How can I help this project?]()

Click the Sponsor button or subscribe to the Patreon!

You are more than encouraged to help out and / or reach out.

Filing issues or looking for `beginner-issues` PRs are also welcome additions.

