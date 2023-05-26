class Button {
  char c;
  int x, y;

  Button(int xpos, int ypos, char character) {
    textAlign(CENTER, CENTER);
    textSize(20);
    c = character;
    x = xpos;
    y = ypos;
  }
  void display() {
    fill(255,255,255);
    circle(x, y, 50);
    fill(0,0,0);
    text(c, x, y);
  }
  void click(){
    fill(0,255,0);
    circle(x, y, 60);
  }
}
