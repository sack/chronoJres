import processing.core.*; 
import processing.xml.*; 

import controlP5.*; 

import java.applet.*; 
import java.awt.Dimension; 
import java.awt.Frame; 
import java.awt.event.MouseEvent; 
import java.awt.event.KeyEvent; 
import java.awt.event.FocusEvent; 
import java.awt.Image; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

public class chronoJres extends PApplet {

Timer timer;
PFont font,font2;


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



public void setup() {
  
  font = loadFont("LcdD-200.vlw"); 
  font2 = loadFont("NimbusSanL-BoldCondItal-150.vlw"); 
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

public void draw(){
  
  if (firstStart)
  {
    background(0);
     textFont(font);
    text("JRES 2011",120, height/3);
    int s = second();  
    int m = minute(); 
    int h = hour();    
    text(String.format("%02d", h)+":"+ String.format("%02d", m)+":"+ String.format("%02d", s),180, 500);

  }
  else if (timer.theEnd)
  {
    background(255,0,0);
     textFont(font2);
    text("Temps d\u00e9pass\u00e9",55, 200);
     
  }
  
  
  else if(timer.running && !timer.paused && timer.session){
    //session
    background(0);
    rectMode(CORNER);
    fill(0,255,0);
    rect(0, map(timer.getSessionTimeLeft()  , 0, timer.sessionTime, height,0), width,height );
    int Minutes = ((int)timer.getSessionTimeLeft() % (1000*60*60)) / (1000*60);
    int Seconds = (((int)timer.getSessionTimeLeft() % (1000*60*60)) % (1000*60)) / 1000;
//    println ( timer.getSessionTimeLeft() +":"+ Minutes+":"+ Seconds);
    //  noFill();
    rectMode(CENTER);
    fill(255);
    text(String.format("%02d", Minutes)+":"+ String.format("%02d", Seconds),180, height/2);

  }
  else if (!timer.session && timer.running) {
    //questions
    background(255,165,0);
    rectMode(CENTER);
   // text("Questions", 50 , height/2);
    rectMode(CORNER);
    fill(255,0,0);
    rect(0, map((timer.getQuestionsTimeLeft()), 0, timer.questionsTime, 0,height), width,height); 
    int Minutes = ((int)timer.getQuestionsTimeLeft() % (1000*60*60)) / (1000*60);
    int Seconds = (((int)timer.getQuestionsTimeLeft() % (1000*60*60)) % (1000*60)) / 1000;
    fill(255);
    text(String.format("%02d", Minutes)+":"+ String.format("%02d", Seconds), 180 , height/2);
  } 
  
} 
public void initBut() {
 //background(bgColor);
 startBut = controlP5.addButton(start, 0, 100, 700, 80, 19);
 startBut.setColorBackground(butColor);
 startBut.setColorForeground(activeColor);

 pauseBut = controlP5.addButton(pause, 0, 100, 700, 80, 19);
 pauseBut.setColorBackground(butColor);
 pauseBut.setColorForeground(activeColor);
 pauseBut.setVisible(false);

 razBut = controlP5.addButton(raz, 255, 300, 700, 80, 19);
 razBut.setColorBackground(butColor);
 razBut.setColorForeground(activeColor);

 configBut = controlP5.addButton(config, 128, 500, 700, 80, 19);
 configBut.setColorBackground(butColor);
 configBut.setColorForeground(activeColor);
}

public void initConfig() {

 minutsTf = controlP5.addTextfield(minuts, 100, 700, 25, 20);
 minutsTf.setColorBackground(butColor);
 minutsTf.setColorForeground(activeColor);
 secondsTf = controlP5.addTextfield(seconds, 140, 700, 25, 20);
 secondsTf.setColorBackground(butColor);
 secondsTf.setColorForeground(activeColor);

 timeLabel = controlP5.addTextlabel(labelTime, labelTime, 100, 680);

 minutsTf.setValue(defaultMin);
 secondsTf.setValue(defaultSec);

 qMinutsTf = controlP5.addTextfield(qMinuts, 260, 700, 25, 20);
 qMinutsTf.setColorBackground(butColor);
 qMinutsTf.setColorForeground(activeColor);
 qSecondsTf = controlP5.addTextfield(qSeconds, 300, 700, 25, 20);
 qSecondsTf.setColorBackground(butColor);
 qSecondsTf.setColorForeground(activeColor);

 questionLabel = controlP5.addTextlabel(labelQuestion, labelQuestion, 260,
680);

 qMinutsTf.setValue(defaultMin);
 qSecondsTf.setValue(defaultSec);

 minutsTf.setFocus(true);

 okBut = controlP5.addButton(ok, 20, 380, 700, 40, 19);
 okBut.setColorBackground(butColor);
 okBut.setColorForeground(activeColor);
 cancelBut = controlP5.addButton(cancel, 20, 440, 700, 40, 19);
 cancelBut.setColorBackground(butColor);
 cancelBut.setColorForeground(activeColor);
}

public void hideBut() {
 //background(bgColor);
 startBut.setVisible(false);
 razBut.setVisible(false);
 configBut.setVisible(false);

}

public void showConfig() {
 //background(bgColor);
 okBut.setVisible(true);
 cancelBut.setVisible(true);
 qMinutsTf.setVisible(true);
 qSecondsTf.setVisible(true);
 minutsTf.setVisible(true);
 secondsTf.setVisible(true);
 okBut.setVisible(true);
 timeLabel.setVisible(true);
 questionLabel.setVisible(true);
}

public void showBut() {
 background(bgColor);
 startBut.setVisible(true);
 razBut.setVisible(true);
 configBut.setVisible(true);
}


public void hideConfig() {
 background(bgColor);
 okBut.setVisible(false);
 cancelBut.setVisible(false);
 qMinutsTf.setVisible(false);
 qSecondsTf.setVisible(false);
 minutsTf.setVisible(false);
 secondsTf.setVisible(false);
 okBut.setVisible(false);
 timeLabel.setVisible(false);
 questionLabel.setVisible(false);

}

public void controlEvent(ControlEvent theEvent) {

 if (theEvent.controller().name() == start)
 {
   //on remplace start par pause et on d\u00e9marre le cpte a rebours
   //on masque le bouton config
   startBut.setVisible(false);
   pauseBut.setVisible(true);
   configBut.setVisible(false);
   //background(bgColor);
   firstStart=false;
   timer.start();
 
 }
 if (theEvent.controller().name() == pause)
 {
   //on remplace pause par start et on met en pause le cpte a rebours
   pauseBut.setVisible(false);
   startBut.setVisible(true);
   configBut.setVisible(true);
   timer.pause();
   //background(bgColor);
 }
 if (theEvent.controller().name() == raz)
 {
   //on remet a zero le compte
 }
 if (theEvent.controller().name() == config)
 {
   //on maque les boutons et on affiche la configuration
   hideBut();
   showConfig();
 }
 if (theEvent.controller().name() == ok)
 {
   //on recup\u00e8re le temps saisi
   //on masque la config et on rafiche les boutons
   hideConfig();
   showBut();
 }
 if (theEvent.controller().name() == cancel)
 {
   //on efface la config et on affiche les boutons
   hideConfig();
   showBut();
 }
}
class Timer {

  long startTime;
  long currentTime;

  boolean running=false;
  boolean paused=false;
  boolean theEnd=false;

  long questionsTime=0;
  long sessionTime=0;
  
  long sessionTimeLeft=0;
  long questionsTimeLeft=0;
  
  boolean session=false;

  Timer(int sT, int qT) {
    questionsTime = qT;
    sessionTime = sT;
    running = false ;
    currentTime = 0 ;
    session=true;
    theEnd=false;
  }

  public float getCurrentTimeMs() {
    if ( running )
      return (millis() - startTime);
    else
      return currentTime ;
  }

  public int getCurrentTimeSec() {
    if ( running )
      return ( (int) ( (millis() - startTime) / 1000.0f) ) ;
    else
      return ( (int) (currentTime / 1000.0f) ) ;
  }
  
  public void start()
  {
    if (paused)
    {
      startTime = millis() - currentTime ;
      running=true;
      paused=false;
    }
    else if (!running) {

      running = true ;
      startTime = millis() ;
    }
  }

  public void pause()
  {  
    if (running)
    {
      currentTime = millis() - startTime ;
      running = false ;
      paused=true;
    }
  }

  public float getSessionTimeLeft()
  {
    float tLeft = sessionTime-getCurrentTimeMs();
    
    if (tLeft <= 0)
    {
      session=false;
      running=false;
      start();
    }
    return tLeft;
  }
  
  public float getQuestionsTimeLeft()
  {
     
    float tLeft = questionsTime-getCurrentTimeMs();
    
    if (tLeft <= 0)
    {
      session=true;
      running=false;
      theEnd=true;
      
    }
    return tLeft;
  }
  
}

  static public void main(String args[]) {
    PApplet.main(new String[] { "--present", "--bgcolor=#666666", "--stop-color=#cccccc", "chronoJres" });
  }
}
