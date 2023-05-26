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
    circle(x, y, 40);
    fill(255);
    text(char(c - 32), x, y);
    fill(100);
  }
  void lightUp() {
    fill(255, 255, 0);
    circle(x, y, 50);
  }
}
