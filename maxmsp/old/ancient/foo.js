
var N = 3;
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