## LightGraphsIO.jl (is under construction! :pick:)
[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://miguelraz.github.io/LightGraphsIO.jl/stable) [![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://miguelraz.github.io/LightGraphsIO.jl/dev) [![Build Status](https://github.com/miguelraz/LightGraphsIO.jl/workflows/CI/badge.svg)](https://github.com/miguelraz/LightGraphsIO.jl/actions) 
[![Build Status](https://ci.appveyor.com/api/projects/status/github/miguelraz/LightGraphsIO.jl?svg=true)](https://ci.appveyor.com/project/miguelraz/LightGraphsIO-jl) [![Coverage](https://codecov.io/gh/miguelraz/LightGraphsIO.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/miguelraz/LightGraphsIO.jl) [![Coverage](https://coveralls.io/repos/github/miguelraz/LightGraphsIO.jl/badge.svg?branch=master)](https://coveralls.io/github/miguelraz/LightGraphsIO.jl?branch=master) [![Code Style: Blue](https://img.shields.io/badge/code%20style-blue-4495d1.svg)](https://github.com/invenia/BlueStyle)

Hello! 

#### Table of Contents
* [What does LightGraphsIO.jl do?](https://github.com/miguelraz/LightGraphsIO.jl#what-does-lightgraphsiojl-do)
* [How can I get it / use it?](https://github.com/miguelraz/LightGraphsIO.jl#how-can-i-use-it)
* [What are its features?](https://github.com/miguelraz/LightGraphsIO.jl#what-are-its-features--benefits)
* [Where can I get help?](https://github.com/miguelraz/LightGraphsIO.jl#where-can-i-get-help-with-this-project)
* [Who maintains this project?](https://github.com/miguelraz/LightGraphsIO.jl#who-maintains--contributes-to-this-project)
* [Benchmarks](https://github.com/miguelraz/LightGraphsIO.jl#benchmarks)
* [How can I help this project?](https://github.com/miguelraz/LightGraphsIO.jl#how-can-i-help-this-project)

### What does LightGraphsIO.jl do? :woman-shrugging:

This is a package to read and write popular graph formats in a performant fashion (i.e., it should NOT choke on your average dataset.)

This is a Work In Progress of a GraphsIO.jl rewrite! The plan is to be compatible with Julia 1.6 and above. This repo thanks the authors of GraphsIO.jl as most of the heavy lifting was already done there.

This will hopefully be a part of the [LightGraphs.jl]() ecosystem.

### How can I use it? :bulb:

Download Julia and open up a REPL. Then, type

```julia
using Pkg
Pkg.add("LightGraphsIO")
loadgraph("mygraph.dot", DOTFormat)
```

### What are its features / benefits? :clipboard:

The plans are, in order:
 
- [ ] Have a formal and extensive testing structure
- [ ] Written in idiomatic, fully documented idiomatic Julia
- [ ] Use Parsers.jl + Mmapping as a backend
- [ ] Support all preexisting simple formats (nodes and edges only, see chart below)
- [ ] Post benchmarks
- [ ] Multithreading

Currently, the following functionality is provided:V

| *Format*     | *Read* | *Write* | *Parallel read* | *Parallel write* | *Multiple Graphs* | *Format Name*    |
|--------------|------|-------|---------------|----------------|-----------------|----------------|
| EdgeList     |      |       |               |                |                 | EdgeListFormat |
| DOT          |      |       |               |                |                 | DOTFormat      |
| GML          |      |       |               |                |                 | GMLFormat      |
| Graph6       |      |       |               |                |                 | Graph6Format   |
| GraphML      |      |       |               |                |                 | GraphMLFormat  |
| Pajek NET    |      |       |               |                |                 | NETFormat      |
| GEXF         |      |       |               |                |                 | GEXFFormat     |
| CDF          |      |       |               |                |                 | CDFFormat      |
| LGCompressed |      |       |               |                |                 | LGCompressed   |



[EdgeList](http://rosalind.info/glossary/algo-edge-list-format/#:~:text=The%20first%20line%20contains%20two,as%20weighted%20and%20unweighted%20graphs.): a simple list of sources and dests separated by whitespace and/or comma, one pair per line.

* Example **Edge list** file below, [code to parse it is here:](Link to parsing code here)

```
1 2
2 3
3 5
```

[DOT](https://en.wikipedia.org/wiki/DOT_(graph_description_language)) : Simplistic di/graph format with minimal syntax.

* Example below, [code linked here]()

```
graph {
1 -- 2
2 -- 3
3 -- 5
}
```


[GML](https://en.wikipedia.org/wiki/Graph_Modelling_Language).

[Graph6](https://users.cecs.anu.edu.au/~bdm/data/formats.html)

[GraphML](https://en.wikipedia.org/wiki/GraphML)

[Pajek NET](https://gephi.org/users/supported-graph-formats/pajek-net-format/)

[GEXF](https://gephi.org/gexf/format/)

[CDF]() ???

LightGraphs Compressed format: Binary format for quick saving/reading.


[LGCompressed]: Compressed LightGraphs format.

##### Stretch goals for this project are, in order:

- [ ] Use artifacts for downloading graphs (?)
- [ ] Parse formats + features (more than nodes and edges)
- [ ] Use SIMD

### Where can I get help with this project? :ambulance:

Try using the #graphs channel in the [Julia Slack]() or [Zulip]() or post about it on the JuliaLang Discourse. Try asking there or the #helpdesk channels.

If you need emergency assistance or contractual support, get in touch via email.

### Who maintains / contributes to this project? :handshake:

@miguelraz (wanna fund me for a Master's / PhD? Get in touch!)

### Benchmarks

Plots! Lines! Competition! Soon! :tm:

### How can I help this project? :muscle:

Click the [Sponsor]() button or subscribe to the [Patreon]()!

You are more than encouraged to help out and / or reach out.

Filing issues or looking for `beginner-issues` PRs are also welcome additions.

