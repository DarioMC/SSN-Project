/*
 Proyecto- Simulación de Sistemas Naturales - IC8048
 Grupo: 40
 Integrantes:
 Darío Monestel Corella - 2014072300
 Ruth Ulloa Bonilla - 2015145716
 
 Segundo semestre 2018
 */


import shiffman.box2d.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.common.*;
import controlP5.*;


// variables
Box2DProcessing box2d;
ControlP5 cp5;
Surface surface;
Car car;
Car car2;
CircleAgent a1;
CircleAgent a2;
Wall wall;
//


// states
final int stateMenu = 0;
final int stateSeeSecondMenu = 1;
final int stateSeeAbout = 2;
int state = stateMenu;
//


// font
PFont font;
PImage bg;


// ----------------------------------------------------------------------
// main functions

void setup()
{
  fullScreen();
  smooth();
  font = createFont("ARCARTER-78.vlw", 14);
  textFont(font);
  box2dInit();
  initControls();//start GUI(CP5)
} // func
//


void box2dInit()
{
  box2d = new Box2DProcessing(this);
  box2d.createWorld();

  //Surface
  ArrayList<Vec2> points = new ArrayList();
  points.add(new Vec2(0, height));
  points.add(new Vec2(0, height-250));
  points.add(new Vec2(width, height-250));
  points.add(new Vec2(width, height));
  points.add(new Vec2(0, height));
  surface = new Surface(points);

  //Car 1
  a1 = new CircleAgent(0, height-250, 20);
  a2 = new CircleAgent(80, height-250, 20);
  Box box = new Box(40, height-280, 150, 70);
  car = new Car(a1, a2, box);

  //Car 2
  CircleAgent a3 = new CircleAgent(width-148, height-270, 20, true);
  CircleAgent a4 = new CircleAgent(width-228, height-270, 20, true);
  Box box1 = new Box(width-188, height-300, 150, 70, true);
  car2 = new Car(a3, a4, box1, true);


  //wall
  wall = new Wall();
}


void draw()
{
  background(#A1A0C4);
  box2d.step();
  surface.display();
  car.display();
  car2.display();
}

//Controls GUI
void initControls() {
  cp5 = new ControlP5(this);

 cp5 = new ControlP5(this);
    cp5.addSlider("setViento")
    .setPosition(10, 70)
    .setSize(300, 20)
    .setRange(0,1)
    .setValue(0)
    .setCaptionLabel("Viento");
 cp5 = new ControlP5(this);
    cp5.addSlider("setVelocidad")
    .setPosition(10, 10)
    .setSize(300, 20)
    .setRange(0, 10)
    .setValue(25)
    .setCaptionLabel("Velocidad");
 cp5 = new ControlP5(this);
    cp5.addSlider("setAlcohol")
    .setPosition(10, 100)
    .setSize(300, 20)
    .setRange(0, 1)
    .setValue(0)
    .setCaptionLabel("Alcohol");
  cp5 = new ControlP5(this);
    cp5.addSlider("setFricción")
    .setPosition(10, 40)
    .setSize(300, 20)
    .setRange(0, 1)
    .setValue(0.1)
    .setCaptionLabel("Friccion");
}

//Functions for use GUI
void setViento(float value) {
  car.addWind(value);
}

void setVelocidad(float value) {
  car.setVelocity(value);
}

void setAlcohol(float value) {
 // alcohol = value; 
}

void setFriccion(float value) {
  a1.setFriction(value);
  a2.setFriction(value);

  
}
