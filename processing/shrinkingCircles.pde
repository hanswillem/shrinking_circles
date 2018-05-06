// shrinking circles
// -----------------
// 'c' - clear
// 'p' - start growing
// 'r' - replay


ArrayList<Particle> p;
boolean growing;
int frm;


void setup() {
  //size(1280, 720);
  fullScreen();
  background(0);
  p = new ArrayList<Particle>();
  cursor(CROSS);
  colorMode(HSB, 255);
  growing = false;
  frm = 0;
}


void draw() {
  //filter(GRAY);
  if (growing) { 
    growParticles();
    //save("render/frame_" + frm + ".png");
    frm ++;
  } else {
    sketchParticles();
  }
}


void sketchParticles() {
  background(0);
  if (mousePressed) { 
    p.add(new Particle(mouseX, mouseY));
  }
  for (Particle i : p) {
    i.sketch();
  }
}


void growParticles() {
  for (Particle i : p) {
    PVector n = new PVector(random(-0.012, 0.012), random(-0.012, 0.012));
    i.applyForce(n);
    i.update();
    i.grow();
  }
}


void keyPressed() { 
  // p
  if (keyCode == 80) {
    background(0);
    growing = true;
    frm = 0;
  }
  // r
  if (keyCode == 82) {
    for (Particle i : p) {
      i.reset();
    }
    background(0);
  }
  // c
  if (keyCode == 67) {
    p.clear();
    background(0);
    growing = false;
  }
}
