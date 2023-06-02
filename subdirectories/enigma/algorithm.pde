//               0         1         2
//               01234567890123456789012345
int r1 = 0;
int r2 = 0;
int r3 = 0;
String alpha  = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
String[] rotorOptions = {"EKMFLGDQVZNTOWYHXUSPAIBRCJ", "AJDKSIRUXBLHWTMCQGZNPYFVOE", "BDFHJLCPRTXVZNYEIWGAKMUSQO", "ESOVPZJAYQUIRHXLNFTGKDCMWB", "VZBRGITYUPSDNHLXAWMJQOFECK"};
String[] reflectorOptions = {"EJMZALYXVBWFCRQUONTSPIKHGD", "YRUHQSLDPXNGOKMIEBFZCWVJAT", "FVPJIAOYEDRZXWGCTKUQSBNMHL"};
String plugboard = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
String rotor1;
String rotor2;
String rotor3;
String reflector;

//void setup() {
//  rotor1 = rotorOptions[0];
//  rotor2 = rotorOptions[1];
//  rotor3 = rotorOptions[2];
//  reflector = reflectorOptions[0];
//  ArrayList<String> pairs = new ArrayList<String>();
//  pairs.add("AR");
//  pairs.add("GK");
//  pairs.add("OX");
//  setPlugboard(pairs);
//  for (int i = 0; i < 100; i++) {
//    if (i % 38 == 0) {
//      print("\n");
//    }
//    print(runEnigma('a'));
//  }
//  exit();
//}

char runEnigma(char letter) {
  char encryptedLetter = 0;
  letter = Character.toUpperCase(letter);
  int signal = plugboard.indexOf(letter);
  //println("pg: " + signal);
  signal = alpha.indexOf(rotor3.charAt(signal));
  //println("3: " + signal);
  signal = alpha.indexOf(rotor2.charAt(signal));
  //println("2: " + signal);
  signal = alpha.indexOf(rotor1.charAt(signal));
  //println("1: " + signal);
  signal = alpha.indexOf(reflector.charAt(signal));
  //println("re: " + signal);
  signal = rotor1.indexOf(alpha.charAt(signal));
  //println("1: " + signal);
  signal = rotor2.indexOf(alpha.charAt(signal));
  //println("2: " + signal);
  signal = rotor3.indexOf(alpha.charAt(signal));
  //println("3: " + signal);
  encryptedLetter = plugboard.charAt(signal);
  rotateRotors();
  //print(encryptedLetter);
  return encryptedLetter;
}

void rotateRotors() {
  if (rotors[2].num-1 < 25) {
    rotor3 = rotor3.substring(1) + rotor3.substring(0, 1);
    rotors[2].num++;
    //println(rotor3);
  } else if (rotors[2].num-1 == 25 && rotors[1].num-1 < 25) {
    //println("rotor3 done");
    rotor3 = rotor3.substring(1) + rotor3.substring(0, 1);
    rotors[2].num = 1;
    rotor2 = rotor2.substring(1) + rotor2.substring(0, 1);
    rotors[1].num++;
  } else if (rotors[1].num-1 == 25 && rotors[0].num-1 < 25) {
    //println("rotor2 done");
    rotor2 = rotor3.substring(1) + rotor3.substring(0, 1);
    rotors[1].num = 1;
    rotor1 = rotor1.substring(1) + rotor1.substring(0, 1);
    rotors[0].num++;
  } else if (rotors[0].num-1 == 25) {
    //println("rotor1 done");
    rotor1 = rotor1.substring(1) + rotor1.substring(0, 1);
    rotors[0].num = 1;
  }
  //rotors[0].num = r1+1;
  //rotors[1].num = r2+1;
  //rotors[2].num = r3+1;
}

void setPlugboard(ArrayList<String> swaps) {
  for (int i = 0; i < swaps.size(); i++) {
    char A = swaps.get(i).charAt(0);
    char B = swaps.get(i).charAt(1);
    if (A > B) {
      char temp = A;
      A = B;
      B = temp;
    }
    if (B != 'Z') {
      plugboard = plugboard.substring(0, plugboard.indexOf(A)) + B
        + plugboard.substring(plugboard.indexOf(A+1), plugboard.indexOf(B)) + A
        + plugboard.substring(plugboard.indexOf(B+1), plugboard.length());
    } else {
      plugboard = plugboard.substring(0, plugboard.indexOf(A)) + B
        + plugboard.substring(plugboard.indexOf(A+1), plugboard.indexOf(B)) + A;
    }
  }
}

void enigmaReset() {
  println(rotors[0].rotorNum-1);
  println(rotors[1].rotorNum-1);
  println(rotors[2].rotorNum-1);
  rotor1 = rotorOptions[rotors[0].rotorNum-1];
  rotor2 = rotorOptions[rotors[1].rotorNum-1];
  rotor3 = rotorOptions[rotors[2].rotorNum-1];
  //r1 = 0;
  //r2 = 0;
  //r3 = 0;
  //rotors[0].num = 1;
  //rotors[1].num = 1;
  //rotors[2].num = 1;
  rotors[0].rotorNum = 1;
  rotors[1].rotorNum = 1;
  rotors[2].rotorNum = 1;
}
