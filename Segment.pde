class Segment {
  PVector a, b;
  Segment next = null;
  int id;
  float length;

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
}
