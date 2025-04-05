
Path path;
Traveler traveler;

void setup() {

  path = new Path(color(255, 0, 0));

  path.add_segment(new LineSegment(0, new PVector(50, 50), new PVector(100, 50)));
  path.add_segment(new ArcSegment(1, new PVector(100, 50), new PVector(150, 100), 50, true));
  path.add_segment(new ArcSegment(2, new PVector(150, 100), new PVector(200, 150), 50, false));
  path.add_segment(new LineSegment(3, new PVector(200, 150), new PVector(250, 150)));

  path.make_a_loop();
  
  traveler = new Traveler(path, 1, color(0, 255, 0));
  size(600, 600);
}

void draw() {
  background(40);
  path.show();
  traveler.show();
  traveler.update();
}


void mouseClicked() {
  //path.add_point(mouseX, mouseY);
}

void keyPressed() {
  if (key == 's') {
    traveler = new Traveler(path, 1, color(0, 255, 0));
  }
}
