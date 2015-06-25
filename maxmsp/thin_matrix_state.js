
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
  if (a.length != L) {
    post('ERROR: wrong sized list')
    post()
  }

  // take the verbose connections list from a matrix~ and compress it
  // by outputting only connected pairs. input: (row, column, gain, row
  // column, gain, ...) output: (row, column, row, column, ...)
  //
  var i, l = ['thin']
  for (i = 2; i < L; i += 3) {
    if (a[i] > 0.5) {
      l.push(a[i-2])
      l.push(a[i-1])
    }
  }

  outlet(0, l)
}
