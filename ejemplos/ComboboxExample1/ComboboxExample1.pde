import processing.serial.*;
import controlP5.*;
 
ControlP5 cp5;
 
void setup() {
  size(400, 400);
 
  cp5 = new ControlP5(this);
  cp5.addScrollableList("port")
     .setPosition(10, 10)
     .setSize(200, 200)
     .setBarHeight(20)
     .setItemHeight(20)
     .addItems(Serial.list())
     ;
}
 
void draw() {
  background(0);
}
 
void port(int n) {
  println(cp5.get(ScrollableList.class, "port").getItem(n).get("text"));  
}
