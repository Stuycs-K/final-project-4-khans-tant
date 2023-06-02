boolean keyReleased;
boolean pressed = false;
char displaykey;
char keypressed;
char modifiedkey;
Button[] buttons;
Light[] lights;
Plug[] plugs;
Rotor[] rotors;
int ble = 0;
String letters = "qwertyuiopasdfghjklzxcvbnm";
String encryptedMessage = "";
boolean mouseReleased;
PImage img;
boolean reflectorSelected;
boolean refClick = false;
ArrayList<Character> toAdd = new ArrayList<Character>();
ArrayList<String> pairs = new ArrayList<String>();
String ref = "A";

void setup() {
  size(1200, 1000);
  initializeKeyboard();
  initializeLights();
  initializePlugBoard();
  initializeRotors();
  //to test shit
  //println(rotor1.charAt(14));
  rotor1 = rotorOptions[0];
  rotor2 = rotorOptions[1];
  rotor3 = rotorOptions[2];
  reflector = reflectorOptions[0];
  ArrayList<String> pairs = new ArrayList<String>();
  //pairs.add("AR");
  //pairs.add("GK");
  //pairs.add("OX");
  setPlugboard(pairs);
  img = loadImage("gear5.png");
}

void draw() {
  background(0);
  drawEnigma();
  drawPaper();
  //resetButton();
  clearButton();
  //resetclearButton();
  drawReflector();
  fill(255, 255, 255);
  if (rotors[0].rotorNum == 5 & rotors[1].rotorNum == 5 & rotors[2].rotorNum == 5) {
    // hehe
    image(img, 870, 700, 1192/4, 854/4);
  }
  if (toAdd.size() == 2) {
    String config = "";
    config += Character.toUpperCase(toAdd.get(0));
    config += Character.toUpperCase(toAdd.get(1));
    toAdd.clear();
    pairs.add(config);
    //setPlugboard(pairs);
  }
}

void drawEnigma() {
  noStroke();
  fill(150);
  rect(20, 20, 560, 860, 28);
  fill(190);
  rect(20, 20, 560, 690, 28);
  fill(230);
  rect(40, 40, 520, 650, 28);
  fill(190);
  rect(180, 110, 280, 180, 28);
  updateKeyboard();
  updateLights();
  updatePlugBoard();
  updateKeyboard();
  updateLights();
  drawRotors();
  if (keyReleased) {
    //println("Key released: " + keypressed);
    keyReleased = false;
  }
  fill(255, 255, 255);
}

void updateKeyboard() {
  for (int i = 0; i < buttons.length; i++) {
    if (keyPressed && buttons[i].c == displaykey && key >= 'a' && key <= 'z') {
      buttons[i].click();
    } else if (keyPressed && buttons[i].c != displaykey && key >= 'a' && key <= 'z') {
      buttons[i].display();
    } else {
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
    if (keyPressed && lights[i].c == Character.toLowerCase(modifiedkey) && key >= 'a' && key <= 'z') {
      lights[i].lightUp();
    } else {
      lights[i].display();
    }
  }
}

void initializePlugBoard() {
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
    plugs[i] = new Plug(xOffset, 700 + yOffset, letters.charAt(i));
    xOffset += 50;
  }
}

void updatePlugBoard() {
  int counter = 0;
  for (int i = 0; i < lights.length; i++) {
    plugs[i].display();
  }
  //for (int i = 0; i < plugs.length; i++) {

  //}
}

void initializeRotors() {
  rotors = new Rotor[3];
  for (int i = 0; i < rotors.length; i++) {
    rotors[i] = new Rotor(200 + 100*i, 190, i+1);
    rotors[i].rotorNum = i+1;
  }
}

void drawRotors() {
  //if (rotorSelected[0] == true) {
  //  fill(255, 255, 0);
  //  rect(95, 95, 60, 60, 5);
  //}
  //fill(255);
  //if (mouseX >= 100 && mouseX <= 150 && mouseY >= 100 && mouseY <= 150) {
  //  fill(255, 2, 7);
  //  canClick = true;
  //} else {
  //  canClick = false;
  //}
  //rect(100, 100, 50, 50);
  for (int i = 0; i < rotors.length; i++) {
    rotors[i].display();
  }
}

