//started 09/05/2019
//inspiration: https://www.youtube.com/watch?v=LG8ZK-rRkXo

float a = 0;
ArrayList<Box> sponge = new ArrayList<Box>();

void setup() {
  size(400, 400, P3D);
  Box b = new Box(0, 0, 0, 200);
  sponge.add(b);
}

void mousePressed() {
  ArrayList<Box> next = new ArrayList<Box>();
  for (Box b : sponge) {
    next.addAll(b.split());
  }
  sponge = next;
}

void draw() {
  background(0);
  noStroke();
  lights();
  translate(width / 2, height / 2);
  rotateX(a);
  rotateY(2 * a);
  rotateZ(3 * a);
  for (Box b : sponge) {
    b.show();
  }
  a += 0.005;
}
