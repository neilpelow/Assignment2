void menu() 
{
  img = loadImage("menu.jpg");
  background(/*img*/0);
  fill(255, 0, 0);
  text("Press 'Y' to play\n\nPress 'N' to exit" , width/2.25, height - 150);
  
  
  if (keyPressed) {
    if (key == 'y' || key == 'Y') {
      lives = 5;
      life = true;
      time = 0;
      state = PLAYING_STATE;
    }
    
    if (key == 'n' || key == 'N') {
      exit();
    }
    
  }
}//end menu()
