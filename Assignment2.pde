import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

float[] x = new float[500];
float[] y = new float[500];
float[] starspeed = new float[500];
int lives;
int i = 0;
int score = 0;
int time = 0;
float speed = 5;
boolean life = true;
final int  MENU_STATE = 0;
final int   PLAYING_STATE = 1;
int state = MENU_STATE;
PImage img;
boolean devMode = false;
boolean sketchFullScreen() {
  return ! devMode;
}


//initialise objects/functions
Enemy Enemy1;
Enemy Enemy2;
Enemy Enemy3;
Enemy Enemy4;
Enemy Enemy5;
Enemy Enemy6;
Enemy Enemy7;

Objective Objective1;
Objective Objective2;
Objective Objective3;
Objective Objective4;
Objective Objective5;

Minim minim;
AudioPlayer sou;

public void setup() {
  if (devMode)
  {
    size(800, 600);
  }
  else
  {
    size(displayWidth, displayHeight);
  }
  
  noCursor();
  
  //initialise stars: position and speed
  int i = 0;
  while(i < 500) 
  {  
    x[i] = random(0, width);
    y[i] = random(0, height);
    starspeed[i] = random(1, 5);
    i = i + 1;
  }
  
  //--------------Enemys---------------//
  Enemy1 = new Enemy(-1000, width - random(0, height), 8);
  Enemy2 = new Enemy(-1000, width - random(0, height), 7);
  Enemy3 = new Enemy(-1000, width - random(0, height), 6);
  Enemy4 = new Enemy(-1000, width - random(0, height), 5);
  Enemy5 = new Enemy(-1000, width - random(0, height), 7.5);
  Enemy6 = new Enemy(-1000, width - random(0, height), 6.5);
  Enemy7 = new Enemy(-1000, width - random(0, height), 5.5);
  
  //------------------Objective------------------//
  Objective1 = new Objective(-1000, width - random(0, height), 7);
  Objective2 = new Objective(-1000, width - random(0, height), 4);
  Objective3 = new Objective(-1000, width - random(0, height), 6);
  Objective4 = new Objective(-1000, width - random(0, height), 9);
  Objective5 = new Objective(-1000, width - random(0, height), 8);
  
    //-----------------Sounds----------------//
    minim = new Minim(this);
    sou = minim.loadFile("gamemusic.mp3");
    sou.loop();
  
  
}

public void draw() {
  
  //calling menu function
  if(state == MENU_STATE) {
    menu();
  }
  
  //calling playing function
  if(state == PLAYING_STATE) {
    
    background(0);
    
  //draw stars
  int i = 0;
  
  while(i < 500) 
  {
    
    stroke(128);
    point(x[i], y[i]);
    x[i] = x[i] - starspeed[i];
    
    if(x[i] < 0) 
    {
      x[i] = width;
    }//end if
    
    i = i + 1;
  }//end while
    
    //Draw player ship
    fill(0);
    stroke(0, 255, 0);
    triangle(mouseX -10, mouseY -5, mouseX +10, mouseY +5, mouseX +10, mouseY -15);
    triangle(mouseX -10, mouseY +5, mouseX +10, mouseY -5, mouseX +10, mouseY +15);
    triangle(mouseX +10, mouseY - 5, mouseX +10, mouseY -15, mouseX +35, mouseY -10); //lower nose
    triangle(mouseX +10, mouseY + 5, mouseX +10, mouseY +15, mouseX +35, mouseY +10); //upper nose
    rect(mouseX, mouseY, 20, 10);
      
    //If alive, call enemy and objective functions in a loop
    if(life == true) {
    
      Enemy1.drive();
      Enemy1.display();
      Enemy1.collision();
      Enemy1.reset();
      Enemy2.drive();
      Enemy2.display();
      Enemy2.collision();
      Enemy2.reset();
      Enemy3.drive();
      Enemy3.display();
      Enemy3.collision();
      Enemy3.reset();
      Enemy4.drive();
      Enemy4.display();
      Enemy4.collision();
      Enemy4.reset();
      Enemy5.drive();
      Enemy5.display();
      Enemy5.collision();
      Enemy5.reset();
      Enemy6.drive();
      Enemy6.display();
      Enemy6.collision();
      Enemy6.reset();
      Enemy7.drive();
      Enemy7.display();
      Enemy7.collision();
      Enemy7.reset();
      
       
      Objective1.display();
      Objective1.drive();
      Objective1.collision();
      Objective2.display();
      Objective2.drive();
      Objective2.collision();
      Objective3.display();
      Objective3.drive();
      Objective3.collision();
      Objective4.display();
      Objective4.drive();
      Objective4.collision();
      Objective5.display();
      Objective5.drive();
      Objective5.collision();
      
      //Score counter
      i ++;
  
      if(i == 100) {
        score ++;
        i = 0;
      }//end score loop
      
    }//end score()
    
  
    //End Game state
    
    if(life == false) {
      
      //Hold on Game Over screen for several seconds
      if(time <= 50) {
        background(255,0,0);
        fill(255);
        
        text("Your score: "+ score, width/2, height/2);
        time++;
      }
      
      //Reset back to menu after a few seconds
      if(time > 50){
        background(255);
        state = MENU_STATE;
        score = 0;
        menu();
      }
      
    }//end End Game State
  }//end Playing State
}//end draw()
