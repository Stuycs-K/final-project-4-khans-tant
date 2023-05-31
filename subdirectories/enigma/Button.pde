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
    textSize(20);
    fill(255, 255, 255);
    ellipse(x, y, 40, 30);
    fill(0, 0, 0);
    text(char(c - 32), x, y);
  }
  void click() {
    fill(255, 255, 255);
    ellipse(x, y+3, 40, 30);
    fill(0, 0, 0);
    text(char(c - 32), x, y+3);
  }
}
