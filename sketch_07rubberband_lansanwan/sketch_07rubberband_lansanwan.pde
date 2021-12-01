ArrayList<Ball> balls = new ArrayList<Ball>();

void setup() {
  size(600, 600);
  //fullScreen();
  colorMode(HSB, 360, 100, 100);
  frameRate(50);
  ballsadd();
}

void draw() {
  translate(width/2, height/2);
  background(360);
  for (int i = balls.size()-1; i >= 0; i--) {
    Ball ball = balls.get(i);
    ball.update();
    ball.display();
    ball.move();

    if (ball.finish()) {
      balls.remove(i);
    }
  }
}

class Ball {
  PVector position;
  PVector velocity;
  float rx, ry;
  int a, b;
  float colorr = random(360);
  int abc;

  Ball(float x, float y, float ra, float rb) {
    position = new PVector(x, y);
    velocity = new PVector(-x, -y);
    velocity.mult(random(0.003, 0.01));
    rx = ra;
    ry = rb;
  }

  void update() {
    position.add(velocity);
  }

  void display() {
    noFill();
    strokeWeight(9);
    stroke(colorr, 100, 100);
    ellipse(position.x, position.y, rx*2, ry*2);
  }

  void move() {
    if (position.x < 8 && position.x > -8 && position.y < 8 && position.y > -8) {
      velocity.x = 0;
      velocity.y = 0;
      abc+=1;
      if (rx == 80) {
        a += 1;
      } else if (rx == -80) {
        a += 1;
      }
      if (a % 2 == 1 ) {
        rx-=2;
      } else if (a % 2 ==0) {
        rx+=2;
      }

      if (ry == 80) {
        b += 1;
      } else if (ry == -80) {
        b += 1;
      }
      if (b % 2 == 1 ) {
        ry-=2;
      } else if (b % 2 ==0) {
        ry+=2;
      } /*lasanwan*/

      println(abc);
    }
  }
  boolean finish() {
    if (abc > 700) {
      return true;
    } else {
      return false;
    }
  }
}
