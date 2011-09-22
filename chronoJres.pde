Timer timer;

PFont font;




void setup() {
  
  font = loadFont("LcdD-200.vlw"); 
  textFont(font);
  
  size(800,600);
  background(0);
  timer = new Timer(60000);
  timer.start();
}

void draw(){
  
  if (timer.isFinished()) {
    background(255,0,0);
     rectMode(CENTER);
    fill(255);
    text("Time's UP", 50 , height/2);
    
   // timer.start();
  }else{
    
    background(0);
    rectMode(CORNER);
    fill(0,255,0);
    rect(0, map(timer.getPassedTime(), 0, timer.getTotalTime(), 0, height), width,height );
    int Hours = timer.getTimeLeft() / (1000*60*60); 
    int Minutes = (timer.getTimeLeft() % (1000*60*60)) / (1000*60);
    int Seconds = ((timer.getTimeLeft() % (1000*60*60)) % (1000*60)) / 1000;
    //println (Hours +":"+ Minutes+":"+ Seconds);
  //  noFill();
    rectMode(CENTER);
    fill(255);
    text(Hours +":"+ Minutes+":"+ Seconds, 180 , height/2);
    
  }
  
  
} 
