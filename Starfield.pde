Particle [] stars = new Particle[1500];
int speed = 1;
boolean eek = false;
void setup()
{
  background(0);
  size(500,500);
  
  for(int i = 1; i < stars.length; i++) {
    stars[i] = new Particle(); 
    stars[0] = new OddballParticle();
  }
}
void draw()
{
 if(speed%2 == 0){
 frameRate(150);
 fill(0,0,0,15);
  rect(-10,0,510,510);
  eek = true;
  }
  if(speed%2 != 0){
    frameRate(60);
    fill(0,0,0);
    rect(-10,0,510,510);
    eek = false;
  }
  translate(width/2, height/2);
  for(int i = 1; i < stars.length; i++) {
    stars[i].show();
    stars[i].update();
  }
  translate(-width/2, -height/2);
  if(eek == true){
  stars[0].show();
  stars[0].update();
  }
}
class Particle
{
  float x;
  float y;
  float z;
  color c;
  
  Particle() {
    x = random(-width, width);   //(int)(Math.random()*width);
    y = random(-height,height);   //(int)(Math.random()*height);
    z = random(width);              //(int)(Math.random()*width);
    c = color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
  }
  void update(){
  z = z - 5;
  if(z < 1){
    z = width;
    x = random(-width, width);  
    y = random(-height,height); 
  }
}
  
void show(){
  fill(c);
  noStroke();
  
  float sx = map(x / z, 0, 1, 0, width);
  float sy = map(y / z, 0, 1, 0, width);
  
  float s = map(z, 0, width, 15, 0);
  
  ellipse(sx,sy,s,s); 
}   
}

  
  
  
  
class OddballParticle extends Particle//inherits from Particle
{
 //code here
 OddballParticle(){
   x = 250;   //(int)(Math.random()*width);
    y = 250;   //(int)(Math.random()*height);
    z = random(width);              //(int)(Math.random()*width);
    c = color(255);
 }
 void show(){
  fill(c);
  noStroke();
  
  fill(#EFF0A9);
  ellipse(250-x+250,250-y+250,300,300);
  fill(#FFCC48);
  ellipse(250-x+250,250-y+250,250,250);
  
  //White part of Doge
  fill(255,255,255);
  quad(128-x+300,302-y+300,147-x+300,261-y+300,207-x+300,260-y+300,204-x+300,302-y+300);
  quad(297-x+300,279-y+300,204-x+300,302-y+300,198-x+300,260-y+300,272-x+300,218-y+300);
  quad(137-x+300,183-y+300,264-x+300,194-y+300,297-x+300,279-y+300,147-x+300,261-y+300);
  triangle(137-x+300,183-y+300,123-x+300,211-y+300,147-x+300,261-y+300);
  
  //Ears
  stroke(0,0,0);
  triangle(156-x+300,130-y+300,152-x+300,150-y+300,164-x+300,148-y+300);
  triangle(240-x+300,126-y+300,229-x+300,144-y+300,247-x+300,151-y+300);
  
  //Face
  ellipse(160-x+300,172-y+300,20,15);
  ellipse(200-x+300,175-y+300,20,15);
  fill(0,0,0);
  ellipse(162-x+300,172-y+300,14,15);
  ellipse(202-x+300,175-y+300,14,15);
  triangle(167-x+300,190-y+300,171-x+300,207-y+300,186-x+300,192-y+300);
  fill(255,255,255);
  arc(160-x+300,206-y+300,20,20,0,PI);
  arc(185-x+300,208-y+300,30,20,0,PI);
  
  //Outline of Doge
  stroke(0,0,0);
  line(128-x+300,302-y+300,147-x+300,261-y+300);
  line(297-x+300,279-y+300,248-x+300,155-y+300);
  line(147-x+300,261-y+300,195-x+300,261-y+300);
  line(195-x+300,261-y+300,242-x+300,236-y+300);
  line(123-x+300,210-y+300,147-x+300,261-y+300);
  line(123-x+300,210-y+300,152-x+300,151-y+300);
  line(159-x+300,118-y+300,152-x+300,151-y+300);
  line(178-x+300,143-y+300,159-x+300,118-y+300);
  line(238-x+300,118-y+300,248-x+300,155-y+300);
  line(238-x+300,118-y+300,219-x+300,143-y+300);
  line(178-x+300,143-y+300,219-x+300,143-y+300);
  fill(255,255,255);
  rotate(0.01);
  arc(207-x+300,260-y+300,190,135,PI/13,PI/1.27);
  rotate(-0.01);
  textAlign(CENTER);
  fill(#54D8DB);
  textSize(15);
  text("Wow, much space!",500-x,400-y);
  
} 
 void update(){
   //x=width/2;
   //y=height/2;
   x+=(int)(Math.random()*11)-5;
   y+=(int)(Math.random()*11)-5;
   if(x>350){
     x = 350;
   }
   if(y>350){
     y = 350;
   }
   if(x<150){
     x = 150;
   }
   if(y<150){
     y = 150;
   }
 }
}

void mouseClicked(){
  speed++;
}


