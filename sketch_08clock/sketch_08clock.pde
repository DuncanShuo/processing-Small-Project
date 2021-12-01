int ss = 56, mm = 59, hh = 23;

void setup() {
  size(500, 200);
}

void draw() {
  if (frameCount % 60 == 0) {
    ss += 01;
    if (ss >= 60 ) {
      ss = 00;
      mm += 01;
    }
    if (mm >= 60) {
      mm = 00;
      hh += 01;
    }
    if (hh >= 24) {
      hh = 00;
    }
  }
  textSize(30);
  background(255);
  fill(0);
  text(hh, 165, 100);
  text(mm, 235, 100);
  text(ss, 300, 100);
}
