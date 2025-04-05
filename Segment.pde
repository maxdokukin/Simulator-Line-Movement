class Segment {

  PVector a, b, heading_vector;
  Segment next = null;
  int id;
  float length;
  String type = "line";

  Segment(PVector a, PVector b, int id) {
    this.a = a.copy();
    this.b = b.copy();
    this.length = dist(a.x, a.y, b.x, b.y);
    this.heading_vector = PVector.sub(this.b, this.a);
    this.id = id;
  }

  void show() {
    line(a.x, a.y, b.x, b.y);
  }
  
  TravelData travel(float segment_progress, float speed) {
    float relative_speed = speed / length;
    float current_segment_progress_updated = min(segment_progress + relative_speed, 1);
    PVector current_position_updated = a.copy().add(heading_vector.copy().mult(current_segment_progress_updated));
    
    return new TravelData(this, current_segment_progress_updated, current_position_updated);
  }
}
