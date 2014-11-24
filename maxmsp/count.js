
var N = 6

inlets = 1;
outlets = N;

var sum = new Array(N, 0.0);

function list(r, c, g) {
  if (g == 1)
    sum[c]++;
  else if (g == 0)
    sum[c]--;
  else
    post("ERROR\n");
  if (sum[c] == 0)
    outlet(c, 1.0);
  else if (sum[c] < 0)
    post("ERROR\n");
  else
    outlet(c, 1.0 / sum[c]);
}

function clear() {
  for (i = 0; i < N; i++) {
    sum[i] = 0;
    outlet(i, 1.0);
  }
}