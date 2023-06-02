class Rotor {
  char c;
  int x, y;
  int num;
  boolean canClick;
  boolean rotorSelected;
  int rotorNum;

  Rotor(int xpos, int ypos, int rotor) {
    textAlign(CENTER, CENTER);
    textSize(20);
    //c = character;
    x = xpos;
    y = ypos;
    num = 1;
    rotorNum = rotor;
  }
  void display() {
    //textSize(20);
    //fill(255, 255, 255);
    //rect(x, y, 40, 100);
    //fill(0, 0, 0);
    //text(char(c - 32), x, y);


    if (rotorSelected == true) {
      fill(255, 255, 0);
      rect(x-5, y-5, 60, 60, 5);
    }
    fill(255);
    if (mouseX >= x && mouseX <= x+50 && mouseY >= y && mouseY <= y+50) {
      fill(255, 2, 7);
      canClick = true;
    } else {
      canClick = false;
    }
    rect(x, y, 50, 50);
    fill(0);
    text("Rotor " + rotorNum, x+10, y+10);
    text(num, x+10, y+35);
  }
}