void drawReflector() {
  text(ref, 110, 100);
  int x = 90;
  int y = 190;
  fill(140);
  rect(x-5, y-65, 50, 150, 5);
  if (reflectorSelected == true) {
    fill(255, 255, 0);
    rect(x-5, y-65, 50, 150, 5);
  }
  if (mouseX >= x && mouseX <= x+40 && mouseY >= y-60 && mouseY <= y+80) {
    fill(255, 255, 0);
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
    refClick = true;
  } else {
    refClick = false;
  }
  //int x = 200;
  //int y = 200;
  //if (reflectorSelected == true) {
  //    fill(255, 255, 0);
  //    rect(x-5, y-5, 60, 60, 5);
  //  }
  //  fill(255);
  //  if (mouseX >= x && mouseX <= x+50 && mouseY >= y && mouseY <= y+50) {
  //    fill(255, 2, 7);
  //    refClick = true;
  //  } else {
  //    refClick = false;
  //  }
  //  rect(x, y, 50, 50);
  //  fill(0);
  //  text(reflector, x+10, y+10);
  //text(num, x+10, y+35);
}

void drawPaper() {
  fill(255, 255, 245);
  rect(600, 20, 580, 900);
  stroke(167, 202, 232);
  for (int i = 0; i < 24; i++) {
    line(600, i * 32.7 + 140, 1180, i * 32.7 + 140);
  }
  stroke(255, 0, 0);
  line(700, 20, 700, 919);
  noStroke();
  fill(0);
  circle(650, 480, 25);
  circle(650, 100, 25);
  circle(650, 850, 25);
  textAlign(LEFT);
  if (encryptedMessage.length() % 38 == 0 && encryptedMessage.length() >= 38) {
    encryptedMessage += "\n";
  }
  //println(lines);
  //println(encryptedMessage);
  //println(mouseX, mouseY);
  //for (int i = 0; i < lines; i++) {
  text(encryptedMessage, 711, 161);
  //text(encryptedMessage.substring(38*i), 711, 161 + 30*i);
  //}
  textAlign(CENTER, CENTER);
}


void resetButton() {
  fill(161, 161, 161);
  int x = 600;
  int y = 935;
  if (mouseX >= x && mouseX <= x+150 && mouseY >= y && mouseY <= y+50) {
    fill(217, 217, 217);
    if (mousePressed) {
      enigmaReset();
    }
  }
  rect(x, y, 150, 50, 5);
  fill(0);
  textAlign(LEFT);
  textSize(45);
  text("RESET", 615, 975);
  textAlign(CENTER, CENTER);
}

void clearButton() {
  fill(161, 161, 161);
  int x = 600;
  int y = 935;
  if (mouseX >= x && mouseX <= x+580 && mouseY >= y && mouseY <= y+50) {
    fill(217, 217, 217);
    if (mousePressed) {
      encryptedMessage = "";
    }
  }
  rect(x, y, 580, 50, 5);
  fill(0);
  textAlign(LEFT);
  textSize(45);
  text("CLEAR", 830, 975);
  textAlign(CENTER, CENTER);
  textSize(25);
}

void resetclearButton() {
  fill(161, 161, 161);
  int x = 950;
  int y = 935;
  if (mouseX >= x && mouseX <= x+230 && mouseY >= y && mouseY <= y+50) {
    fill(217, 217, 217);
    if (mousePressed) {
      enigmaReset();
      encryptedMessage = "";
    }
  }
  rect(x, y, 230, 50, 5);
  fill(0);
  textAlign(LEFT);
  textSize(30);
  text("RESET + CLEAR", 970, 970);
  textAlign(CENTER, CENTER);
}

