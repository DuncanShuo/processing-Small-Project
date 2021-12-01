PImage img;
int RadiusUpperLimit=20;
int RadiusLowerLimit=10;
float blankRate = 1;
boolean manual = false;
int manualBrushSize = 10;

void setup () {
  frameRate(60007);
  img = loadImage("a.jpeg");
  size (1500, 973);
  background (255);
  img.loadPixels();
  colorMode(HSB);
  noStroke();
}

void draw () {
  if (blankRate > 0.5) {
    shoot();
  } else {
    saveFrame("result#######.png");
    noLoop();
  }
}

void shoot () {
  int x = -1;
  int y = -1;
  loadPixels();
  //Finish condition calculation
  int blankN = 0;
  for (int i=0; i<pixels.length; i++) {
    if (pixels[i] == #FFFFFF) {
      blankN += 1;
    }
  }
  blankRate = blankN/float(width*height);
  println(blankRate);
  //Change linear pixel array index into screen coordinates and pick a random pixel; higher chance in the around the center
  color [][] pixelsMatrix = new color[width][height];
  for (int i = 0; i < width-1; i++) {
    for (int j = 0; j < height-1; j++) {
      pixelsMatrix[i][j]=pixels[i+j*width];
    }
  }
  println(manual);
  if (manual == false) {
    float r = abs(randomGaussian())*((width+height)/4);
    float theta = random(0, TWO_PI);
    x = int(cos(theta)*r)+width/2;
    y = int(sin(theta)*r)+height/2;
  } else {
    x = int((randomGaussian()*manualBrushSize)+mouseX);
    y = int((randomGaussian()*manualBrushSize)+mouseY);
  }
  //Change max radius and min radius according to the distance to the center of the window
  float dist = dist(x, y, width/2, height/2);
  float percentage = constrain(dist/((dist(width, height, 0, 0)/2)), 0, 1);
  int maxR = int(RadiusUpperLimit*(1-percentage) + RadiusLowerLimit*percentage);
  int minR = RadiusLowerLimit;
  //Detect the distance between filled pixels and the picked pixel within a square region and determine the radius
  int R=0;
search:
  for (int r=0; r<=maxR; r++) {
    //Growing circle, growing bounding box
    for (int i=x-r; i<=x+r; i++) {
      for (int j=y-r; j<=y+r; j++) {
        if ((i>=0) && (j>=0) && (i<width) && (j<height)) {
          if ((color(pixelsMatrix[i][j]) != #FFFFFF && dist(i, j, x, y) <= r) ) {
            R=r;
            break search;
          }
          if (r==maxR) {
            R=r;
            break search;
          }
        }
      }
    }
  }


  if (R>=minR) {
    fill(img.get(x, y));
    //fill(img.pixels[x+y*width]);
    ellipse(x, y, R, R);
  }
}

void keyPressed () {
  saveFrame("result#######.png");
}

void mousePressed() {
  manual = !manual;
  RadiusLowerLimit -= 5;
}
