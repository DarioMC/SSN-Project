class Car
{
  CircleAgent wheel1;
  CircleAgent wheel2;
  Box box;
  RevoluteJoint joint;
  RevoluteJoint joint2;
  RevoluteJointDef rjd1;
  RevoluteJointDef rjd2;

  Car(CircleAgent c1, CircleAgent c2, Box box, Boolean staticCar)
  {
    wheel1 = c1;
    wheel2 = c2;
    this.box = box;

    RevoluteJointDef rjd1 = new RevoluteJointDef();
    rjd1.initialize(wheel1.body, box.body, wheel1.body.getTransform().p);
    rjd1.enableMotor = false;

    joint = (RevoluteJoint) box2d.createJoint(rjd1);

    RevoluteJointDef rjd2 = new RevoluteJointDef();
    rjd2.initialize(wheel2.body, box.body, wheel2.body.getTransform().p);
    rjd2.enableMotor = false;

    joint2 = (RevoluteJoint) box2d.createJoint(rjd2);
  }

  Car(CircleAgent c1, CircleAgent c2, Box box)
  {

    wheel1 = c1;
    wheel2 = c2;
    this.box = box;

    rjd1 = new RevoluteJointDef();
    rjd1.initialize(wheel1.body, box.body, wheel1.body.getTransform().p);
    rjd1.motorSpeed = PI * 9;
    rjd1.maxMotorTorque = 1000;
    rjd1.enableMotor = true;

    joint = (RevoluteJoint) box2d.createJoint(rjd1);

    rjd2 = new RevoluteJointDef();
    rjd2.initialize(wheel2.body, box.body, wheel2.body.getTransform().p);
    rjd2.motorSpeed = PI * 9;
    rjd2.maxMotorTorque = 1000;
    rjd2.enableMotor = true;

    joint2 = (RevoluteJoint) box2d.createJoint(rjd2);
  }

  void setVelocity(float value) {
    joint.setMotorSpeed( PI * (value));
    joint2.setMotorSpeed( PI * (value));
   
  }

  void addWind(float value){
    rjd1.motorSpeed = rjd1.motorSpeed - (rjd1.motorSpeed*value);
    rjd2.motorSpeed = rjd2.motorSpeed - (rjd2.motorSpeed*value);
  }
  
  void display()
  {
    box.display();
    wheel1.display();
    wheel2.display();
  }
}
