/*
  Proyecto- Simulación de Sistemas Naturales - IC8048
  Grupo: 40
  Integrantes:
    Christian Corrales Rounda - 200411437
    Darío Monestel Corella - 2014072300
    Ruth Ulloa Bonilla - 2015145716
    
  Segundo semestre 2018

*/

import ddf.minim.*;

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
Minim manager;
AudioPlayer background_music;

// ----------------------------------------------------------------------
// main functions

void setup()
{
  // runs only once
  //
  size(800, 600);
  smooth();
  manager = new Minim(this);
  background_music = manager.loadFile("Sound.mp3");
  background_music.loop();
  font = createFont("ARCARTER-78.vlw", 14);
  textFont(font);
  bg = loadImage("tarde.jpg");
  bg.resize(width,height);
} // func
//
void draw()
{
  // the main routine. It handels the states.
  // runs again and again
  image(bg,0,0);
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
  textSize(32);
  text("Simulador de Choques Automovilísticos", 100, 100, 3);
  textSize(20);
  text("Presionar 1: Realizar una simulación", 100, 200);
  text("Presionar 2: Acerca de la aplicación", 100, 220);
  //
  text("Presionar x: Para cerrar", 100, 260);
  //
} // func

void handleStateSeeSecondMenu() {
  background(73, 102, 185);
  fill(0);
  textSize(32);
  text("menú para configurar el entorno", 100, 100, 3);
  textSize(14);
  text("..... texto ", 100, 200);
  //
} // func
//

void handleStateSeeAbout() {
  background(73, 102, 185);
  fill(0);
  textSize(32);
  text("Aplicación para simular choques automovilísticos...", 4, 100, 3);
  textSize(12);
  text("Simulador de choques automovilísticos, con posibilidad de configurar diversas variables de entorno", 50, 190);
  text("para observar los diferentes comportamientos generados por dichas colisiones.", 50, 200);
  text("El simulador de choques permitirá escoger el tipo de vehículo, el tipo de colisión, porcentaje de alcohol", 50, 210);
  text("en la sangre y diferentes fuerzas para aplicar a los autos, esto con el fin de obtener", 50, 220); 
  text("datos más precisos, acorde a la simulación.", 50, 230);
  //
} // func
// ----------------------------------------------------------------
//
