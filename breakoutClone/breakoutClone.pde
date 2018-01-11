PImage img;
Ball b;

void setup(){
  size(641, 800);
  background(0);
  img = loadImage("sky.jpg");
  b = new Ball();
}

void draw(){
  background(0);
  image(img, 0, 0, width, height/2);
  b.update();
  if (b.py >= 770){ // if ball gets below the edge, game over
    fill(203,72,72);
    textSize(32);
    text("Game Over", width/2-90, height/2+32);
    textSize(24);
    text("Please press SPACE to restart.", width/2-180,height/2+64);
  }
}

void keyPressed(){
  if (key == ' '){ //restart
    setup();
  }
}
