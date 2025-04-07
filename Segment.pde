class Segment {
  PVector a, b;
  Segment next = null;
  int id;
  float length;
  boolean selected = false, show_a = false, show_b = false;
  
  Segment(int id, PVector a, PVector b) {
    this.id = id;
    this.a = a.copy();
    this.b = b.copy();
  }

  void show() {
    // Optional override
  }
  
  TravelData travel(float segment_progress, float speed) {
    return null; // Placeholder
  }
  
  boolean is_on(PVector point){
    return false;
  }
  
  void update_endpoints_show_status(PVector point){
    show_a = a.dist(point) < 10;
    show_b = b.dist(point) < 10;
  }
  
  void reset_endpoints_show_status(){
    show_a = false;
    show_b = false;
  }
}
