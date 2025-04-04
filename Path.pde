class Path {

  ArrayList<PVector> points;
  color col;
  float total_path_length = 0;
  ArrayList<Segment> segments;
  int points_count = 0;

  Path(color col) {
    points = new ArrayList<PVector>();
    segments = new ArrayList<Segment>();
    this.col = col;
  }

  void add_point(float x, float y) {
    points.add(new PVector(x, y));
    points_count++;

    if (points_count > 1)
      segments.add(new Segment(points.get(points_count - 2), points.get(points_count - 1), points_count - 2));

    this.total_path_length = get_total_path_length();
    update_segment_length_shares();
  }

  void show() {
    if (points_count < 2)
      return;

    stroke(this.col);
    strokeWeight(1);
    for (Segment s : segments) {
      s.show();
    }
  }

  void update_segment_length_shares() {
    for (Segment s : segments)
      s.update_share_of_total_length(this.total_path_length);
  }

  float get_total_path_length() {
    if (points_count < 2)
      return 0;

    float total_length = 0;
    for (Segment s : segments) {
      total_length += s.length;
    }
    return total_length;
  }

  PVector get_start_point() {
    return points.get(0);
  }

  PVector travel(PVector current_position, float speed) {
    Segment current_segment = get_segment(current_position);
    if (current_segment == null)
      return null;

    PVector new_position = null;
    if (current_segment.is_end(current_position)) {
      if (current_segment.id + 1 < segments.size()) {
        current_segment = segments.get(current_segment.id + 1);
      } else {
        return null;
      }
    }
    new_position = current_segment.travel(current_position, speed);
    
    return new_position;
  }


  Segment get_segment(PVector position) {
    for (int i = segments.size() - 1; i >= 0; i--)
      if (segments.get(i).on_segment(position))
        return segments.get(i);
    return null;
  }
}
