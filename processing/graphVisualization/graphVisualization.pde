public class Node {
  float x, y, r;
  String name;

  void draw() {
    fill(255);
    noStroke();
    ellipse(x, y, r, r);
    fill(0);
    text(name, x - 4, y + 4);
  }
}

public class Group {
  Node[] node;
  float[][] send;
  int n;

  Group(int N) {
    n = N;

    node = new Node[N];
    send = new float[N /* in */ ][N /* out */ ];

    for (int in = 0; in < N; in++) {
      for (int out = 0; out < N; out++) {
        send[in][out] = 0;
      }
    }

    for (int i = 0; i < N; i++) {
      node[i] = new Node();
      node[i].name = "" + i;
      float R = min(height, width) * 0.3;
      node[i].r = R / 3;
      node[i].x = width / 2 + R * sin(2 * 3.141592 * i / N);
      node[i].y = height / 2 + R * cos(2 * 3.141592 * i / N);
    }
  }

  void draw() {
    for (Node e : node) {
      e.draw();
    }
  }
}

Group group;

void setup() {
  size(400, 400);
  smooth();
  background(0);
  group = new Group(5); // do this after size()
}

void draw() {
  group.draw();
}

