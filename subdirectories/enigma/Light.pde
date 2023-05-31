class Light {
  char c;
  int x, y;

  Light(int xpos, int ypos, char character) {
    fill(100);
    textAlign(CENTER, CENTER);
    textSize(20);
    c = character;
    x = xpos;
    y = ypos;
  }
  void display() {
    ellipse(x, y, 40, 30);
    fill(255);
    text(char(c - 32), x, y-3);
    fill(100);
  }
  void lightUp() {
    fill(255,255,220);
    ellipse(x, y, 40, 30);
    fill(0);
    text(char(c - 32), x, y-3);
  }
}
