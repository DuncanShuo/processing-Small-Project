ArrayList<Ball> balls = new ArrayList<Ball>();
float a;

void setup() {
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
  background(360);
  frameRate(45);
  balls.add(new Ball());
}

void draw() {
  translate(width/2, height/2);
  for (int i = 0; i < balls.size(); i++) {
    Ball ball =  balls.get(i);
    ball.display();
    ball.move();
    if (ball.finish()) {
      balls.remove(i);
      balls.add(new Ball());
      a += 5;
    }
  }
}


class Ball {
  float x, y ;
  float r = 36;

  void display() {
    fill(a, 100, 100);
    PVector p = PVector.random2D();
    p.mult(25);
    x += p.x;
    y += p.y;
    ellipse(x, y, r*2, r*2);
  }

  void move() {
    r -= 2;
  }

  boolean finish() {
    if (r <= 2) {
      return true;
    } else {
      return false;
    }
  }
}
