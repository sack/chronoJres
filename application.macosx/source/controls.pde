void initBut() {
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

void initConfig() {

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

 qMinutsTf.setValue(defaultQuestionMin);
 qSecondsTf.setValue(defaultQuestionSec);

 minutsTf.setFocus(true);

 okBut = controlP5.addButton(ok, 20, 380, 700, 40, 19);
 okBut.setColorBackground(butColor);
 okBut.setColorForeground(activeColor);
 cancelBut = controlP5.addButton(cancel, 20, 440, 700, 40, 19);
 cancelBut.setColorBackground(butColor);
 cancelBut.setColorForeground(activeColor);
}

void hideBut() {
 //background(bgColor);
 startBut.setVisible(false);
 razBut.setVisible(false);
 configBut.setVisible(false);

}

void showConfig() {
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

void showBut() {
 background(bgColor);
 startBut.setVisible(true);
 razBut.setVisible(true);
 configBut.setVisible(true);
}


void hideConfig() {
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
   //on remplace start par pause et on démarre le cpte a rebours
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
   
   timer.pause();
   //background(bgColor);
 }
 if (theEvent.controller().name() == raz)
 {
   //on remet a zero le compte
   configBut.setVisible(true);
   //afficher startup
   startup();
   timer = new Timer(timer.sessionTime,timer.questionsTime);
     pauseBut.setVisible(false);
   startBut.setVisible(true);
   

 }
 if (theEvent.controller().name() == config)
 {
   
   //on maque les boutons et on affiche la configuration
   hideBut();
      background(bgColor);

   showConfig();
 }
 if (theEvent.controller().name() == ok)
 {
   //on recupère le temps saisi
   //on masque la config et on rafiche les boutons

   long qTime = ((parseInt(qMinutsTf.getText())*60)+(parseInt(qSecondsTf.getText())))*1000;
   long sTime = ((parseInt(minutsTf.getText())*60)+(parseInt(secondsTf.getText())))*1000;

   timer = new Timer(sTime,qTime);
   hideConfig();
   showBut();
     //afficher startup
     startup();
 }
 if (theEvent.controller().name() == cancel)
 {
   //on efface la config et on affiche les boutons
   hideConfig();
   showBut();
     //afficher startup    
   startup();
 }
}
