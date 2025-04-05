class TravelData {
  Segment segment;
  float segment_progress;
  PVector position;
  
  TravelData(Segment segment, float segment_progress, PVector position){
    this.segment = segment;
    this.segment_progress = segment_progress;
    this.position = position;
  }
}
