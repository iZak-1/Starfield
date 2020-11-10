Star[] field;
int numStars = 1000;
float tailAmount = 10;
void setup() {
  size(1000, 1000); //size((int)(0.95*window.innerWidth), (int)(0.95*window.innerHeight));
  field = new Star[numStars];
  for (int i=0; i<numStars; i++) {  
    field[i]=new Star();
    if(round(100*(float)Math.random())==1) {
      field[i]=new UFO();
    }
  }
  background(0, 0, 0);
  textAlign(CENTER,CENTER);
  textSize(width/25);
  rectMode(CENTER);
}

void draw() {
  background(0);
  for (int i=0; i<numStars; i++) {
    field[i].check();
    field[i].move();
    field[i].show();
  }
  
  
}


class Star {
  float speed, myX, myY, moveX, moveY, mySize;
  color myColor;
  double angleRad, angleToMouse;
  Star() {
    myX=width/2;
    myY=height/2;
    speed = (float)Math.random();
    angleRad=2*PI*Math.random();
    mySize=1+2*(float)Math.random();

    moveX=0;
    moveY=0;

    myColor = color(155+(int)(100*Math.random()), 155+(int)(100*Math.random()), 155+(int)(100*Math.random()));
  }
  void check() {
    if (myX<-0.1*width||myX>width*1.1||myY<-0.1*height||myY>height*1.1) {
      myX=width/2;
      myY=height/2;
      speed=(float)Math.random();
      angleRad=2*PI*Math.random();
      mySize=0.1+2*(float)Math.random();
    }
  }
  void move() {


    moveX=(float)Math.cos(angleRad);
    moveY=(float)Math.sin(angleRad);

    myX+=speed*moveX;
    myY+=speed*moveY;
    speed*=1+   dist(myX, myY, width/2, height/2)/(10*(width+height));
    mySize*=1+  dist(myX, myY, width/2, height/2)/(20*(width+height));
  }
  void show() {  
    stroke(myColor, (float)(255*(dist(myX, myY, width/2, height/2)/(0.4*width+0.4*height))));
    fill(myColor, (float)(255*(dist(myX, myY, width/2, height/2)/(0.2*width+0.2*height))));
    ellipse(myX, myY, mySize, mySize);
    strokeWeight(mySize/2);
    line(myX, myY, (float)(myX-dist(myX, myY, width/2, height/2)*Math.cos(angleRad)/tailAmount), (float)(myY-dist(myX, myY, width/2, height/2)*Math.sin(angleRad)/10));
  }
}
class UFO extends Star {
  UFO() {
    myX=width*(float)Math.random();
    myY=height*(float)Math.random();
    speed = 0.5*(float)Math.random();
    angleRad=2*PI*Math.random();
    mySize=5*(float)Math.random();

    moveX=0;
    moveY=0;
  }
  void check() {
    if (myX<-0.1*width||myX>width*1.1||myY<-0.1*height||myY>height*1.1) {
      myX=width*(float)Math.random();
      myY=height*(float)Math.random();
      speed=0.5*(float)Math.random();
      angleRad=2*PI*Math.random();
      mySize=5*(float)Math.random();
    }
  }
  void show() {  
    noStroke();
    fill(0,255,0);
    rect(myX, myY, mySize, mySize);
  }
}

void mouseClicked() {
  setup();
}
