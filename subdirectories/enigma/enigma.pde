boolean keyReleased;
char displaykey;
char keypressed;
char modifiedkey;
Button[] buttons;
Light[] lights;
String letters = "qwertyuiopasdfghjklzxcvbnm";

void setup() {
  size(600, 1000);
  
  initializeKeyboard();
  initializeLights();
  rotor1 = rotorOptions[0];
  rotor2 = rotorOptions[1];
  rotor3 = rotorOptions[2];
  reflector = reflectorOptions[0];
  ArrayList<String> pairs = new ArrayList<String>();
  //pairs.add("AR");
  //pairs.add("GK");
  //pairs.add("OX");
  setPlugboard(pairs);

}

void draw() {
  background(0);
  updateKeyboard();
  updateLights();
  if (keyReleased) {
    println("Key released: " + keypressed);
    keyReleased = false;
  }
  fill(255, 255, 255);
}

void updateKeyboard() {
  for (int i = 0; i < buttons.length; i++) {
    if (keyPressed && buttons[i].c == displaykey && key >= 'a' && key <= 'z') {
      buttons[i].click();
    }
    buttons[i].display();
  }
}

void initializeKeyboard() {
  int yOffset = 50;
  int xOffset = 75;
  buttons = new Button[26];
  for (int i = 0; i < buttons.length; i++) {
    if (i == 10) {
      yOffset += 50;
      xOffset = 100;
    }
    if (i == 19) {
      yOffset += 50;
      xOffset = 150;
    }
    buttons[i] = new Button(xOffset, 600 + yOffset, letters.charAt(i));
    xOffset += 50;
  }
}

void initializeLights() {
  int yOffset = 50;
  int xOffset = 75;
  lights = new Light[26];
  for (int i = 0; i < lights.length; i++) {
    if (i == 10) {
      yOffset += 50;
      xOffset = 100;
    }
    if (i == 19) {
      yOffset += 50;
      xOffset = 150;
    }
    lights[i] = new Light(xOffset, 100 + yOffset, letters.charAt(i));
    xOffset += 50;
  }
}

void updateLights() {
  for (int i = 0; i < lights.length; i++) {
    lights[i].display();
    if (keyPressed && lights[i].c == displaykey && key >= 'a' && key <= 'z') {
      lights[i].lightUp();
      println(lights[i].c);
    }
  }
}

void keyPressed() {
  if (key >= 'a' && key <= 'z') {
    displaykey = key;
    println(displaykey);
    //println("button: " + buttons[i] + " lights: " + lights[i]);
  }
}

void keyReleased() {
  if (key >= 'a' && key <= 'z') {
    keyReleased = true;
    keypressed = key;
    modifiedkey = runEnigma(key);
    println(modifiedkey);
  }
}
