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
    fill(205, 205, 205);
    ellipse(x, y+8, 44, 34);
    fill(155, 155, 155);
    ellipse(x, y+3, 42, 32);
    fill(255, 255, 255);
    ellipse(x, y, 40, 30);
    fill(0, 0, 0);
    text(char(c - 32), x, y-3);
  }
  void click() {
    fill(195, 195, 195);
    ellipse(x, y+8, 44, 34);
    fill(155, 155, 155);
    ellipse(x, y+6, 42, 32);
    fill(255, 255, 255);
    ellipse(x, y+3, 40, 30);
    fill(0, 0, 0);
    text(char(c - 32), x, y);
  }
}
