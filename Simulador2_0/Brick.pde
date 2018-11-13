class Brick {

  Body body;
  float w, h;
  color c;



  Brick(float x, float y, float w, float h) {
    this.w = w;
    this.h = h;
    makeBody(x, y);
    c = color(#A7542E);
  }


  void makeBody(float x, float y) {
    BodyDef bd = new BodyDef();
    bd.position.set(box2d.coordPixelsToWorld(x, y));
    bd.setType(BodyType.STATIC);
    body = box2d.world.createBody(bd);

    PolygonShape ps = new PolygonShape();
    ps.setAsBox(box2d.scalarPixelsToWorld(w / 2), box2d.scalarPixelsToWorld(h / 2));    

    FixtureDef fd = new FixtureDef();
    fd.setShape(ps);

    fd.setDensity(100);
    fd.setFriction(0);
    fd.setRestitution(0);

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
    strokeWeight(1);
    rect(0, 0, w, h);
    popMatrix();
  }
}
