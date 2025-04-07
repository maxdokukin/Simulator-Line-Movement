class LineSegment extends Segment {
  PVector heading_vector;

  LineSegment(int id, PVector a, PVector b) {
    super(id, a, b);
    this.heading_vector = PVector.sub(this.b, this.a);
    this.length = PVector.dist(this.a, this.b);
  }

  void show() {
    stroke(255, 0, 0);
    strokeWeight(selected ? 5 : 2);
    line(a.x, a.y, b.x, b.y);
    
    if(show_a){
      stroke(0, 255, 0);
      strokeWeight(10);
      point(a.x, a.y);
    }
    if(show_b){
      stroke(0, 0, 255);
      strokeWeight(10);
      point(b.x, b.y);
    }
  }
  
  TravelData travel(float segment_progress, float speed) {
    float relative_speed = speed / length;
    float segment_progress_updated = min(segment_progress + relative_speed, 1);
    PVector position_updated = a.copy().add(heading_vector.copy().mult(segment_progress_updated));
    
    return new TravelData(this, segment_progress_updated, position_updated);
  }
  
  boolean is_on(PVector point){
    float d1 = this.a.dist(point);
    float d2 = this.b.dist(point);
    
    if ((d1 + d2) - length < 1)
    return true;
    
    return false;
  }
}
