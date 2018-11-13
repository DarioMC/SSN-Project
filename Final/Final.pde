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
float viento, alcohol, friccion, velocidad;
int typeSimulation; // 0 = other car, 1 = wall
//


// states
final int stateMenu = 0;
final int stateSimulation = 1;
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
  font = createFont("Verdana", 20);
  textFont(font);
  bg = loadImage("wallpaper.png");
  bg.resize(width, height);
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
  a1 = new CircleAgent(0, height-250, 20, friccion);
  a2 = new CircleAgent(80, height-250, 20, friccion);
  Box box = new Box(40, height-280, 150, 70);
  car = new Car(a1, a2, box, velocidad, viento, alcohol);
}

void initStaticCar() {
  //Car 2
  CircleAgent a3 = new CircleAgent(width-148, height-270, 20, true);
  CircleAgent a4 = new CircleAgent(width-228, height-270, 20, true);
  Box box1 = new Box(width-188, height-300, 150, 70, true);
  car2 = new Car(a3, a4, box1, true);
}

void initWall() {
  //wall
  wall = new Wall();
}

void draw()
{
  // the main routine. It handels the states.
  // runs again and again
  image(bg, 0, 0);
  switch (state) {
  case stateMenu:
    showMenu();
    break;
  case stateSimulation:
    handleSimulation();
    break;
  } // switch
} // func


void showMenu() {
  fill(255);
  textSize(50);
  text("Simulador de Choques Automovilísticos", 120, 100, 50);
  fill(255, 200, 153, 51);
  text("Simulador de Choques Automovilísticos", 130, 110, 50);
  fill(255);
  textSize(20);
  text("Presione 0 para colisionar con otro auto o 1 para colisionar con una pared", 220, 140, 50);
  if (keyPressed) {
    if (key == '0') {
      typeSimulation = 0;
      initStaticCar();
      state = stateSimulation;
    }
    if (key == '1') {
      typeSimulation = 1;
      initWall();
      state = stateSimulation;
    }
  }
} // func


void handleSimulation() {
  switch(typeSimulation) {
  case 0:
    carVSCar();
    break;
  case 1:
    carVSWall();
    break;
  }
}

void carVSCar() {
  background(#A1A0C4);
  box2d.step();
  surface.display();
  car.display();
  car2.display();
}

void carVSWall() {
  background(#A1A0C4);
  box2d.step();
  surface.display();
  car.display();
  wall.display();
}

//Controls GUI
void initControls() {
  cp5 = new ControlP5(this);
  // change the default font to Verdana
  PFont p = createFont("Verdana", 100); 
  ControlFont font = new ControlFont(p);

  // change the original colors
  cp5.setColorForeground(0xffaa0000);
  cp5.setColorBackground(0xff660000);
  cp5.setFont(font);
  cp5.setColorActive(0xff000000);

  cp5 = new ControlP5(this);
  cp5.addSlider("setViento")
    .setPosition(100, 160)
    .setSize(300, 20)
    .setRange(0, 1)
    .setValue(0)
    .setCaptionLabel("Viento");
  cp5 = new ControlP5(this);
  cp5.addKnob("setVelocidad")
    .setPosition(10, 140)
    .setSize(50, 50)
    .setRange(1, 10)
    .setValue(25)
    .setCaptionLabel("Velocidad");
  cp5 = new ControlP5(this);
  cp5.addSlider("setAlcohol")
    .setPosition(530, 160)
    .setSize(300, 20)
    .setRange(0, 1)
    .setValue(0)
    .setCaptionLabel("Alcohol");
  cp5 = new ControlP5(this);
  cp5.addSlider("setFricción")
    .setPosition(1000, 160)
    .setSize(300, 20)
    .setRange(0, 1)
    .setValue(0.1)
    .setCaptionLabel("Friccion");
}

//Functions for use GUI
void setViento(float value) {
  viento = value;
}

void setVelocidad(float value) {
  velocidad = value;
  car.setVelocity(value);
}

void setAlcohol(float value) {
  alcohol = value;
}

void setFriccion(float value) {
  friccion = value;
}
