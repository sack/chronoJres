// thx to Daniel Shiffman for the startup code


class Timer {
 
  int savedTime; // When Timer started
  int totalTime; // How long Timer should last
  int passedTime;
 
  
  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
  }
  
  // Starting the timer
  void start() {
    // When the timer starts it stores the current time in milliseconds.
    savedTime = millis(); 
  }
  
  int getPassedTime(){
    return (millis()- savedTime);
  }
  
  int getTotalTime(){
    return (totalTime);
  }
  
  int getTimeLeft(){
    return (totalTime-getPassedTime());
  }
  
  
  
  
  // The function isFinished() returns true if 5,000 ms have passed. 
  // The work of the timer is farmed out to this method.
  boolean isFinished() { 
    // Check how much time has passed
    
    if (getPassedTime() > totalTime) {
      return true;
    } else {
      return false;
    }

   }
  
 }
