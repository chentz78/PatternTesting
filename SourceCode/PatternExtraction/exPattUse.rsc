module exPattUse

import IO;

data D = A(str s) | B(int i);

void main() {
  //if ( /XX/i := "some xx" ) println(" OK");
  //if ( int x := 22 ) println(" OK");
  D d = A("v1");
  if ( A(s) := d ) println(" OK");
  else println(" NOK");
}