class Proyectiles{
  
  Body body;
  color c;
  float r;
  
  Proyectiles (float x, float y, float r_, color c_){
    c = colr;
    this.r = r_;
    this.c = c_;
   
    BodyDef bd = new BodyDef();

    bd.position = box2d.coordPixelsToWorld(x, y);
    bd.type = BodyType.DYNAMIC;
    body = box2d.createBody(bd);

    // Make the body's shape a circle
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r/2);

    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    // Parameters that affect physics
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = rest;

    // Attach fixture to body
    body.createFixture(fd);
    
    body.setUserData(this);
  }
  
  void change() {
    this.c = color(random(150), random(150), random(150));
  }
 
    void display() {
      // We look at each body and get its screen position
      Vec2 pos = box2d.getBodyPixelCoord(body);
      // Get its angle of rotation
      float a = body.getAngle();
      pushMatrix();
      translate(pos.x, pos.y);
      rotate(a);
      fill(this.c);
      ellipse(0, 0, this.r, this.r);
      popMatrix();
      
    }
}
