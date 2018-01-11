class Ball{
 
  float px = 0;
  float py = 0;
  float speed_X = 0;
  float speed_Y = 0; 
  int pn = -1;
  
  Rec[] rec;
  int index = 0;
  
  Ball(){ // setup
    px = 340;
    py = 600;
    speed_X = random(5, 7);
    speed_Y = random(5, 7);
    
    rec = new Rec[160];
    for (int i = 0; i < 160; i++){
      rec[i] = new Rec();  
    }
    index = 0;
  }
 
  void update(){ //draw
     
    fill(255, 255, 0, 230);
    noStroke();
    rect(mouseX-50, 700, 100, 20);
    
    index = 0;
    for (int i = 0; i < 10; i++){
      for (int j = 0; j < 16; j++){
        rec[index].rx = 64 * i;
        rec[index].ry = 25 * j;
        rec[index].rec_update();
        index++;
      }
    }
    
    pn = -1;
    for(int i = 0; i < 8; i++){
      float mx = px + 25 * cos(radians(i * 360 / 8));
      float my = py + 25 * sin(radians(i * 360 / 8));

      color cc = get((int)mx, (int)my);
      int br = (int) brightness(cc);
      
      for (int k = 0; k < 160; k++){
        if (px >= rec[k].rx-10 && px <= rec[k].rx+74
          && py >= rec[k].ry-12 && py <= rec[k].ry+37 && rec[k].isBroke == 1){
            rec[k].isBroke = 0;
            speed_X *= -1;
            speed_Y *= -1;
        }
      }
      
      if(br == 230){
          pn = i;
      }    
    }
  
    if(pn != -1){
       switch(pn){
       case 1: case 3: case 5: case 7:
         speed_X *= -1;
         speed_Y *= -1;
         break;
       case 2: case 6:
         speed_Y *= -1;
         break;
       case 4: case 0:
         speed_X *= -1;
         break;
       }
    }
    px += speed_X;
    py += speed_Y;
    
  
  if(py < 0){
    speed_Y *= -1;
    py += random(-1,1);
  }
  
  if(px < 0 || px > width){
    speed_X *= -1;
    px +=random(-1,1);
  }
  
  noStroke();
  fill(255, 255, 255);
  ellipse(px, py, 25, 25);
  }
   
}