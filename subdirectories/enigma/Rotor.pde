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
    textSize(20);
    fill(140);
    rect(x-5, y-65, 50, 150,5);
    if (rotorSelected == true) {
      fill(255, 255, 0);
      rect(x-5, y-65, 50, 150, 5);
    }
    if (mouseX >= x && mouseX <= x+40 && mouseY >= y-60 && mouseY <= y+80) {
      fill(230);
      rect(x-5, y-65, 50, 150, 5);
    }
    fill(250);
    rect(x, y-60, 40, 68);
    fill(244);
    rect(x, y-60, 40, 54);
    fill(238);
    rect(x, y-60, 40, 38);
    fill(232);
    rect(x, y-60, 40, 20);



    fill(226);
    rect(x, y, 40, 80);
    fill(232);
    rect(x, y, 40, 68);
    fill(238);
    rect(x, y, 40, 54);
    fill(244);
    rect(x, y, 40, 38);
    fill(250);
    rect(x, y, 40, 20);
    fill(0);
    fill(255);
    if (mouseX >= x && mouseX <= x+40 && mouseY >= y-60 && mouseY <= y+80) {
      canClick = true;
    } else {
      canClick = false;
    }
    fill(0);
    // god forgive me for what im boutta write
    textSize(14);
    if(num-3 >= 1){
      text(num - 3, x+20, y-52);
    }
    else{
      text(num + 23, x+20, y-52);
    }
    textSize(14);
    if(num-2 >= 1){
      text(num - 2, x+20, y-33);
    }
    else{
      text(num + 24, x+20, y-33);
    }
    textSize(15);
    if(num-1 >= 1){
      text(num - 1, x+20, y-17);
    }
    else{
      text(num + 25, x+20, y-17);
    }
    textSize(20);
    text("Rotor " + rotorNum, x+20, y-100);
    text(num, x+20, y+3);
    textSize(16);
    if(num+1 <= 26){
      text(num + 1, x+20, y+28);
    }
    else{
      text(num - 25, x+20, y+28);
    }
    textSize(14);
    if(num+2 <= 26){
      text(num + 2, x+20, y+44);
    }
    else{
      text(num - 24, x+20, y+44);
    }
    textSize(13);
    if(num+3 <= 26){
      text(num + 3, x+20, y+58);
    }
    else{
      text(num - 23, x+20, y+58);
    }
    textSize(12);
    if(num+4 <= 26){
      text(num + 4, x+20, y+72);
    }
    else{
      text(num - 22, x+20, y+72);
    }
    textSize(20);
  }
}
