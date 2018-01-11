class Rec{
  float rx = 0;
  float ry = 0;
  int isBroke = 1;
  
  Rec(){
    rx = 0;
    ry = 0;
    isBroke = 1;
  }
  
  void rec_update(){
    if (isBroke == 1){
      fill(0);
      stroke(255);
      strokeWeight(2);
      rect(rx, ry, 64, 25);
    }
  } 
}