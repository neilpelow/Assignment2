//--------------------Objective Class--------------------------//
class Objective {
  float ypos;
  float xpos;
  float speed;
  
  //Constructor + arguments
  Objective (float tempypos, float tempxpos, float temps) {
    ypos = tempypos;
    xpos = tempxpos;
    speed = temps;
  }


  void display() {
    rectMode(CENTER);
    fill(0);
    stroke(0, 255, 0);
    rect(xpos, ypos, 20, 20);
  }
  
  void drive() {
    xpos = xpos - speed;
 
    if(xpos < 0)
    {
      xpos = width;
      ypos = random(0,700);
    }
    
  }
  
  void collision () {
  
   if(dist(xpos, ypos, mouseX, mouseY) <= 50) {
    score ++;
    ypos = - height - random(0,500);
    xpos = random(0, 700);
   }

   fill(0, 255, 0);
   text("Score: " +score, 600, 30);
  
  }//end collision()
}
