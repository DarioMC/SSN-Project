class Box {

  Body body;
  float w, h;
  color c;
  boolean isBrick = false;
  float Friction = 0.7;


  Box(float x, float y, float w, float h) {
    this.w = w;
    this.h = h;
    makeBody(x, y);
    c = color(#CDAFFF);
  }

  Box(float x, float y, float w, float h, boolean isBrick) {
    this.w = w;
    this.h = h;
    makeBody(x, y);
    c = color(#A7542E);
    this.isBrick = isBrick;
  }


  void makeBody(float x, float y) {
    BodyDef bd = new BodyDef();
    bd.position.set(box2d.coordPixelsToWorld(x, y));
    bd.setType(BodyType.DYNAMIC);
    body = box2d.world.createBody(bd);

    PolygonShape ps = new PolygonShape();
    ps.setAsBox(box2d.scalarPixelsToWorld(w / 2), box2d.scalarPixelsToWorld(h / 2));    

    FixtureDef fd = new FixtureDef();
    fd.setShape(ps);
    
    if (isBrick) {
      fd.setDensity(100);
      fd.setFriction(0);
      fd.setRestitution(0);
      
    } else {
      
      fd.setDensity(1);
      fd.setFriction(Friction);
      fd.setRestitution(0.5);
    }

    body.createFixture(fd);
  }


  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);
    fill(c);
    stroke(255);
    rectMode(CENTER);
    if (!isBrick) {
      strokeWeight(3);
      rect(0, 0, w, h, 10, 10, 0, 0);
    } else {
      strokeWeight(1);
      rect(0, 0, w, h);
    }
    popMatrix();
  }
}
