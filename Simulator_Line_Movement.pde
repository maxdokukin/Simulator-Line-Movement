
Path path = new Path(color(255, 0, 0));
Traveler trav;

void setup(){
  path.add_point(50, 50);
  path.add_point(250, 50);
  path.add_point(250, 150);

  trav = new Traveler(path, 1, color(0, 255, 0));
  size(600, 600);  
  
  //for(int i =  0; i < 5; i++){
  //  background(40);
  //  path.show();
  //  trav.show();
  //  trav.update();
  //}
}

void draw(){
  background(40);
  path.show();
  trav.show();
  trav.update();
}


void mouseClicked() {  
  path.add_point(mouseX, mouseY);
}

void keyPressed() {
  if (key == 's')
    trav = new Traveler(path, 1, color(0, 255, 0));
    trav.start = true;
}
