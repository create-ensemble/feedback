
inlets = 1
outlets = 1
autowatch = 1

var N = 12
if (jsarguments.length > 1) {
  N = jsarguments[1]
}
var L = N * N * 3

var names = new Array(N);

for (i=0; i<N; ++i) {
	names[i] = (i+1).toString();
}

function name(num, name) {
	if (num >= 1 && num <= N) {
		names[num-1] = name;
		post("Name " + num + " is now " + name + "\n");
	} else {
		post("Bad number " + num + " for name message - must be 1 to " + N);
	}
}

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
  dot += "  node [shape=circle, fixedsize=true, penwidth=2, width=1.5, height=0.6, fontsize=24]\n"
  var i
  for (i = 2; i < L; i += 3) {
    // if the gain indicates that the previous (row, column) pair is "connected"
    if (a[i] > 0.5) {
	  // matrix~ is 0-origin but our labeling system is 1-origin
      row = a[i-2]+1;
      col = a[i-1]+1;
      // make a line in the file with an arrow: row -> column
      dot += "  " + names[row-1] + " -> " + names[col-1] + "\n"
    }
  }
  dot += "}\n"

  outlet(0, dot)
}
