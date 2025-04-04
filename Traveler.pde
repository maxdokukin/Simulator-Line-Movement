class Traveler {

  Path path;
  float speed;
  float path_traveled = 0;
  PVector current_location;
  color col;
  boolean done = false;
  boolean start = false;

  Traveler(Path path, float speed, color col) {
    this.path = path;
    this.speed = speed;
    this.current_location = path.get_start_point();
    this.col = col;
  }

  void show() {
    stroke(col);
    strokeWeight(3);
    point(current_location.x, current_location.y);
  }

  void update() {
    if (done || !start)
      return;

    PVector new_position = path.travel(current_location, speed);

    if (new_position == null)
      this.done = true;
    else
      this.current_location = new_position;
  }
  
  void reset(){
    this.current_location = path.get_start_point();
    this.done = false;
  }
}
