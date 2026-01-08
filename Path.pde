class Path {

  ArrayList<PVector> points;
  ArrayList<Segment> segments;
  color col;

  Path(color col) {
    points = new ArrayList<PVector>();
    segments = new ArrayList<Segment>();
    this.col = col;
  }

  //void add_point(float x, float y) {
  //  println("add point", x, y);
  //  points.add(new PVector(x, y));

  //  if (points.size() > 1){
  //    Segment new_segment = new Segment(points.get(points.size() - 2), points.get(points.size() - 1), points.size() - 2);
  //    segments.add(new_segment);
      
  //    if(segments.size() > 1){
  //      segments.get(segments.size() - 2).next = segments.get(segments.size() - 1);
  //    }
  //  }
  //}
  
  void add_segment(Segment new_segment){
    
    segments.add(new_segment);
    
    if(segments.size() > 1){
      segments.get(segments.size() - 2).next = segments.get(segments.size() - 1);
    }
  }

  void show() {
    if (segments.size() < 1)
      return;

    stroke(this.col);
    strokeWeight(1);
    for (Segment s : segments) {
      s.show();
    }
  }

  PVector get_start_point() {
    if(segments.size() == 0)
      return null;
    return segments.get(0).a;
  }
  
  Segment get_start_segment(){
    if(segments.size() == 0)
      return null;
    return segments.get(0);
  }

  TravelData travel(TravelData travel_data, float speed) {    
    if(travel_data == null || travel_data.segment == null)
      return null;
      
    if(travel_data.segment_progress >= 1){
      if(travel_data.segment.next == null){
        //TravelData travel_result = travel_data.segment.travel(1, speed);
        return new TravelData(null, -1f, travel_data.position);
      } else {
        return travel_data.segment.next.travel(0, speed);
      }
    }
    
    return travel_data.segment.travel(travel_data.segment_progress, speed);    
  }
  
  void make_a_loop(){
    //add_point(points.get(0).x, points.get(0).y);
    segments.get(segments.size() - 1).next = segments.get(0);
  }
  
  
  void highlight_segment(PVector mouse_location){
    for(Segment s : segments){
      if(s.is_on(mouse_location)){
        s.update_endpoints_show_status(mouse_location);
        s.selected = true;
      }
      else{
        s.reset_endpoints_show_status();
        s.selected = false;
      }
        
    }
  }
  
  void save_to_file(String filepath){
    
    
  }
}
