import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Menger_Sponge_Fractal extends PApplet {

//Jeffrey Andersen

float rotation = 0;
ArrayList<Box> sponge = new ArrayList<Box>();

public void setup() {
  
  Box b = new Box(0, 0, 0, 200);
  sponge.add(b);
  noStroke();
}

public void mousePressed() {
  ArrayList<Box> next = new ArrayList<Box>();
  for (Box b : sponge) {
    next.addAll(b.split());
  }
  sponge = next;
}

public void draw() {
  background(0);
  lights();
  translate(width / 2, height / 2);
  rotateX(rotation);
  rotateY(2 * rotation);
  rotateZ(3 * rotation);
  for (Box b : sponge) {
    b.show();
  }
  rotation += 0.005f;
}
//Jeffrey Andersen

class Box {
  PVector pos;
  float size;
  
  Box(float x, float y, float z, float _size) {
    pos = new PVector(x, y, z);
    size = _size;
  }
  
  public ArrayList<Box> split() {
    ArrayList<Box> boxes = new ArrayList<Box>();
    for (int x = -1; x < 2; x++) {
      for (int y = -1; y < 2; y++) {
        for (int z = -1; z < 2; z++) {
          if (abs(x) + abs(y) + abs(z) > 1) {
            float newSize = size / 3;
            Box b = new Box(pos.x + x * newSize, pos.y + y * newSize, pos.z + z * newSize, newSize);
            boxes.add(b);
          }
        }
      }
    }
    return boxes;
  }
  
  public void show() {
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    box(size);
    popMatrix();
  }
}
  public void settings() {  size(400, 400, P3D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Menger_Sponge_Fractal" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
