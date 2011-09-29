Timer timer;
PFont font,font2,font3,font4;
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

boolean firstStart=true;



void setup() {
  
  font = loadFont("LcdD-200.vlw"); 
  font2 = loadFont("NimbusSanL-BoldCondItal-150.vlw");
  font3 = loadFont("NimbusSanL-Bold-80.vlw");
  font4 = loadFont("LcdD-100.vlw");
  textFont(font);
  
  size(1024,768);
  background(0);
  timer = new Timer(5000,5000);

  
  //controls
   controlP5 = new ControlP5(this);
 initBut();
 initConfig();
 hideConfig();
  
}

void draw(){
  
  if (firstStart)
  {
   
    startup();

  }
  else if (timer.theEnd)
  {
    background(255,0,0);
     textFont(font4);
    text("Temps dépassé",200, 200);
    int Minutes = ((int)timer.getCurrentTimeMs() % (1000*60*60)) / (1000*60);
    int Seconds = (((int)timer.getCurrentTimeMs() % (1000*60*60)) % (1000*60)) / 1000;
    textFont(font);
    text(String.format("%02d", Minutes)+":"+ String.format("%02d", Seconds),270, height/2);
    
    
  }
  
  
  else if(timer.running && !timer.paused && timer.session){
    //session
    background(0);
    rectMode(CORNER);
    fill(0,255,0);
    rect(0, map(timer.getSessionTimeLeft()  , 0, timer.sessionTime, height,0), width,height );
    int Minutes = ((int)timer.getSessionTimeLeft() % (1000*60*60)) / (1000*60);
    int Seconds = (((int)timer.getSessionTimeLeft() % (1000*60*60)) % (1000*60)) / 1000;
    //  println ( timer.getSessionTimeLeft() +":"+ Minutes+":"+ Seconds);
    //  noFill();
    rectMode(CENTER);
    fill(255);
    text(String.format("%02d", Minutes)+":"+ String.format("%02d", Seconds),270, height/2);
    

  }
  else if (!timer.session && timer.running) {
    //questions
    textFont(font);
    background(255,165,0);
    rectMode(CENTER);
   // text("Questions", 50 , height/2);
    rectMode(CORNER);
    fill(255,0,0);
    rect(0, map((timer.getQuestionsTimeLeft()), 0, timer.questionsTime, 0,height), width,height); 
    int Minutes = ((int)timer.getQuestionsTimeLeft() % (1000*60*60)) / (1000*60);
    int Seconds = (((int)timer.getQuestionsTimeLeft() % (1000*60*60)) % (1000*60)) / 1000;
    fill(255);
    text(String.format("%02d", Minutes)+":"+ String.format("%02d", Seconds), 270 , height/2);
    
    textFont(font3);
    fill(255,70);
    int s = second();  
    int m = minute(); 
    int h = hour();    
    text(String.format("%02d", h)+":"+ String.format("%02d", m)+":"+ String.format("%02d", s),680, 750);
    
    
  } 
  
} 

void startup(){
 background(0);
     textFont(font);
    text("JRES 2011",120, height/3);
    int s = second();  
    int m = minute(); 
    int h = hour();    
    text(String.format("%02d", h)+":"+ String.format("%02d", m)+":"+ String.format("%02d", s),180, 500);
}
