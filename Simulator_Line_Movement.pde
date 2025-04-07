
Path path;
Traveler traveler;
PathCounstructor path_constructor;

void setup() {

  path = new Path(color(255, 0, 0));
  path_constructor = new PathCounstructor(path);

  //path.add_segment(new LineSegment(1, new PVector(150, 100), new PVector(250, 150)));

  //path.add_segment(new ArcSegment(2, new PVector(100, 100), new PVector(150, 50), 50, true));
  //path.add_segment(new ArcSegment(2, new PVector(150, 50), new PVector(200, 100), 50, true));
  //path.add_segment(new LineSegment(1, new PVector(200, 100), new PVector(200, 300)));
  //path.add_segment(new ArcSegment(2, new PVector(200, 300), new PVector(150, 350), 50, true));
  //path.add_segment(new ArcSegment(2, new PVector(150, 350), new PVector(100, 300), 50, true));
  //path.add_segment(new LineSegment(1, new PVector(100, 300), new PVector(100, 100)));



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
  background(200);
  print_grid(50);
  path.show();
  stroke(0, 0, 255);
  strokeWeight(1);
  path.highlight_segment(new PVector(mouseX, mouseY));
  
  path_constructor.update();
  path_constructor.show();
  
  traveler.show();
  traveler.update();
}


void print_grid(float step) {
  strokeWeight(1);
  stroke(0);
  for (float  x = 0; x < width; x += step)
    line(x, 0, x, height);
  for (float y = 0; y < height; y += step)
    line(0, y, width, y);
}
void mouseClicked() {
  path_constructor.process_mouse_click(new PVector(int((mouseX + 25) / 50) * 50, int((mouseY + 25) / 50) * 50));
}

void mouseMoved(){
  path_constructor.move_cursor(new PVector(int((mouseX + 25) / 50) * 50, int((mouseY + 25) / 50) * 50));
}

void mouseWheel(MouseEvent event) {
  path_constructor.process_mouse_scroll(event.getCount());
}

void keyPressed() {
  path_constructor.process_key(key);

  if (key == 's') {
    traveler = new Traveler(path, 1, color(0, 255, 0));
  }
}
