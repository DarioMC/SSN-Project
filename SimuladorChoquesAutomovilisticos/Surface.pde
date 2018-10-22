class Surface {
  ArrayList<Vec2> points;

  Surface(ArrayList<Vec2> points) {
    this.points = points;

    BodyDef bodyDef = new BodyDef();
    bodyDef.position = new Vec2(0, 0);
    Body body = box2d.createBody(bodyDef);

    Vec2[] worldPoints = new Vec2[points.size()];
    for (int i = 0; i < points.size(); i++) {
      worldPoints[i] = box2d.coordPixelsToWorld(points.get(i));
    }
    ChainShape chainShape = new ChainShape();
    chainShape.createChain(worldPoints, worldPoints.length);
    body.createFixture(chainShape, 1); // en lugar del fixture def
  }

  void display() {
    stroke(255);
    strokeWeight(5);
    fill(255);
    pushMatrix();
    beginShape();
    for (int i = 0; i < points.size() - 1; i++) {
      Vec2 v1 = points.get(i);
      //Vec2 v2 = points.get(i + 1);
      vertex(v1.x, v1.y);
    }
    endShape(CLOSE);
    popMatrix();
  }
}
