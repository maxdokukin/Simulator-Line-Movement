class ArcSegment extends Segment{
  
  PVector arc_center;
  float angle_start, angle_stop, r;
  boolean direction_clockwise;
  
  ArcSegment(int id, PVector a, PVector b, float r, boolean direction_clockwise) {
    super(id, a, b);
    this.direction_clockwise = direction_clockwise;
        
    PVector center = PVector.lerp(a, b, 0.5);
    float d = PVector.dist(a, b);
    this.r = max(r, d / 2);
    float h = sqrt(sq(this.r) - sq(d / 2));
    float offset_x = -h * (b.y - a.y) / d;
    float offset_y =  h * (b.x - a.x) / d;
        
    if (direction_clockwise) {  
      this.arc_center = new PVector(center.x + offset_x, center.y + offset_y);
      this.angle_start = atan2(a.y - arc_center.y, a.x - arc_center.x);
      this.angle_stop  = atan2(b.y - arc_center.y, b.x - arc_center.x);
    } else {
      this.arc_center = new PVector(center.x - offset_x, center.y - offset_y);
      this.angle_stop = atan2(a.y - arc_center.y, a.x - arc_center.x);
      this.angle_start  = atan2(b.y - arc_center.y, b.x - arc_center.x);
    }
    
    if (this.angle_stop < this.angle_start)
      this.angle_stop += TWO_PI;
      
    this.length = (abs(angle_start - angle_stop) * this.r);
  }
  
  void show(){
    noFill();
    arc(arc_center.x, arc_center.y, 2 * r, 2 * r, angle_start, angle_stop);
  }
  
  TravelData travel(float segment_progress, float speed){
    float current_angle;
    if (this.direction_clockwise)
      current_angle = angle_start + (angle_stop - angle_start) * segment_progress;
    else
      current_angle = angle_stop - (angle_stop - angle_start) * segment_progress;
      
    float relative_speed = speed / length;
    float segment_progress_updated = min(segment_progress + relative_speed, 1);
    PVector position_updated = new PVector(arc_center.x + cos(current_angle) * r, arc_center.y + sin(current_angle) * r);
              
    return new TravelData(this, segment_progress_updated, position_updated);    
  }
}
  
  
  
 
