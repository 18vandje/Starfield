//Starfield by Jess van de Ven
//inspired by Mr. Smith's slides based heavily on Art Simon's slides

Particle[] particles;
double x, y, speed, angle;
int count, movecount;
void setup() {
  size(500, 500);
  particles = new Particle[100];
  for (int i=0; i<particles.length;i++){                        //Creates various stars!
    particles[i] = new NormTheStarling();
    particles[56]= new HughTheStarling();
    particles[89]=new thatOneAuntWePretendToLike();
    particles[34]=new HughTheStarling();
    particles[35]=new HughTheStarling();
  }
}

void draw() {
  if(count%6==0){
    background(34,75,170);
  }
  for (int ill=0; ill<particles.length; ill++){              //moves and shows stars!
    particles[ill].move();
    particles[ill].show();
  }
  count=count+1;
}

interface Particle{
  public void show();
  public void move();  
}

class NormTheStarling implements Particle{
  double x;
  double y;
  color cColor;
  double speed;
  double angle;
  int magnitude;

  NormTheStarling() {
    x=250;
    y=250;
    speed=Math.random()*10;
    angle=Math.random()*180;
    magnitude=3;
  }

  public void show() {                                      //shows stars as circles
   fill(255);
   ellipse((int)x, (int)y, 10,13);
  }

  public void move() {
    x=x+Math.cos(angle)*speed;
    y=y+Math.sin(angle)*speed;
  }
}

class HughTheStarling extends NormTheStarling{
  public void show() {                                      //shows star as triangle
   fill(255,0,0);
   triangle((float)x, (float)y, (float)x+10, (float)y+10, (float)x+10, (float)y);
  }
}

class thatOneAuntWePretendToLike extends NormTheStarling{
  public void show(){
    fill((int)(Math.random()*255));                          //show star as rectangle
    rect((int)x,(int)y,50,50);
  }
  public void move(){                                        //accelerates stars!(rectangle)
    movecount=movecount+1;
    if(movecount%4==0){
      x=x+Math.cos(angle)*(speed-movecount);
      y=y+Math.sin(angle)*(speed-movecount);
    }
  }
}


