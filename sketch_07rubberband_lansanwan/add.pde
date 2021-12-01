void ballsadd() {
  for (int i = 0; i < 25; i++) {
    balls.add(new Ball(random(-width/2, width/2), random(-height/2, height/2), 80, 80));
  }
}
