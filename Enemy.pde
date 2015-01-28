//--------------------Enemy Class--------------------------//
class Enemy {
  float ypos;
  float xpos;
  float speed;
  
  //Constructor + arguments
  Enemy(float tempypos, float tempxpos, float temps) {
    ypos = tempypos;
    xpos = tempxpos;
    speed = temps;
  }


  void display() {
    rectMode(CENTER);
    fill(0);
    stroke(255, 0, 0);
    rect(xpos, ypos, 20, 20);
  }
  
  void drive() {
    xpos = xpos - speed;
 
    if(xpos < 0)
    {
      xpos = width;
      ypos = random(0, height);
      speed = speed + 1;
    }
    
  }
      
  void collision () {
  
  if(dist(mouseX, mouseY, xpos, ypos) <= 30) 
  {
    lives --;
    ypos = - height - random(0, height);
    xpos = random(0, width);
    background(255);
    
    if(lives <= 0) {
      life = false;
    }
   }

   //Show lives in top left corner
   fill(0,255,0);
   text("Lives: " +lives, 4, 30);
  
  }//end collision()
  
  //On death reset enemies to side
  void reset () {
    
    if(lives == 0) {
      xpos = width + random(0,100);
      ypos = random(0, height);
    }
  
  }//end reset()
  
}//end Enemy
