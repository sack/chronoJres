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

  Timer(long sT, long qT) {
    questionsTime = qT;
    sessionTime = sT;
    running = false ;
    currentTime = 0 ;
    session=true;
    theEnd=false;
  }

  float getCurrentTimeMs() {
    if ( running )
      return (millis() - startTime);
    else
      return currentTime ;
  }

  int getCurrentTimeSec() {
    if ( running )
      return ( (int) ( (millis() - startTime) / 1000.0) ) ;
    else
      return ( (int) (currentTime / 1000.0) ) ;
  }
  
  void start()
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

  void pause()
  {  
    if (running)
    {
      currentTime = millis() - startTime ;
      running = false ;
      paused=true;
    }
  }

  float getSessionTimeLeft()
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
  
  float getQuestionsTimeLeft()
  {
     
    float tLeft = questionsTime-getCurrentTimeMs();
    
    if (tLeft <= 0)
    {
      session=true;
      running=true;
      theEnd=true;
      startTime = millis() ;
      
    }
    return tLeft;
  }
  
}

