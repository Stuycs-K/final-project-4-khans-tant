boolean keyReleased;
char displaykey;
char keypressed;
Button[] buttons;

void setup() {
  size(1000, 500);
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
  buttons = new Button[26];
  for (int i = 0; i < buttons.length; i++) {
    buttons[i] = new Button(25 * i + 25, 100, char('a' + i));
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
