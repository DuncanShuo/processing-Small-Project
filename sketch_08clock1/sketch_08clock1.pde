ArrayList <PVector> seconds = new ArrayList<PVector>();
ArrayList <PVector> minutes = new ArrayList<PVector>();
ArrayList <PVector> hours = new ArrayList<PVector>();
int n, s , m, h;

void setup() {
  size(300, 300);
  begin();
}

void draw() {
  background(255);
  translate(width/2, height/2);
  clockdis();
  move();
  texts();
}
