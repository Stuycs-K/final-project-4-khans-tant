char keypressed;
char[] alphabet = {
'a','b','c','d','e',
'f','g','h','i','j',
'k','l','m','n','o',
'p','q','r','s','t',
'u','v','w','x','y',
'z'}

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
  
}
