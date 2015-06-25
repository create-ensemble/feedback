
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

  if (rowSum[r] < 0)
	rowSum[r] = 0;
  if (rowSum[r] > N)
	rowSum[r] = N; 

  if (rowSum[r] < 2)
    outlet(r, 1.0);
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
  for (i = 0; i < N; i++) {
    rowSum[i] = 0;
    outlet(i, 1.0);
  }
  outlet(N, rowSum);
}