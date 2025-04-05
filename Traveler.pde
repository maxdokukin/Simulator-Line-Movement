class Traveler {
  Path path;
  float speed;
  color col;
  boolean done = false;
  boolean start = true;
  TravelData travel_data;

  Traveler(Path path, float speed, color col) {
    this.path = path;
    this.speed = speed;
    this.travel_data = new TravelData(path.get_start_segment(), 0, path.get_start_point());
    this.col = col;
  }

  void show() {
    stroke(col);
    strokeWeight(10);
    point(travel_data.position.x, travel_data.position.y);
  }

  void update() {
    if (done || !start)
      return;

    this.travel_data = path.travel(travel_data, speed);

    if(this.travel_data.segment_progress == -1)
      done = true;
  }
}
