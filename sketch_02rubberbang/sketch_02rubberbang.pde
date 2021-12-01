ArrayList<Ball> balls;
int n;
int colorr = 310;
int a =1;

void setup() {
  fullScreen();
  colorMode(HSB, 360, 100, 100);
  strokeWeight(12);
  balls = new ArrayList<Ball>();
  balls.add(new Ball(0, 0, 150));
  frameRate(60);
}

void draw() {
  fill(0);
  translate(width/2, height/2);
  background(0);

  for (int i = balls.size() - 1; i>=0; i--) {
    Ball ball = balls.get(i);
    ball.update();
    ball.display();
    ball.checkBoundaryCollision();
    if (balls.size() >=1) {
      if (ball.finish()) {
        balls.remove(i);
      }
    }
  }
  if (a % 2 == 1) {
    frameRate(60);
  }else if (a% 2== 0) {
    frameRate(1);
  }
}

void mousePressed() {
  
  a += 1;
}

void keyPressed() {
  colorr -= 50;
  
}

class Ball {
  PVector position;
  PVector velocity;
  float radius, m;
  float xx, yy;
  int life = 120;

  Ball(float x, float y, float rr) {
    position = new PVector(x, y);
    velocity = new PVector(-3,-4);
    radius = rr;
    m = radius*.1;
  }

  void update() {
    position.add(velocity);
    if (position.x > 10) {
      life -= 120;
    }
  }

  void display() {
    stroke(colorr, 100, 100);
    ellipse(position.x, position.y, radius*2, radius*2);
  }

  void checkBoundaryCollision() {
    if (position.x > width/2-radius) {
      position.x = width/2-radius;
      velocity.x *= -1;
    } else if (position.x < - width/2 + radius) {
      position.x = - width/2 + radius;
      velocity.x *= -1;
    } else if (position.y > height/2-radius) {
      position.y = height/2-radius;
      velocity.y *= -1;
    } else if (position.y < -height/2 + radius) {
      position.y = -height/2 + radius;
      velocity.y *= -1;
    }
  }

  boolean finish() {
    if (colorr < 50) {
      life --;
    }
    if (life < 0 ) {
      return true;
    } else {
      return false;
    }
  }
}
