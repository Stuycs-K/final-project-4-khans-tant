class Plug {
  char c;
  int x, y;
  boolean canClick;

  Plug(int xpos, int ypos, char character) {
    textAlign(CENTER, CENTER);
    textSize(20);
    c = character;
    x = xpos;
    y = ypos;
  }
  void display() {
    fill(200, 200, 200);
    rect(x-20, y-17, 40, 34,10);
    fill(0, 0, 0);
    text(char(c - 32), x, y);
    if (mouseX >= x && mouseX <= x+40 && mouseY >= y-60 && mouseY <= y+80) {
      canClick = true;
    } else {
      canClick = false;
    }
  }
  void plugged(){
    
  }
}
