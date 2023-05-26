//               0         1         2
//               01234567890123456789012345            
String alpha  = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"; 
String rotor1 = "EKMFLGDQVZNTOWYHXUSPAIBRCJ";
String rotor2 = "AJDKSIRUXBLHWTMCQGZNPYFVOE";
String rotor3 = "BDFHJLCPRTXVZNYEIWGAKMUSQO";
String rotor4 = "ESOVPZJAYQUIRHXLNFTGKDCMWB";
String rotor5 = "VZBRGITYUPSDNHLXAWMJQOFECK";
String reflectA = "EJMZALYXVBWFCRQUONTSPIKHGD";
String reflectB = "YRUHQSLDPXNGOKMIEBFZCWVJAT";
String reflectC = "FVPJIAOYEDRZXWGCTKUQSBNMHL";
String plugboard = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

void setup() {
  ArrayList<String> pairs = new ArrayList<String>();
  pairs.add("AR");
  pairs.add("GK");
  pairs.add("OX");
  setPlugboard(pairs);
  runEnigma('M');
  runEnigma('W');
  runEnigma('N');
  exit();
}

void runEnigma(char letter) {
  char encryptedLetter = 0;
  
  int signal = plugboard.indexOf(letter);
  //println("pg: " + signal);
  signal = alpha.indexOf(rotor3.charAt(signal));
  //println("3: " + signal);
  signal = alpha.indexOf(rotor2.charAt(signal));
  //println("2: " + signal);
  signal = alpha.indexOf(rotor1.charAt(signal));
  //println("1: " + signal);
  signal = alpha.indexOf(reflectA.charAt(signal));
  //println("re: " + signal);
  signal = rotor1.indexOf(alpha.charAt(signal));
  //println("1: " + signal);
  signal = rotor2.indexOf(alpha.charAt(signal));
  //println("2: " + signal);
  signal = rotor3.indexOf(alpha.charAt(signal));
  //println("3: " + signal);
  encryptedLetter = plugboard.charAt(signal);
  print(encryptedLetter);
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
