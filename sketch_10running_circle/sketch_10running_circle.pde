ArrayList<Angle> angles = new ArrayList<Angle>();
boolean move = false;
float theta;

void setup() {
  size(500, 500);
  frameRate(60);

  for (int i = 0; i < 50; i ++) {
    theta = random(0, TWO_PI);
    angles.add(new Angle(theta));
  }
}

void draw() {
  background(255);

  for (int i = 0; i < angles.size(); i ++) {
    Angle angle = angles.get(i);
    angle.display();
    angle.radius();
    angle.move();
  }
}

void mousePressed() {
  move = !move;
}

class Angle {
  float a;
  float x, y;
  float radius = random(40, 50);
  float vx, vy;

  Angle(float c) {
    a = c;
  }

  void display() {
    x = cos(a)*radius;
    y = sin(a)*radius;

    strokeWeight(2);
    point(mouseX + x, mouseY + y);
  }

  void radius() {

    if (keyPressed) {
      if (key == 'w' && radius < width/2 || key == 'W' && radius < width/2) {
        radius += 5;
      } else if (key == 's' && radius > 0 || key == 'S' && radius > 0) {
        radius -= 5;
      }
    }
  }

  void move() {
    if (move) {
      a +=0.03;
      if (a > TWO_PI) {
        a = 0;
      }
    }
    println(move);
  }
}
