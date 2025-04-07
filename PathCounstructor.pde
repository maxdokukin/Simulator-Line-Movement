class PathCounstructor {
  PVector a, b, cursor;
  Segment new_segment;
  Path parent_path;
  char type = 'l';
  boolean initiated = true, direction_clockwise = true;
  float radius = 0;

  PathCounstructor(Path parent_path) {
    this.parent_path = parent_path;
  }

  void process_mouse_click(PVector mouse_location) {

    if (a == null)
      a = mouse_location.copy();
    else if (b == null){
      b = mouse_location.copy();
      radius = abs(a.x - b.x);
    } else {
      a = mouse_location.copy();
      b = null;
    }
  }

  void process_key(char k) {
    switch (k) {
    case 't':
      if(type == 'l')
        type = 'a';
      else
        type = 'l';
      break;

    case 'l':
      parent_path.make_a_loop();
      
    case 'd':
      direction_clockwise = !direction_clockwise;
      break;

    case 'x':
      parent_path.add_segment(new_segment);
      new_segment = null;
      a = null;
      b = null;
      type = 'l';
      radius = 0;
      break;
    }
  }
  
  void process_mouse_scroll(float scroll){
    radius = max(0, radius + scroll);
    println("radius", radius);
  }

  void move_cursor(PVector point) {
    this.cursor = point;
  }

  void update() {
    
    if (!initiated){
      return;
    }
    
    if (a == null)
      return;

    PVector c;
    if (b == null)
      c = cursor;
    else
      c = b;

    if (type == 'l') {
      new_segment = new LineSegment(-1, a, c);
    } else {
      new_segment = new ArcSegment(0, a, c, radius, direction_clockwise);
    }
  }

  void show() {
    if (new_segment != null) {
      new_segment.show();
    }


    if (cursor != null) {
      strokeWeight(10);
      point(cursor.x, cursor.y);
    }
  }
}
