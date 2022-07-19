// This is a key feature of the whole system: when the matrix connects
// one "say" to multiple "hear"s then everything easily becomes
// unstable, so we compensate by dividing the gain by the square root
// of the reciprocal of the number of connections, mumble mumble,
// Conservation of Energy, mumble mumble.  it works.

var N = 12;
inlets = 1;
outlets = N;
var rowSum = new Array(N);

function list() {
  for (k = 0; k < N; k++)
    rowSum[k] = 0;

  var a = arrayfromargs(arguments);

  if (a.length != N * N * 3) {
    post('ERROR: wrong sized list');
    post();
  }

  for (i = 0; i < N * N * 3; i += 3) {
    //column = a[i];
    row = a[i + 1];
    state = a[i + 2];
    rowSum[row] += state;
  }

  for (k = 0; k < N; k++)
    if (rowSum[k] > 1)
      outlet(k, Math.sqrt(1.0 / rowSum[k]));
    else
      outlet(k, 1.0);
}






/*
var N = 12

inlets = 1;
outlets = N + 1;

var rowSum = new Array(N, 0.0);

function list(c, r, g) {

  if (g == 1)
    rowSum[r]++;
  else if (g == 0)
    rowSum[r]--;
  else
    post("ERROR: g is not in (0, 1)\n");

  if (rowSum[r] < 0) {
	rowSum[r] = 0;
	post("ERROR: corrected rowSum[r] < 0\n");
  }

  if (rowSum[r] > N) {
	rowSum[r] = N;
	post("ERROR: corrected rowSum[r] > N\n");
  }

  if (rowSum[r] < 2) {
    outlet(r, 1.0);
  }
  else if (rowSum[r] < 0) {
    post("ERROR: rowSum[r] =");
    post(rowSum[r]);
    post();
  }
  else
    outlet(r, Math.sqrt(1.0 / rowSum[r]));

  outlet(N, rowSum);
}

function clear() {
  rowSum = new Array(N, 0.0);
  for (i = 0; i < N; i++) {
    rowSum[i] = 0;
    outlet(i, 1.0);
  }
  outlet(N, rowSum);
}
*/