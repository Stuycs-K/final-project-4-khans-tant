boolean keyReleased;
char displaykey;
char keypressed;
char modifiedkey;
Button[] buttons;
Light[] lights;
Plug[] plugs;
Rotor[] rotors;

String letters = "qwertyuiopasdfghjklzxcvbnm";

void setup() {
  size(600, 1000);
  initializeKeyboard();
  initializeLights();
  initializePlugBoard();
  //to test shit
  //println(rotor1.charAt(14));
  rotor1 = rotorOptions[0];
  rotor2 = rotorOptions[1];
  rotor3 = rotorOptions[2];
  reflector = reflectorOptions[0];
  ArrayList<String> pairs = new ArrayList<String>();
  pairs.add("AR");
  pairs.add("GK");
  pairs.add("OX");
  setPlugboard(pairs);
}

void draw() {
  background(0);
  drawEnigma();
  fill(255, 255, 255);
}

void drawEnigma(){
  noStroke();
  fill(150);
  rect(20, 20, 560, 960, 28);
  fill(190);
  rect(20, 20, 560, 860, 28);
  fill(230);
  rect(40, 40, 520, 820, 28);
  stroke(1);
  updateKeyboard();
  updateLights();
  updatePlugBoard();
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
    else if(keyPressed && buttons[i].c != displaykey && key >= 'a' && key <= 'z'){
      buttons[i].display();
    }
    else{
      buttons[i].display();
    }
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
    buttons[i] = new Button(xOffset, 460 + yOffset, letters.charAt(i));
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
    lights[i] = new Light(xOffset, 300 + yOffset, letters.charAt(i));
    xOffset += 50;
  }
}

void updateLights() {
  //if(keypressed != ' ' && keyReleased){
    //modifiedkey = runEnigma(keypressed);
  //}
  for (int i = 0; i < lights.length; i++) {
    lights[i].display();
    if (keyPressed && lights[i].c == Character.toLowerCase(modifiedkey) && key >= 'a' && key <= 'z' && keyReleased) {
      lights[i].lightUp();
    }
    else{
      lights[i].display();
    }
  }
}

void initializePlugBoard(){
  int yOffset = 50;
  int xOffset = 75;
  plugs = new Plug[26];
  for (int i = 0; i < plugs.length; i++) {
    if (i == 10) {
      yOffset += 50;
      xOffset = 100;
    }
    if (i == 19) {
      yOffset += 50;
      xOffset = 150;
    }
    plugs[i] = new Plug(xOffset, 640 + yOffset, letters.charAt(i));
    xOffset += 50;
  }
}

void updatePlugBoard(){
  for (int i = 0; i < lights.length; i++) {
    plugs[i].display();
  }
}

void initializeRotors(){
  
}


void keyPressed() {
  if (key >= 'a' && key <= 'z') {
    keyReleased = false;
    displaykey = key;
    modifiedkey = runEnigma(key);
    println(displaykey);
  }
}

void keyReleased() {
  if (key >= 'a' && key <= 'z') {
    keyReleased = true;
    keypressed = key;
    //modifiedkey = runEnigma(key);
    println(modifiedkey);
  }
}
