class Particle {
  double myX, myY, myAngle, mySpeed;
  int myColor;
  Particle(int x, int y) {
    myX = x;
    myY = y;
    myAngle = (double)(Math.random()*360);
    mySpeed = (Math.random()*8);
myColor = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
  }

  void move() {
    myX = ((Math.cos(myAngle))*mySpeed) + myX;
    myY = ((Math.sin(myAngle))*mySpeed) + myY;
    if (mouseY<=200) {
      myY=myY+0.9;
    } else if (mouseY>200) {
      myY = myY-0.9;
    }
    if (mouseX<=200) {
      myX=myX+0.9;
    } else if (mouseX>200) {
      myX = myX-0.9;
    }
  }

  void show() {
    fill(myColor);
    ellipse((int)myX, (int)myY, 10, 10);
  }
}

void mousePressed() {
  for (int i = 0; i<800; i++) {
    Jacob[i] = new Particle(mouseX, mouseY);
  }
  for (int i = 800; i<Jacob.length; i++) {
    Jacob[i] = new Beam(mouseX, mouseY);
  }
}

class Beam extends Particle {
  Beam(int x, int y) {
    super(x, y);
    myX = 200;
    myY = 200;
    myAngle = (int)(Math.random()*360);
    mySpeed = 10;
    myColor = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
  }
}

Particle[] Jacob;
Beam deez;

void setup() {
  size(400, 400);
  Jacob = new Particle[1000];
  noStroke();
  for (int i =0; i<800; i++) {
    Jacob[i] = new Particle(200, 200);
  }

  for (int i =200; i<Jacob.length; i++) {
    Jacob[i] = new Beam(200, 200);
  }
}

void draw() {
  background(4, 47, 74);
  for (int i =0; i<Jacob.length; i++) {
    Jacob[i].move();
    Jacob[i].show();
  }

}

