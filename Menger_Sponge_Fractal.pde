//Jeffrey Andersen

float deltaRotation = 0.005;
float xRotationMultiplier = 1, yRotationMultiplier = 2, zRotationMultiplier = 3;
float showBoxDivisor = 1;
float childBoxReductionDivisor = 3;

float rotation = 0;
ArrayList<Box> sponge = new ArrayList<Box>();

void setup() {
  size(800, 800, P3D);
  Box b = new Box(0, 0, 0, min(width, height) / 2);
  sponge.add(b);
  noStroke();
}

void draw() {
  background(0);
  lights();
  translate(width / 2, height / 2);
  rotateX(xRotationMultiplier * rotation);
  rotateY(yRotationMultiplier * rotation);
  rotateZ(zRotationMultiplier * rotation);
  for (Box b : sponge) {
    b.show();
  }
  rotation += deltaRotation;
}

void keyPressed() { //FIXME: checkout what negative values look like
  switch (keyCode) {
  case UP:
    showBoxDivisor += 0.05;
    println("showBoxDivisor", showBoxDivisor);
    break;
  case DOWN:
    showBoxDivisor -= 0.05;
    println("showBoxDivisor", showBoxDivisor);
    break;
  case RIGHT:
    childBoxReductionDivisor += 0.05;
    println("childBoxReductionDivisor", childBoxReductionDivisor);
    break;
  case LEFT:
    childBoxReductionDivisor -= 0.05;
    println("childBoxReductionDivisor", childBoxReductionDivisor);
    break;
  case 'F': //must be capitalized here, though isn't capitalized when pressed on the keyboard
    deltaRotation += 0.005;
    println("deltaRotation", deltaRotation);
    break;
  case 'S': //must be capitalized here, though isn't capitalized when pressed on the keyboard
    deltaRotation -= 0.005;
    println("deltaRotation", deltaRotation);
    break;
  }
}

void mousePressed() {
  ArrayList<Box> nextSponge = new ArrayList<Box>();
  for (Box b : sponge) {
    nextSponge.addAll(b.split());
  }
  sponge = nextSponge;
}
