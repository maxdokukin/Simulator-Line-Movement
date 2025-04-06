
Path path;
Traveler traveler;

void setup() {

  path = new Path(color(255, 0, 0));

  //path.add_segment(new LineSegment(1, new PVector(150, 100), new PVector(250, 150)));

  //path.add_segment(new ArcSegment(2, new PVector(100, 100), new PVector(150, 50), 50, true));
  //path.add_segment(new ArcSegment(2, new PVector(150, 50), new PVector(200, 100), 50, true));
  //path.add_segment(new ArcSegment(2, new PVector(200, 100), new PVector(150, 150), 50, true));
  //path.add_segment(new ArcSegment(2, new PVector(150, 150), new PVector(100, 200), 50, false));
  //path.add_segment(new ArcSegment(2, new PVector(100, 200), new PVector(150, 250), 50, false));
  //path.add_segment(new ArcSegment(2, new PVector(100, 200), new PVector(150, 250), 50, false));
  //path.add_segment(new ArcSegment(2, new PVector(150, 250), new PVector(200, 200), 50, false));
  //path.add_segment(new ArcSegment(2, new PVector(200, 200), new PVector(150, 150), 50, false));
  //path.add_segment(new ArcSegment(2, new PVector(150, 150), new PVector(100, 100), 50, true));
  
    path.add_segment(new ArcSegment(2, new PVector(300, 400), new PVector(400, 450), 50, false));
    path.add_segment(new ArcSegment(2, new PVector(400, 450), new PVector(300, 400), 50, false));

  
  //path.add_segment(new ArcSegment(2, new PVector(100, 100), new PVector(200, 200), 100, false));
  //path.add_segment(new ArcSegment(3, new PVector(150, 100), new PVector(50, 100), 50, true));

//  path.add_segment(new ArcSegment(1, new PVector(100, 50), new PVector(150, 100), 50, true));
//  path.add_segment(new ArcSegment(2, new PVector(150, 100), new PVector(200, 150), 50, false));
//  path.add_segment(new ArcSegment(3, new PVector(200, 150), new PVector(250, 100), 50, false));
//  path.add_segment(new ArcSegment(5, new PVector(250, 100), new PVector(150, 100), 50, false));
//  path.add_segment(new ArcSegment(5, new PVector(150, 100), new PVector(50, 100), 50, true));
//  path.add_segment(new ArcSegment(5, new PVector(50, 100), new PVector(150, 100), 50, true));

  //path.make_a_loop();
  
  traveler = new Traveler(path, 1, color(0, 255, 0));
  size(600, 600);
}

void draw() {
  background(40);
  path.show();
  stroke(0, 0, 255);
  strokeWeight(1);
  path.highlight_segment(new PVector(mouseX, mouseY));

  traveler.show();
  traveler.update();
}


void mouseMoved() {
}

void keyPressed() {
  if (key == 's') {
    traveler = new Traveler(path, 1, color(0, 255, 0));
  }
}
