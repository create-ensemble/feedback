
inlets = 1
outlets = 1
autowatch = 1

var N = 12
if (jsarguments.length > 1) {
  N = jsarguments[1]
}
var L = N * N * 3

function list() {
  var a = arrayfromargs(arguments)
  if (a.length != N * N * 3) {
    post('ERROR: wrong sized list')
    post()
  }

  // build a text file using the dot language. interpret the incoming list of
  // matrix settings (row, column, gain, row, column, gain, ...) to make the
  // dot file.
  //
  dot = "digraph foo {\n"
  dot += "  edge [penwidth=2]"

  // set some drawing parameters
  //
  dot += "  node [shape=circle, fixedsize=true, penwidth=2, width=0.6, height=0.6, fontsize=24]\n"
  var i
  for (i = 2; i < L; i += 3) {
    // if the gain indicates that the previous (row, column) pair is "connected"
    if (a[i] > 0.5) {
      // make a line in the file with an arrow: row -> column
      dot += "  " + a[i-2] + " -> " + a[i-1] + "\n"
    }
  }
  dot += "}\n"

  outlet(0, dot)
}
