class Particle {
  float x, y, r, b, o, c;
  PVector loc, vel, acc;

  Particle(float _x, float _y) {
    x = _x;
    y = _y;
    r = random(25, 100);
    loc = new PVector(x, y);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    b = 0;
    o = 0;
    c = int(random(150, 255));
  }


  void sketch() {
    fill(255, 100);
    noStroke();
    ellipse(loc.x, loc.y, r, r);
  }


  void grow() {
    fill(c, random(255), b, o);
    noStroke();
    ellipse(loc.x, loc.y, r, r);
  }


  void update() {
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
    o += 0.2;
    b += 0.5;
    if (r > 1) {
      r -= 0.15;
    } else {
      r = 0.5;
    }
  }


  void applyForce(PVector f) {
    acc.add(f);
  }


  void reset() {
    loc = new PVector(x, y);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    r = random(25, 100);
    b = 0;
    o = 0;
  }
}