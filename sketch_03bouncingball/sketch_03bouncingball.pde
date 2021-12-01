float x = 500 , y = 100;
float w = -1.5;
float g = 0;

void setup() {
  colorMode(HSB,360,100,100);
  size(600,400);
  frameRate(30);
}

void draw() {
  background(360);
  
  fill(random(360),100,100);
  ellipse(x , y , 50, 50);
  x += w;
  y += g;
  g += 0.5;
  
  if (x < 0 || x > 600) {
    w = -w;
  }
  if (y > 400) {
    g = -0.95*g;
  }
  if (y < 100) {
    g = -g;
  }
  println(g);
}
