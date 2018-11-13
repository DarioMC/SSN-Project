class Wall {

  ArrayList<Brick> wall;

  Wall() {
    //Wall
    wall = new ArrayList();
    wall.add(new Brick(width-98, height-255, 50, 25));
    wall.add(new Brick(width-98, height-280, 50, 25));
    wall.add(new Brick(width-98, height-305, 50, 25));
    wall.add(new Brick(width-98, height-330, 50, 25));
    wall.add(new Brick(width-98, height-355, 50, 25));
    wall.add(new Brick(width-98, height-380, 50, 25));
    wall.add(new Brick(width-98, height-405, 50, 25));
    wall.add(new Brick(width-98, height-430, 50, 25));
    wall.add(new Brick(width-98, height-455, 50, 25));

    wall.add(new Brick(width-148, height-255, 50, 25));
    wall.add(new Brick(width-148, height-280, 50, 25));
    wall.add(new Brick(width-148, height-305, 50, 25));
    wall.add(new Brick(width-148, height-330, 50, 25));
    wall.add(new Brick(width-148, height-355, 50, 25));
    wall.add(new Brick(width-148, height-380, 50, 25));
    wall.add(new Brick(width-148, height-405, 50, 25));
    wall.add(new Brick(width-148, height-430, 50, 25));
    wall.add(new Brick(width-148, height-455, 50, 25));
  }

  void display() {
    for (Brick brick : wall) {
      brick.display();
    }
  }
  
}
