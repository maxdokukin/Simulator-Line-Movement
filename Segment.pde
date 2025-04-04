class Segment {

  PVector a;
  PVector b;
  PVector heading_vector;
  int id;
  String type = "line";
  float length;
  float on_segment_tolerance = 0.1;
  float share_of_total_length = 1;
  Segment next_segment = null;
  Segment previous_segment = null;

  Segment(PVector a, PVector b, int id) {

    this.a = a;
    this.b = b;
    this.length = dist(a.x, a.y, b.x, b.y);
    this.heading_vector = new PVector(b.x - a.x, b.y - a.y);
    this.id = id;
  }

  void show() {
    line(a.x, a.y, b.x, b.y);
  }

  void update_share_of_total_length(float total_path_length) {
    this.share_of_total_length = this.length / total_path_length;
  }

  boolean on_segment(PVector position) {
    float d1 = dist(a.x, a.y, position.x, position.y);
    float d2 = dist(b.x, b.y, position.x, position.y);

    if (d1 + d2 - this.length <= this.on_segment_tolerance)
      return true;
    return false;
  }

  float get_absolute_segment_position(PVector position) {
    float d1 = dist(a.x, a.y, position.x, position.y);
    float d2 = dist(b.x, b.y, position.x, position.y);

    if (d1 + d2 - this.length <= this.on_segment_tolerance)
      return d1 / this.length;
    return -1;
  }

  PVector travel(PVector current_position, float speed) {
    float relative_speed = speed / length;

    float travel_progress = get_absolute_segment_position(current_position);
    PVector new_position = a.copy().add(heading_vector.copy().mult(travel_progress + relative_speed));
    return new_position;
  }

  boolean is_end(PVector position) {
    return dist(b.x, b.y, position.x, position.y) == 0;
  }
}
