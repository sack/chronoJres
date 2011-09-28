Timer timer;
PFont font;

import controlP5.*;

ControlP5 controlP5;

//nom des boutons
String start = "DEMARRER";
String raz = "REINITIALISER";
String pause = "PAUSE";
String config = "CONFIGURER";
String cancel = "ANNULER";
String ok = "VALIDER";
String minuts = "Min";
String seconds = "Sec";
String qMinuts = " Min";
String qSeconds = " Sec";
String labelTime="Temps de la session";
String labelQuestion="Temps des questions";

//temps par defaut
String defaultMin="45";
String defaultSec="00";

Textfield minutsTf;
Textfield secondsTf;

Textfield qMinutsTf;
Textfield qSecondsTf;

Textlabel timeLabel;
Textlabel questionLabel;


Button startBut;
Button pauseBut;
Button razBut;
Button configBut;
Button okBut;
Button cancelBut;

int butColor = color(80);
int activeColor = color(120);
int bgColor = color(0);



void setup() {
  
  font = loadFont("LcdD-200.vlw"); 
  textFont(font);
  
  size(1024,768);
  background(0);
  timer = new Timer(5000,5000);
  timer.start();
  
  //controls
   controlP5 = new ControlP5(this);
 initBut();
 initConfig();
 hideConfig();
  
}

void draw(){
  
  
   if (timer.isFinished()) {
    background(255,0,0);
    text("Time's UP",55, height/2);
    
  }else if (timer.isPresentationFinished()&& (timer.isStarted())) {
    
    background(255,165,0);
    rectMode(CENTER);
   // text("Questions", 50 , height/2);
    rectMode(CORNER);
    fill(255,0,0);
    rect(0, map((timer.getPassedTime() - timer.getPresentationTime()), 0, timer.getQuestionTime(), height, 0), width,height); 
    int Minutes = (timer.getQuestionTimeLeft() % (1000*60*60)) / (1000*60);
    int Seconds = ((timer.getQuestionTimeLeft() % (1000*60*60)) % (1000*60)) / 1000;
    fill(255);
    text(String.format("%02d", Minutes)+":"+ String.format("%02d", Seconds), 180 , height/2);
    
  }else if(timer.isStarted()&&(!timer.isPaused())){
    
    background(0);
    rectMode(CORNER);
    fill(0,255,0);
    rect(0, map(timer.getPassedTime()  , 0, timer.getPresentationTime(), 0, height), width,height );
    int Minutes = (timer.getPresentationTimeLeft() % (1000*60*60)) / (1000*60);
    int Seconds = ((timer.getPresentationTimeLeft() % (1000*60*60)) % (1000*60)) / 1000;
    //println ( timer.getPresentationTimeLeft() +":"+ Minutes+":"+ Seconds);
    //  noFill();
    rectMode(CENTER);
    fill(255);
    text(String.format("%02d", Minutes)+":"+ String.format("%02d", Seconds),180, height/2);
    
  }else if(timer.isStarted()){
     background(0); 
     println("bloup");
     
    
  }
  
  
} 
