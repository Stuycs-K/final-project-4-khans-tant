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
    fill(255, 255, 255);
    circle(x, y, 40);
    fill(0, 0, 0);
    text(char(c - 32), x, y);
  }
  void click() {
    fill(0, 255, 0);
    circle(x, y, 50);
  }
}
