particle[] particles;
int size = 10;
PVector targetPos ;
int targetLength = 50;

void setup() {
  size(600, 400);
  targetPos = new PVector(width/2, height/2);
  particles = new particle[size];
  for (int i=0; i<size; i++) {
    particles[i] = new particle(); 
  }
}

void draw() {
  background(0); 
  particle[] temp = new particle[size];
  for (particle p : particles) {   
    p.show();
    temp = sorting();
    p.move();
    p.constraint();
  }

  for (int i=0; i<temp.length; i++) {
    temp[i].rank = i+1;
  }
  target(temp[0]);
}

void target(particle par) {

  fill(par.col);
  rectMode(CENTER);
  rect(targetPos.x,targetPos.y,targetLength , targetLength);
  stroke(par.col);
  line(targetPos.x, targetPos.y, par.pos.x, par.pos.y);
  stroke(0);
}

particle[] sorting() { 
  particle[] p = new particle[size];
  p = particles;
  for (int i=0; i<p.length; i++) {
    for (int j = i+1; j<p.length; j++) {
      float dis1 =abs(dist(targetPos.x , targetPos.y , p[i].pos.x , p[i].pos.y));
      float dis2 =abs(dist(targetPos.x , targetPos.y , p[j].pos.x , p[j].pos.y));
      if (dis1 > dis2) {
        particle temp = p[i];
        p[i] = p[j];
        p[j] = temp;
      }
    }
  }
  return p;
}
