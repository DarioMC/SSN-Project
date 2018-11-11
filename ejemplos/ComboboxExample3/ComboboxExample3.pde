//Imports
import processing.serial.*;
import controlP5.*;
import java.util.*;
 
//Variable Declarations
ControlP5 cp5;
ScrollableList PortList;
ScrollableList BaudList;
String tport;
int tbaud;
Serial myPort;      // The serial port
int whichKey = -1;  // Variable to hold keystoke values
int inByte = -1;    // Incoming serial data
int Indexport =0;
int Indexbaud =1;
 
///Setup/////
void setup() {
  size(400, 400);
  // create a font with the third font available to the system:
  PFont myFont = createFont(PFont.list()[2], 14);
  textFont(myFont);
 
  // List all the available serial ports:
  // printArray(Serial.list());
 
  cp5 = new ControlP5(this); 
  String[] portNames =Serial.list();
 
  PortList = cp5.addScrollableList("Port") 
    .setPosition(10, 10) 
      .setSize(100, 100) 
        .setBarHeight(20) 
          .setItemHeight(20) 
            .addItems(portNames) 
              .setFont(createFont("Arial", 13))
                .setColorForeground(color(40, 128))
                  .setValue(Indexport);
                  
  List BList = Arrays.asList("4800", "9600", "19200", "38400", "57600", "115200");
  BaudList= cp5.addScrollableList("Baud")
    .setPosition(200, 10)
      .setSize(100, 100)
        .setBarHeight(20)
          .setItemHeight(20)
            .addItems(BList)
              .setFont(createFont("Arial", 13))
                .setColorForeground(color(40, 128))
                  .setValue(Indexbaud);

  myPort = new Serial(this,  PortList.getCaptionLabel().getText(), int (BaudList.getCaptionLabel().getText()));
}
 
void draw() { 
 
  background(0);
  //text("Last Received: " + inByte, 10, 130);
  //text("Last Sent: " + whichKey, 10, 100);
}
 
void serialEvent(Serial myPort) {
  inByte = myPort.read();
}



void keyPressed() {
  // Send the keystroke out:
  myPort.write(key);
  whichKey = key;
}
 
 
void controlEvent(ControlEvent theEvent){
  if(theEvent.getController() == PortList){
    println("port selected :)");
  }
 
  if(theEvent.getController() == BaudList){
    println("baud rate selected :v");
  }
}
