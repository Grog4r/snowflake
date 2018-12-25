Particle current;
ArrayList<Particle> snowflake;

boolean done = false;

void setup() {
  //size(600, 600);
  fullScreen();
  current = new Particle(height/2, random(10));
  //frameRate(15);
  snowflake = new ArrayList<Particle>();
}

void draw() {
  translate(width/2, height/2);
  background(0);

  while (!current.finished() && !current.intersects(snowflake)) {
    current.update();
  }
  if(current.pos.x >= height/2-2) {
    done = true;
  }
  snowflake.add(current);
  current = new Particle(height/2, 0);
  //rotate(PI/8);
  
  
  for (int i=0; i < 8; i++) {
    rotate(PI/4);
    //current.show();
    for (Particle p : snowflake) {
      p.show();
    }

    pushMatrix();
    scale(1, -1);
    //current.show();
    for (Particle p : snowflake) {
      p.show();
    }
    popMatrix();
  }
  if (done) {
    snowflake = new ArrayList<Particle>();
    println("DONE");
    done = false;
  }
}
