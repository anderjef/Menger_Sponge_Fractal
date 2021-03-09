//Jeffrey Andersen

float rotation = 0;
ArrayList<Box> sponge = new ArrayList<Box>();

void setup() {
  size(400, 400, P3D);
  Box b = new Box(0, 0, 0, 200);
  sponge.add(b);
  noStroke();
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
  lights();
  translate(width / 2, height / 2);
  rotateX(rotation);
  rotateY(2 * rotation);
  rotateZ(3 * rotation);
  for (Box b : sponge) {
    b.show();
  }
  rotation += 0.005;
}
