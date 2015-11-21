// Run once
void setup() {
  frameRate(30);
  // size(1000, 1000);
  fullScreen();
}

// Run "frameRate" times per secont
void draw() {
  // angle is the amount of tilt we do on the line. 
  // In radians : 2*PI radians = 360 degrees 
  float angle = (width/2-mouseX)*TWO_PI/width;
  // len is the length of the first line
  float len = (height-mouseY)/2;
  background(0); // Black
  smooth(4);
  stroke(255);   // White
  // Print the text
  text("Len = " + len + " Angle(radians) = " + angle, 15, 15);
  // Call the tree function (once)
  tree(width/2, height, len, -PI/2, angle);
}

// This is the recursive function
void tree(float x, float y, float len, float alpha, float gamma) {
  line(int(x), int(y), int(x+len*cos(alpha)), int(y+len*sin(alpha)));
  // We need to have some termination condition. In our case we stop 
  // Calling recursive once the lenght has decresed to 1 
  if (len>1) {
    // We change the len and alpha for each call to make up the "tree"
    tree(x+len*cos(alpha), y+len*sin(alpha), len*0.64, alpha-gamma, gamma);
    tree(x+len*cos(alpha), y+len*sin(alpha), len*0.64, alpha+gamma, gamma);
  }
}
