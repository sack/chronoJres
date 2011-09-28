// thx to Daniel Shiffman for the startup code


class Timer {
 
  int savedTime; // When Timer started
  int totalTime; // How long Timer should last
  int presentationTime; // time for slides:)
  int questionTime; // time for questions
  int passedTime;
  int pauseTime; //time of pause
  
  boolean started=false;
  boolean pause=false;
  
  Timer(int tempPresentationTime,int tempQuestionTime) {
    presentationTime = tempPresentationTime;
    questionTime = tempQuestionTime;
    totalTime = presentationTime + questionTime;
  }
  
  // Starting the timer
  void start() {
    // When the timer starts it stores the current time in milliseconds.
    savedTime = millis(); 
    started=true;
    
    println("---------------------------------start");
    
  }
  
  int getPassedTime(){
    if (started){
      print("-");
      //println((millis()- savedTime+pauseTime)/1000);
      return (millis()- savedTime+pauseTime);
    }else{  
      return (0);
    }
   
   
  }
  
  int getTotalTime(){
    return (totalTime);
  }
  
   int getPresentationTime(){
    return (presentationTime);
  }
  int getQuestionTime(){
    return (questionTime);
  }
  
  
  int getPresentationTimeLeft(){
    return (presentationTime - getPassedTime());
  }
  
  int getQuestionTimeLeft(){
    return (totalTime-getPassedTime());
  }
  
    // Timer fini Presentation + question 
  boolean isPresentationFinished() { 
      // Check how much time has passed
      
      if (getPassedTime() > presentationTime) {
        return true;
      } else {
        return false;
      }

   }
 
  // Timer fini Presentation + question 
  boolean isFinished() { 
      // Check how much time has passed
      
      if (getPassedTime() > totalTime) {
        return true;
      } else {
        return false;
      }

   }
   
   boolean isStarted() { 
    
        return started;
     
   }
   boolean isPaused() { 
      // hold on
        
        return pause;
      

   }
   
   
   boolean pause() { 
      // hold on
        if (started){
        started=false;
        pause=true;
        pauseTime=millis();
        println ("pause");
        }else{
        started=true;
        pause=false;
        println ("play");
        }
        
        return true;
      

   }
   
   
   
   
  
 }
