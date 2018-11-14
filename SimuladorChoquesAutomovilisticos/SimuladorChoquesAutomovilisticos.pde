/*
  Proyecto- Simulación de Sistemas Naturales - IC8048
 Grupo: 40
 Integrantes:
 Darío Monestel Corella - 2014072300
 Ruth Ulloa Bonilla - 2015145716
 
 Segundo semestre 2018
 
 */

//import ddf.minim.*;
import shiffman.box2d.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.common.*;
import java.util.ListIterator;
import controlP5.*;


Box2DProcessing box2d;

Surface surface;
Car car;
ControlP5 cp5;
ArrayList<Box> wall;
CircleAgent a1;
CircleAgent a2;
Box Friction;

//
// states
final int stateMenu                  = 0;
final int stateSeeSecondMenu      = 1;
final int stateSeeAbout = 2;
int state = stateMenu;
//
// font
PFont font;
PImage bg;
//
// Sound
//Minim manager;
//AudioPlayer background_music;

// ----------------------------------------------------------------------
// main functions

void setup()
{
  // runs only once
  //
  //size(800, 600);
  fullScreen();
  smooth();
  //manager = new Minim(this);
  //background_music = manager.loadFile("Sound.mp3");
  //background_music.loop();
  font = createFont("ARCARTER-78.vlw", 14);
  textFont(font);
  bg = loadImage("tarde.jpg");
  bg.resize(width, height);
  box2dInit();
  
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

  //Car
  CircleAgent a1 = new CircleAgent(0, height-250, 20);
  CircleAgent a2 = new CircleAgent(80, height-250, 20);
  Box box = new Box(40, height-270, 150, 50);
  car = new Car(a1, a2, box);

  //Wall
  wall = new ArrayList();
  wall.add(new Box(width-98, height-255, 50, 25, true));
  wall.add(new Box(width-98, height-280, 50, 25, true));
  wall.add(new Box(width-98, height-305, 50, 25, true));
  wall.add(new Box(width-98, height-330, 50, 25, true));
  wall.add(new Box(width-98, height-355, 50, 25, true));
  wall.add(new Box(width-98, height-380, 50, 25, true));
  wall.add(new Box(width-98, height-405, 50, 25, true));
  wall.add(new Box(width-98, height-430, 50, 25, true));
  wall.add(new Box(width-98, height-455, 50, 25, true));

  wall.add(new Box(width-148, height-255, 50, 25, true));
  wall.add(new Box(width-148, height-280, 50, 25, true));
  wall.add(new Box(width-148, height-305, 50, 25, true));
  wall.add(new Box(width-148, height-330, 50, 25, true));
  wall.add(new Box(width-148, height-355, 50, 25, true));
  wall.add(new Box(width-148, height-380, 50, 25, true));
  wall.add(new Box(width-148, height-405, 50, 25, true));
  wall.add(new Box(width-148, height-430, 50, 25, true));
  wall.add(new Box(width-148, height-455, 50, 25, true));
  
  
  
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
  case stateSeeSecondMenu:
    handleStateSeeSecondMenu();
    break;
  case stateSeeAbout:
    handleStateSeeAbout();
    break;
  default:
    println ("Unknown state (in draw) "
      + state
      + " ++++++++++++++++++++++");
    exit();
    break;
  } // switch
  //
} // func
// ----------------------------------------------------------------
// keyboard functions

void keyPressed() {
  // keyboard. Also different depending on the state.
  switch (state) {
  case stateMenu:
    keyPressedForStateMenu();
    break;
  case stateSeeSecondMenu:
    keyPressedForStateSeeSecondMenu();
    break;
  case stateSeeAbout:
    keyPressedForStateSeeAbout();
    break;
  default:
    println ("Unknown state (in keypressed) "
      + state
      + " ++++++++++++++++++++++");
    exit();
    break;
  } // switch
  //
} // func
void keyPressedForStateMenu() {
  //
  switch(key) {
  case '1':
    state = stateSeeSecondMenu;
    initControls();//start GUI(CP5)
    break;
  case '2':
    state = stateSeeAbout;
    break;
  case 'x':
  case 'X':
    // quit
    exit();
    break;
  default:
    // do nothing
    break;
  }// switch
  //
} // func
void keyPressedForStateSeeSecondMenu() {
  // any key is possible
  switch(key) {
  default:
    state = stateMenu;
    break;
  } // switch
  //
} // func
void keyPressedForStateSeeAbout() {
  // any key is possible
  switch(key) {
  default:
    state = stateMenu;
    break;
  } // switch
  //
} // func

// ----------------------------------------------------------------
// functions to show the menu and functions that are called from the menu.
// They depend on the states and are called by draw().

void showMenu() {
  //background(73, 102, 185);
  fill(0);
  textSize(50);
  text("Simulador de Choques Automovilísticos", 120, 255, 50);
  fill(0, 102, 153, 51);
  text("Simulador de Choques Automovilísticos", 130, 270, 50); 

  fill(0);
  textSize(30);
  text("( Presionar 1 )         Para realizar una simulación", 120, 390);

  fill(0, 102, 153, 51);
  text("( Presionar 1 )         Para realizar una simulación", 125, 400);


  fill(0);
  textSize(30);
  text("( Presionar 2 )         Acerca de la aplicación", 120, 470);
  fill(0, 102, 153, 51);
  text("( Presionar 2 )         Acerca de la aplicación", 125, 480);



  fill(0);
  textSize(30);
  text("( Presionar X )         Para cerrar", 120, 580);
  fill(0, 102, 153, 51);
  text("( Presionar X )         Para cerrar", 125, 590);
} // func




void handleStateSeeSecondMenu() {
  /*background(73, 102, 185);
   fill(0);
   textSize(32);
   text("menú para configurar el entorno", 100, 100, 3);
   textSize(14);
   text("..... texto ", 100, 200);*/
  //
  background(0);
  box2d.step();
  surface.display();
  car.display();
  for (Box box : wall) {
    box.display();
  }
} // func
//

void handleStateSeeAbout() {
  background(252, 118, 255);
  fill(0);
  textSize(32);
  text("Aplicación para simular choques automovilísticos...", 4, 100, 3);
  textSize(13);
  text("Simulador de choques automovilísticos, con posibilidad de configurar diversas variables de entorno", 50, 190);
  text("para observar los diferentes comportamientos generados por dichas colisiones.", 50, 210);
  text("El simulador de choques permitirá escoger el tipo de vehículo, el tipo de colisión, porcentaje de alcohol", 50, 220);
  text("en la sangre y diferentes fuerzas para aplicar a los autos, esto con el fin de obtener", 50, 230); 
  text("datos más precisos, acorde a la simulación.", 50, 240);
  //
} // func
// ----------------------------------------------------------------
//

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
    .setRange(0, 150)
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
  //car.addWind(value);
}

void setVelocidad(float value) {
  //car.setVelocity(value);
}

void setAlcohol(float value) {

}

void setFriccion(float value) {
  //a1.setFriction(value);
  //a2.setFriction(value); 
    for (int counter = 0; counter < wall.size(); counter++) {           
          //System.out.println(wall.get(counter)); 
          wall.get(counter).setFriction(value);
          
      } 
    
    
    
  
  }
  
 
  
