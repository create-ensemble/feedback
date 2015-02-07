
var N = 12

inlets = 1;
outlets = N;

var rowSum = new Array(N, 0.0);

function init() {
  post('init');
  post();
  clear();
}

function list(c, r, g) {
  if (g == 1)
    rowSum[r]++;
  else if (g == 0)
    rowSum[r]--;
  else {
    post("ERROR: g =");
    post(g);
    post();
  }

  if (rowSum[r] == 0)
    outlet(r, 1.0);
  else if (rowSum[r] == 1)
    outlet(r, 1.0);
  else if (rowSum[r] < 0) {
    post("ERROR: rowSum[r] =");
    post(rowSum[r]);
    post();
  }
  else
    outlet(r, Math.sqrt(1.0 / rowSum[r]));
}

function clear() {
  for (i = 0; i < N; i++) {
    rowSum[i] = 0;
    outlet(i, 1.0);
  }
}