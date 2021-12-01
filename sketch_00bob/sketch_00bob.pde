ArrayList<Ball> balls;
int n;

void setup() {
  size(800, 800);
  colorMode(HSB, 360, 100, 100);
  balls = new ArrayList<Ball>();
}

void draw() {
  background(360);

  for (int i = balls.size() - 1; i>=0; i--) {
    Ball ball = balls.get(i);
    ball.update();
    ball.display();
    if (ball.finish()) {
      balls.remove(i);
    }
  }
  balls.add(new Ball(mouseX, mouseY, random(60)));
}


class Ball {
  PVector pp, vv;
  float rr;
  float colorr = random(360);
  int life = 60;
  
  Ball(float x, float y, float r) {
    pp = new PVector(x, y);
    vv =  PVector.random2D();
    vv.mult(2);
    rr = r;
  }

  void update() {
    pp.add(vv);
  }

  void display() {
    noStroke();
    fill(colorr, 100, 100);
    ellipse(pp.x, pp.y, rr*2, rr*2);
  }

  boolean finish() {
    life --;
    if (life < 0 ) {
      return true;
    } else {
      return false;
    }
  }
}
