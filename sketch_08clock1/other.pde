void begin() {
  for (float angle = 0; angle < 360; angle += 6) {
    PVector s = PVector.fromAngle(radians(angle-90));
    s.setMag(width*40/100);
    seconds.add(s);
  }
  for (float angle = 0; angle < 360; angle += 0.1) {
    PVector m = PVector.fromAngle(radians(angle-90));
    m.setMag(width*35/100);
    minutes.add(m);
  }
  for (float angle = 0; angle < 360; angle += 0.008333334) {
    PVector h = PVector.fromAngle(radians(angle-90));
    h.setMag(width*25/100);
    hours.add(h);
  }
}


void clockdis() {
  for (float angle = 0; angle < 360; angle += 6) {
    PVector c = PVector.fromAngle(radians(angle-90));
    c.setMag(width*42/100);
    strokeWeight(4);
    point(c.x, c.y);
  }
}


void move() {
  strokeWeight(1);
  line(0, 0, seconds.get(s).x, seconds.get(s).y);
  strokeWeight(3);
  line(0, 0, minutes.get(m).x, minutes.get(m).y);
  strokeWeight(5);
  line(0, 0, hours.get(h).x, hours.get(h).y);
  if (frameCount % 10 == 0) {
    s += 1;
    m += 1;
    h += 1;
    if (s >= seconds.size()) {
      s = 0;
    }
    if (m >= minutes.size()) {
      m = 0;
    }
    if (h >= hours.size()) {
      h = 0;
    }
  }
}


void texts() {
  textAlign(CENTER);
  textSize(width/20);
  fill(0);
  text(h/720 + ":" + m/60 + ":" + s, 0, height*0.15);
}
