class Rotor {
  char c;
  int x, y;

  Rotor(int xpos, int ypos, char character) {
    textAlign(CENTER, CENTER);
    textSize(20);
    c = character;
    x = xpos;
    y = ypos;
  }
  void display() {
    textSize(20);
    fill(255, 255, 255);
    rect(x, y, 40, 100);
    fill(0, 0, 0);
    text(char(c - 32), x, y);
  }
}
