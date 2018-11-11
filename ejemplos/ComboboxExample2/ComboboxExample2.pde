import processing.serial.*; 
import controlP5.*; 
 
ControlP5 cp5; 
ScrollableList portList;
 
void setup() { 
  size(400, 400); 
 
  // initiate cp5-library
  cp5 = new ControlP5(this); 
 
  String[] portNames =Serial.list(); 
  portList = cp5.addScrollableList("COM Port") 
    .setPosition(10, 10) 
    .setSize(200, 100) 
    .setBarHeight(20) 
    .setItemHeight(20) 
    .addItems(portNames) 
    .setValue(0);
 
  println(portList.getCaptionLabel().getText());
}
 
void draw() {
  background(0);
}