void keyPressed() {
  if (key >= 'a' && key <= 'z') {
    displaykey = key;
    //println(key);
    //if (ble == 0) {
    if (pressed == false) {
      modifiedkey = runEnigma(key);
      encryptedMessage += modifiedkey;
    }
    //pressed = true;
    //  ble++;
    //}
    //println(displaykey);
  }

  if (key == ENTER) {
    encryptedMessage += "\n";
  }

  for (int i = 0; i < rotors.length; i++) {
    if (rotors[i].rotorSelected) {
      if (keyCode == RIGHT) {
        if (rotors[i].rotorNum == 5) {
          rotors[i].rotorNum = 0;
        }
        rotors[i].rotorNum++;
        rotor1 = rotorOptions[rotors[0].rotorNum-1];
        rotor2 = rotorOptions[rotors[1].rotorNum-1];
        rotor3 = rotorOptions[rotors[2].rotorNum-1];
      } else if (keyCode == LEFT) {
        if (rotors[i].rotorNum == 1) {
          rotors[i].rotorNum = 6;
        }
        rotors[i].rotorNum--;
        rotor1 = rotorOptions[rotors[0].rotorNum-1];
        rotor2 = rotorOptions[rotors[1].rotorNum-1];
        rotor3 = rotorOptions[rotors[2].rotorNum-1];
      } else if (keyCode == DOWN) {
        if (i == 0) {
          rotor1 = rotor1.substring(1) + rotor1.substring(0, 1);
        } else if (i == 1) {
          rotor2 = rotor2.substring(1) + rotor2.substring(0, 1);
        } else if (i == 2) {
          rotor3 = rotor3.substring(1) + rotor3.substring(0, 1);
        }
        if (rotors[i].num == 26) {
          rotors[i].num = 0;
        }
        rotors[i].num++;
      } else if (keyCode == UP) {
        if (i == 0) {
          rotor1 = rotor1.substring(rotor1.length()-1) + rotor1.substring(0, rotor1.length()-1);
          if (r1 == 1) {
            r1 = 26;
          } else {
            r1--;
          }
        } else if (i == 1) {
          rotor2 = rotor2.substring(rotor2.length()-1) + rotor2.substring(0, rotor2.length()-1);
          if (r2 == 1) {
            r2 = 26;
          } else {
            r2--;
          }
        } else if (i == 2) {
          rotor3 = rotor3.substring(rotor3.length()-1) + rotor3.substring(0, rotor3.length()-1);
          if (r3 == 1) {
            r3 = 26;
          } else {
            r3--;
          }
        }
        if (rotors[i].num == 1) {
          rotors[i].num = 26;
        } else {
          rotors[i].num--;
        }
      }
    }
  }

  if (reflectorSelected) {
    if (keyCode == RIGHT) {
      if (ref.compareTo("A") == 0) {
        reflector = reflectorOptions[1];
        ref = "B";
      }
      else if (ref.compareTo("B") == 0) {
        reflector = reflectorOptions[2];
        ref = "C";
      }
      else if (ref.compareTo("C") == 0) {
        reflector = reflectorOptions[0];
        ref = "A";
      }
    } else if (keyCode == LEFT) {
      if (ref.compareTo("A") == 0) {
        reflector = reflectorOptions[2];
        ref = "C";
      }
      else if (ref.compareTo("B") == 0) {
        reflector = reflectorOptions[0];
        ref = "A";
      }
      else if (ref.compareTo("C") == 0) {
        reflector = reflectorOptions[1];
        ref = "B";
      }
    }
  }
}


//rotor1 = rotorOptions[rotors[0].rotorNum-1];
//rotor2 = rotorOptions[rotors[1].rotorNum-1];
//rotor3 = rotorOptions[rotors[2].rotorNum-1];
//println(rotor1);
//println(rotor2);
//println(rotor3);
//println("end");


void keyReleased() {
  if (key >= 'a' && key <= 'z') {
    pressed = false;
    keyReleased = true;
    keypressed = key;
    //println(ble);
    //if (ble != 1) {
    //modifiedkey = runEnigma(key);
    //encryptedMessage += modifiedkey;
    //}
    ble++;
    //println(modifiedkey);
  }
}

void mouseClicked() {
  for (int i = 0; i < rotors.length; i++) {
    if (rotors[i].canClick) {
      rotors[i].rotorSelected = !rotors[i].rotorSelected;
    }
  }
  if (refClick) {
    reflectorSelected = !reflectorSelected;
  }
  for (int i = 0; i < plugs.length; i++) {
    if (plugs[i].canClick) {
      plugs[i].plugSelected = !plugs[i].plugSelected;
      if (plugs[i].plugSelected) {
        toAdd.add(plugs[i].c);
      }
      //if (!plugs[i].plugSelected) {
      //  toAdd.remove(plugs[i].c);
      //}
    }
  }
}
