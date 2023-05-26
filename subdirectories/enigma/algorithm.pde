//               0         1         2
//               01234567890123456789012345            
String alpha  = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"; 
String rotor1 = "EKMFLGDQVZNTOWYHXUSPAIBRCJ";
String rotor2 = "AJDKSIRUXBLHWTMCQGZNPYFVOE";
String rotor3 = "BDFHJLCPRTXVZNYEIWGAKMUSQO";
String rotor4 = "ESOVPZJAYQUIRHXLNFTGKDCMWB";
String rotor5 = "VZBRGITYUPSDNHLXAWMJQOFECK";
String plugboard = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

void setup() {
  runEnigma('A');
  exit();
}

void runEnigma(char letter) {
  ArrayList<String> pairs = new ArrayList<String>();
  pairs.add("AR");
  //pairs.add("GK");
  //pairs.add("CN");
  //pairs.add("PZ");
  setPlugboard(pairs);
  print(plugboard);
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
