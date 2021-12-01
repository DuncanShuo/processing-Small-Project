ArrayList<Wall> walls = new ArrayList<Wall>();
ArrayList<Light> lights = new ArrayList<Light>();
ArrayList<Shadow> shadows = new ArrayList<Shadow>();

void setup() {
  size(600, 600);

  int margins = 50;
  for (int i = 0; i < 100; i ++) {
    PVector pos = new PVector(random(margins, width-margins), random(margins, height-margins));
    PVector nxt = PVector.random2D().mult(70).add(pos);
    walls.add(new Wall(pos.x, pos.y, nxt.x, nxt.y));
  }

  lights.add(new Light(100, 100));
}

void draw() {
  background(250, 250, 150);

  for (int i = 0; i < walls.size(); i ++) {
    Wall wall = walls.get(i);
    wall.display();
  }

  for (int i = 0; i < lights.size(); i ++) {
    Light light = lights.get(i);
    light.setPos();
    light.scanWalls();
    light.display();
    light.castShadow();
  }


  for (int i = 0; i < shadows.size(); i ++) {
    Shadow shadow = shadows.get(i);
    shadow.display();
  }
}

class Wall {
  float x0, y0, x1, y1;
  PVector point0;
  PVector point1;

  Wall (float a, float b, float c, float d) {
    x0 = a;
    y0 = b;
    x1 = c;
    y1 = d;
  }

  void display() {
    point0 = new PVector(x0, y0);
    point1 = new PVector(x1, y1);
    strokeWeight(2);
    stroke(250, 250, 150);
    line(point0.x, point0.y, point1.x, point1.y);
  }
}

class Light {
  PVector pos;
  float maxDist = sqrt(width*width + height*height);

  Light (float a, float b) {
    pos = new PVector(a, b);
  }

  void setPos() {
    pos.x = mouseX;
    pos.y = mouseY;
  }

  void scanWalls() {
    for (int i=0; i<walls.size(); i++) {

      PVector relPos0 = PVector.sub(walls.get(i).point0, pos);
      PVector relPos1 = PVector.sub(walls.get(i).point1, pos);

      PVector aa = walls.get(i).point0;
      PVector bb = walls.get(i).point1; 
      PVector cc = PVector.mult(relPos1, maxDist).add(pos);
      PVector dd = PVector.mult(relPos0, maxDist).add(pos);

      shadows.add(new Shadow(aa.x, aa.y, bb.x, bb.y, cc.x, cc.y, dd.x, dd.y));
    }
  }
  
  void display() {
    noStroke();
    fill(255, 255, 230);
    ellipse(this.pos.x, this.pos.y, 20, 20);
  }

  void castShadow() {
    fill(130, 30, 30, 150);
    noStroke();
    for (int i=0; i<shadows.size(); i++) {
      beginShape();
      for (int j=0; j<shadows.size(); j++) {
        vertex(shadows[i][j].x, shadows[i][j].y);
      }
      endShape(CLOSE);
    }
  }
}

class Shadow {
  PVector walla, wallb;
  PVector lighta, lightb;

  Shadow (float ax, float ay, float bx, float by, float cx, float cy, float dx, float dy) {
    walla = new PVector(ax, ay);
    wallb = new PVector(bx, by);
    lighta = new PVector(cx, cy);
    lightb = new PVector(dx, dy);
  }

  void display() {
    fill(130,30,30,150);
    noStroke();
    for (int i=0; i<100; i++){
      beginShape();
      for (int j=0; j
    }
    
  }
}
