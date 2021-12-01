ArrayList<Ball> balls = new ArrayList<Ball>();
boolean pm;
int n;

void setup() {
  size(500, 500);
}

void draw() {
  background(255);


  for (int i = balls.size() - 1; i >= 0; i--) {
    Ball ball = balls.get(i);
    ball.display();
  }

  if (mousePressed ) {
    pm = true;
  } else {
    pm = false;
  }

  if (pm ) {
    balls.add(new Ball(mouseX, mouseY));
  }
}

class Ball {
  PVector po;

  PVector v;
  Ball(float x, float y) {
    po = new PVector(x, y);
  }

  void display() {
    n = balls.size();
    for (int i = 0; i < n - 1; i++) {
      v = new PVector(random(-0.05, 0.05), random(-0.05, 0.05));
      po.add(v);
      line(balls.get(i).po.x, balls.get(i).po.y, balls.get(i+1).po.x, balls.get(i+1).po.y);
    }
  }
}
