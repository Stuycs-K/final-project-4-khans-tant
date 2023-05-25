boolean keyReleased;
char displaykey;
char keypressed;
Button[] buttons;

public void settings(){
  size(600,1000);
}

void setup() {
  initializeKeyboard();
}

void draw() {
  background(0);
  updateKeyboard();
  updateLights();
  if (keyReleased) {
    println("Key released: " + keypressed);
    keyReleased = false;
  }
  fill(255,255,255);
}

void updateKeyboard() {
  for (int i = 0; i < buttons.length; i++) {
    if (keyPressed && buttons[i].c == displaykey) {
      buttons[i].click();
    }
    buttons[i].display();
  }
}

void initializeKeyboard() {
  int yOffset = 50;
  int xOffset = 50;
  buttons = new Button[26];
  for (int i = 0; i < buttons.length; i++) {
    if(i % 7 == 0){
      yOffset += 70;
      xOffset = 0;
    }
    xOffset += 70;
    buttons[i] = new Button(xOffset + 25, 100 + yOffset, char('a' + i));
  }
}

void updateLights(){
  for (int i = 0; i < buttons.length; i++) {
    if (keyPressed && buttons[i].c == displaykey) {
      fill(255,255,0);
      circle(buttons[i].x,buttons[i].y - 50, 30);
    }
  }
}

void keyPressed() {
  if (key >= 'a' && key <= 'z') {
    displaykey = key;
  }
}

void keyReleased() {
  if (key >= 'a' && key <= 'z') {
    keyReleased = true;
    keypressed = key;
  }
}
