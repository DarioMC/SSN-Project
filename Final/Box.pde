class Box {

  Body body;
  float w, h;
  color c;
  boolean staticBox = false;


  Box(float x, float y, float w, float h) {
    this.w = w;
    this.h = h;
    makeBody(x, y);
    c = color(#C92F46);
  }

  Box(float x, float y, float w, float h, boolean isStatic) {
    this.w = w;
    this.h = h;
    makeBody(x, y);
    c = color(#C92F46);
    staticBox = isStatic;
  }


  void makeBody(float x, float y) {
    BodyDef bd = new BodyDef();
    bd.position.set(box2d.coordPixelsToWorld(x, y));
    if (staticBox) {
      bd.setType(BodyType.STATIC);
    } else {
      bd.setType(BodyType.DYNAMIC);
    }

    body = box2d.world.createBody(bd);

    PolygonShape ps = new PolygonShape();
    ps.setAsBox(box2d.scalarPixelsToWorld(w / 2), box2d.scalarPixelsToWorld(h / 2));    

    FixtureDef fd = new FixtureDef();
    fd.setShape(ps);

    fd.setDensity(1);
    fd.setFriction(0.2);
    fd.setRestitution(0.5);

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
    strokeWeight(3);
    rect(0, 0, w, h, 10, 10, 0, 0);
    popMatrix();
  }
}
