class Plug {
  char c;
  int x, y;
  boolean canClick;
  boolean plugSelected;
  boolean firstClicked;
  char firstLetter;
  char secondLetter;

  Plug(int xpos, int ypos, char character) {
    textAlign(CENTER, CENTER);
    textSize(20);
    c = character;
    x = xpos;
    y = ypos;
  }
  void display() {
    fill(200, 200, 200);
    rect(x-20, y-17, 40, 34, 10);
    if (plugSelected == true) {
      fill(255, 255, 0);
      rect(x-20, y-17, 40, 34, 10);
      
    }
    fill(0, 0, 0);
    text(char(c - 32), x, y);
    if (mouseX >= x-20 && mouseX <= x+20 && mouseY >= y-17 && mouseY <= y+20) {
      fill(220, 220, 220);
      rect(x-20, y-17, 40, 34, 10);
      canClick = true;
    } else {
      canClick = false;
    }
    fill(0);
    text(char(c - 32), x, y);
  }

  //char returnChar() {
  //  if (firstClicked == true) {
  //    firstClicked = false;
  //    return 
  //  } else {
  //    firstLetter = c;
  //    firstClicked = true;
  //  }
  //}

  void plugged() {
  }
}
