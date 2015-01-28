void menu() 
{
  int tri = 0;
  
  background(0);
  fill(255, 0, 0);
  text("Press 'E' to play\n\nPress 'R' to exit" , width/2.25, height - 150);
  textSize(30);
  text("Star Ship", width/2.25, height - height/2 + 100);
  
  
  for(tri = 0; tri < 25; tri ++)
  {
    fill(0);
    stroke(0, 255, 0);
    triangle(random(0, width), random(0, height/2), random(0, width), random(0, height/2) , random(0, width), random(0, height/2));
  }

  
  
  if (keyPressed) {
    if (key == 'E' || key == 'e') {
      lives = 5;
      life = true;
      time = 0;
      state = PLAYING_STATE;
    }
    
    if (key == 'R' || key == 'r') {
      exit();
    }
    
  }
}//end menu()
