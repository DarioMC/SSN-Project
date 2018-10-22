class Car
{
  CircleAgent wheel1;
  CircleAgent wheel2;
  Box box;
  Joint joint;

  Car(CircleAgent c1, CircleAgent c2, Box box)
  {

    wheel1 = c1;
    wheel2 = c2;
    this.box = box;
    
    RevoluteJointDef rjd1 = new RevoluteJointDef();
    rjd1.initialize(wheel1.body, box.body, wheel1.body.getTransform().p);
    rjd1.motorSpeed = PI * 7;
    rjd1.maxMotorTorque = 500;
    rjd1.enableMotor = true;
    
    joint = box2d.createJoint(rjd1);
    
    RevoluteJointDef rjd2 = new RevoluteJointDef();
    rjd2.initialize(wheel2.body, box.body, wheel2.body.getTransform().p);
    rjd2.motorSpeed = PI * 7;
    rjd2.maxMotorTorque = 500;
    rjd2.enableMotor = true;
    
    joint = box2d.createJoint(rjd2);

    
  }
  
  void display()
  {
    box.display();
    wheel1.display();
    wheel2.display();
    
  }
}
