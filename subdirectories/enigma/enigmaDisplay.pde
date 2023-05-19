char keypressed;

void setup(){
  size(1000,500);
}

void draw(){
  background(0);
  if(keyPressed){
    println(keypressed);
    updateKeyboard();
  }
}

void updateKeyboard(){
  circle(400,400,400);
}

void keyPressed(){
  if(key >= 'a' && key <= 'z'){
    keypressed = key;
  }
}
