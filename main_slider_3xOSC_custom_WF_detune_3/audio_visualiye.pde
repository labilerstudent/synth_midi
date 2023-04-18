//draw oscilliscope method
void oscilliscope(float x ,float y, float wide) {
  rectMode(CORNER);
  fill(0);
  rect(x+50,y-50,wide,100);
  stroke(360,200);
  strokeWeight(1);
  for (int i = 1; i < wide; i++){
    line(x+i+50, y + out.left.get(i)*100, x+i-1+50, y + out.left.get(i-1)*100);
  }
rectMode(CENTER);
}
