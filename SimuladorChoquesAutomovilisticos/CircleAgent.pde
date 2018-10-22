class CircleAgent extends Agent
{

  float r;

  CircleAgent(float x, float y, float r)
  {
    this.r = r;

    BodyDef bodyDef = new BodyDef();
    bodyDef.setType(BodyType.DYNAMIC);
    bodyDef.setPosition(box2d.coordPixelsToWorld(x, y));
    body = box2d.createBody(bodyDef);

    CircleShape circleShape = new CircleShape();
    circleShape.setRadius(box2d.scalarPixelsToWorld(r));

    FixtureDef fixtureDef = new FixtureDef();
    fixtureDef.shape = circleShape;
    fixtureDef.density = 1;
    fixtureDef.friction = 0.01;
    fixtureDef.restitution = 0.8;

    body.createFixture(fixtureDef);

    body.setLinearVelocity(new Vec2(random(-10, 10), random(0, 10)));
    body.setAngularVelocity(random(-10, 10));
    
    body.setLinearVelocity(new Vec2(random(-10, 10), random(0, 10)));
    body.setAngularVelocity(random(-10, 10));
  }

  void killBody()
  {
    box2d.destroyBody(body);
  }

  boolean done()
  {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    if (pos.y > height + r)
    {
      killBody();
      return true;
    }

    return false;
  }

  void display()
  {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);
    fill(#E859C4);
    stroke(255);
    strokeWeight(2);
    ellipse(0, 0, r * 2, r * 2);
    line(-r, 0, r, 0);
    line(0, -r, 0, r);
    popMatrix();
  }
  
  
}
