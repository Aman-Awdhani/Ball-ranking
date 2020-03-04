class particle {
  float x = random(0, width);
  float y = random(0, height);
  int rank = 100000;
  int r = 15;

  PVector pos = new PVector(x, y);   
  PVector vel = PVector.random2D();
  color col = color(int(random(100, 255)), int(random(100, 255)), int(random(100, 255)));

  void show() {   
    textSize(15);
    fill(col);
    text(rank, pos.x - 4, pos.y - 10);
    circle(pos.x, pos.y, r);
  }

  void move() {   
    pos.add(vel);
  }

  void constraint() {


    if (pos.x + r > width || pos.x - r < 0) {
      float tempX = vel.x*-1;
      vel = new PVector(tempX, vel.y);
    }
    if (pos.y + r > height || pos.y < 0) {
      float tempY = vel.y*-1;
      vel = new PVector(vel.x, tempY);
    }
    if (pos.x  > targetPos.x - targetLength/2 && pos.x  < targetPos.x + targetLength/2) {
      if (pos.y - r < targetPos.y + targetLength/2 && pos.y + r > targetPos.y - targetLength/2) {
        float tempY = vel.y*-1;
        vel = new PVector(vel.x, tempY);
        return;
      }
    }
    if (pos.y  > targetPos.y - targetLength/2 && pos.y  < targetPos.y + targetLength/2) {
      if (pos.x - r < targetPos.x + targetLength/2 && pos.x + r > targetPos.x - targetLength/2) {
        float tempX = vel.x*-1;
        vel = new PVector(tempX, vel.y);
        return;
      }
    }
  }
}
