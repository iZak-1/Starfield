Star[] field;
int numStars = 1000;
int numLinesToShow = 3;
float shipSpeed=0.1;
void setup() {
  size((int)(0.95*window.innerWidth), (int)(0.95*window.innerHeight));
  field = new Star[numStars];
  for (int i=0; i<numStars; i++) {  
    field[i]=new Star(width/2, height/2, (float)Math.random(), 2*PI*Math.random(), 1+2*(float)Math.random());
  }
  background(0, 0, 0);
  textAlign(CENTER,CENTER);
  textSize(width/25);
}

void draw() {
  background(0);
  for (int i=0; i<numStars; i++) {
    field[i].move();
    field[i].show();
  }
  
    
  fill(255);
  text(shipSpeed+ " Lightspeed", width/2, 0.9*height);
  
  
}


class Star {
  float speed, myX, myY, moveX, moveY, mySize;
  color myColor;
  double angleRad, angleToMouse;
  Star(float x_, float y_, float speed_, double angle_, float size_) {
    myX=x_;
    myY=y_;
    speed = speed_;
    angleRad=angle_;
    mySize=size_;

    moveX=0;
    moveY=0;

    myColor = color((int)(255*Math.random()), (int)(255*Math.random()), (int)(255*Math.random()));
  }
  void move() {


    moveX=(float)Math.cos(angleRad);
    moveY=(float)Math.sin(angleRad);

    myX+=shipSpeed*speed*moveX;
    myY+=shipSpeed*speed*moveY;
    speed*=1+   2*dist(myX, myY, width/2, height/2)/(10*(width+height));
    mySize*=1+  shipSpeed/2*dist(myX, myY, width/2, height/2)/(20*(width+height));
    
    if(shipSpeed<1){ 
    if (myX<-shipSpeed*width||myX>width+shipSpeed*width||myY<-shipSpeed*height||myY>height+height*shipSpeed) {
      myX=width/2;
      myY=height/2;
      speed=(float)Math.random();
      angleRad=2*PI*Math.random();
      mySize=0.1+2*(float)Math.random();
    }
    }
  }
  void show() {  
    stroke(myColor, (float)(255*(dist(myX, myY, width/2, height/2)/(0.4*width+0.4*height))));
    fill(myColor, (float)(255*(dist(myX, myY, width/2, height/2)/(0.2*width+0.2*height))));
    ellipse(myX, myY, mySize, mySize);
    strokeWeight(mySize/2);
    line(myX, myY, (float)(myX-dist(myX, myY, width/2, height/2)*Math.cos(angleRad)*shipSpeed), (float)(myY-dist(myX, myY, width/2, height/2)*Math.sin(angleRad)*shipSpeed));
  }
}

void mouseClicked() {
  setup();
}
void keyPressed() {
  if (keyCode==UP&&shipSpeed<1) {
    shipSpeed+=0.01;
  }
  if (keyCode==DOWN&&shipSpeed>0.01) {
    shipSpeed-=0.01;
  }
}
