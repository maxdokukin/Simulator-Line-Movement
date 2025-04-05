
//Path [] paths;
//Traveler [] travelers;

//void setup() {
//  paths = new Path[3];
//  travelers = new Traveler[3];

//  paths[0] = new Path(color(255, 0, 0));
//  paths[1] = new Path(color(0, 255, 0));
//  paths[2] = new Path(color(0, 0, 255));

//  for (int k = 0; k < 3; k++) {
//    paths[k].add_point(50, 50 + k * 200);
//    paths[k].add_point(150, 50 + k * 200);
//    paths[k].add_point(300, 150 + k * 200);
//    paths[k].add_point(400, 150 + k * 200);
//    paths[k].add_point(400, 50 + k * 200);
//    paths[k].add_point(300, 50 + k * 200);
//    paths[k].add_point(150, 150 + k * 200);
//    paths[k].add_point(50, 150 + k * 200);
//    paths[k].make_a_loop();
//  }

//  travelers[0] = new Traveler(paths[0], 1, color(0, 255, 0));
//  travelers[1] = new Traveler(paths[1], 2, color(0, 0, 255));
//  travelers[2] = new Traveler(paths[2], 3, color(255, 0, 0));

//  size(600, 600);
//}

//void draw() {
//  background(40);
//  for (int k = 0; k < 3; k++) {
//    paths[k].show();
//    travelers[k].show();
//    travelers[k].update();
//  }
//}


//void mouseClicked() {
//  //path.add_point(mouseX, mouseY);
//}

//void keyPressed() {
//  if (key == 's') {
//    travelers[0] = new Traveler(paths[0], 1, color(0, 255, 0));
//    travelers[1] = new Traveler(paths[1], 2, color(0, 0, 255));
//    travelers[2] = new Traveler(paths[2], 3, color(255, 0, 0));
//  }
//}
