class Plug {
  char c;
  int x, y;

  Plug(int xpos, int ypos, char character) {
    textAlign(CENTER, CENTER);
    textSize(20);
    c = character;
    x = xpos;
    y = ypos;
  }
  void display() {
    fill(200, 200, 200);
    circle(x, y, 40);
    fill(0, 0, 0);
    text(char(c - 32), x, y);
  }
  void plugged(){
    
  }
}
