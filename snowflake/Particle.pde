class Particle {

  PVector pos;
  float r;

  Particle(float x, float y) {
    pos = new PVector(x, y);
    r = 3;
  }

  void update() {
    pos.x -= 1;
    pos.y += random(-4, 4);
    
    float angle = pos.heading();
    angle = constrain(angle, 0, PI/6);
    float magnitude = pos.mag();
    pos = PVector.fromAngle(angle);
    pos.setMag(magnitude);
  }

  void show() {
    stroke(255);
    fill(255);
    ellipse(pos.x, pos.y, r*2, r*2);
  }

  boolean finished() {
    return (pos.x < 1);
  }

  boolean intersects(ArrayList<Particle> others) {
    boolean result = false;
    for (Particle other : others) {
      float d = dist(other.pos.x, other.pos.y, pos.x, pos.y);
      if (d < r*2) {
        result = true;
        break;
      }
    }
    return result;
  }
}
