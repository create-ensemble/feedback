// We care only about connections within the following "communities"; 
// we wish to ignore all connections that aare not between members of one of these groups
// numbering is zero-origin 
// var groups = [[0, 1, 2, 3], [4, 5, 6, 7], [0, 4]]
// var groups = [[0, 4], [1, 5], [2, 6], [3,7], [4, 5, 6, 7] ]
var groups = [[0,1,2, 3, 4],[5,6,7,8,9,10,11]]



inlets = 1
outlets = 1
autowatch = 1

var N = 12
if (jsarguments.length > 1) {
  N = jsarguments[1]
}
var L = N * N * 3






post('Select submatrix working with')
post(groups.length)
post('groups; first is: ')
post(groups[0])
post()

function any_shared_group(x, y) {
	
	// post('X and Y:'); post(x); post(y); post()
		
	// Forget self-loops
	// if (x==y) return false;
	
	for (i = 0; i < groups.length; i++) {
		var g = groups[i]
		if ((g.indexOf(x) >= 0) && (g.indexOf(y) >= 0)) { 
			return true
		}
	}
	return false;
}


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
  var i, l = []
  for (i = 0; i < L; i += 3) {
      var from = a[i]
      var to = a[i+1]
      var val = a[i+2]


      var keep = false;

    if (any_shared_group(from,to)) {
        l.push(from)
        l.push(to)
        l.push(val)
    }
  }

  outlet(0, l)
}
