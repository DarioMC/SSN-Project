class CircleAgent
{

  float r;
  Body body;
  FixtureDef fixtureDef;

  
  CircleAgent(float x, float y, float r, boolean staticWheel)
  {
    this.r = r;

    BodyDef bodyDef = new BodyDef();
    bodyDef.setType(BodyType.STATIC);
    bodyDef.setPosition(box2d.coordPixelsToWorld(x, y));
    body = box2d.createBody(bodyDef);

    CircleShape circleShape = new CircleShape();
    circleShape.setRadius(box2d.scalarPixelsToWorld(r));

    FixtureDef fixtureDef = new FixtureDef();
    fixtureDef.shape = circleShape;
    fixtureDef.density = 1;
    fixtureDef.friction = 0.1;
    fixtureDef.restitution = 0.8;

    body.createFixture(fixtureDef);

    body.setLinearVelocity(new Vec2(random(-10, 10), random(0, 10)));
    body.setAngularVelocity(random(-10, 10));
    
    body.setLinearVelocity(new Vec2(random(-10, 10), random(0, 10)));
    body.setAngularVelocity(random(-10, 10));
  }
  
  CircleAgent(float x, float y, float r, float friction)
  {
    this.r = r;

    BodyDef bodyDef = new BodyDef();
    bodyDef.setType(BodyType.DYNAMIC);
    bodyDef.setPosition(box2d.coordPixelsToWorld(x, y));
    body = box2d.createBody(bodyDef);

    CircleShape circleShape = new CircleShape();
    circleShape.setRadius(box2d.scalarPixelsToWorld(r));

    fixtureDef = new FixtureDef();
    fixtureDef.shape = circleShape;
    fixtureDef.density = 1;
    fixtureDef.friction = friction;
    fixtureDef.restitution = 0.8;

    body.createFixture(fixtureDef);

    body.setLinearVelocity(new Vec2(random(-10, 10), random(0, 10)));
    body.setAngularVelocity(random(-10, 10));
    
    body.setLinearVelocity(new Vec2(random(-10, 10), random(0, 10)));
    body.setAngularVelocity(random(-10, 10));
  }

  void setFriction(float value){
    fixtureDef.friction = value;
  }
  

  void display()
  {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);
    fill(0);
    stroke(255);
    strokeWeight(2);
    ellipse(0, 0, r * 2, r * 2);
    line(-r, 0, r, 0);
    line(0, -r, 0, r);
    popMatrix();
  }
  
  
}
