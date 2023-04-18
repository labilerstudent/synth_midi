
void UI ()
{
  
  oscilliscope(300,300,500);
  waveformButton1.display();
  waveformButton2.display();
  waveformButton3.display();
  waveformButton4.display();
  
  textFont(schriftart);
  textSize(10);
  strokeWeight(1);
  rectMode(CORNER);
  slider (0, 40, 20, 200);
  slider (1, 40, 40, 200);
  slider (2, 40, 60, 200);
  slider (3, 40, 80, 200);
  slider (4, 40, 100, 200);
  slider (5, 40, 120, 200);
  slider (6, 40, 140, 200);
  slider (7, 40, 160, 200);
  slider (8, 40, 180, 200);
  slider (9, 40, 200, 200);
  slider (10, 40, 220, 200);
  slider (11, 40, 240, 200);
  slider (12, 40, 260, 200);
  slider (13, 40, 280, 200);
  slider (14, 40, 300, 200);
  slider (15, 40, 320, 200);
  slider (16, 40, 340, 200);
  slider (17, 40, 360, 200);

  slider (18, 40, height-80, 200);
  slider (19, 40, height-20, 200);

  float current_state = angle3, current_state2 = angle4;
  int laenge = 200;
  noFill();
  stroke(360);
  ellipse(84+laenge, height-110+(sin(current_state/2) )*15, 5, 5);
  beginShape();
  for (int i=0; i<laenge; i++) {
    current_state-= slider[18].read_setting()*10;
    vertex(84+laenge-i, height-110+(sin(current_state/2) )*15);
  }
  endShape();
  noFill();
  stroke(360);
  ellipse(84+laenge, height-50+(sin(current_state2/2) )*15, 5, 5);
  beginShape();
  for (int i=0; i<laenge; i++) {
    current_state2-= slider[19].read_setting()*10;
    vertex(84+laenge-i, height-50+(sin(current_state2/2) )*15);
  }
  endShape();
  
  textAlign(LEFT, TOP);
  textAlign(RIGHT, CENTER);
  text("askor", width-20, 35 );
  text("void003", width-20, 55, 16 );
  text("fps = "+(int)frameRate, width-20, 75 );
  returnWaveform1();
  returnWaveform2();
 
}

void returnWaveform1(){
    if (!OSC1_on){
      fill(120);}
  if (instrument1.currentWaveformIndex == 0){
    text("SINE", width-20, 95 );}
if (instrument1.currentWaveformIndex == 1){
    text("SAW", width-20, 95 );}
if (instrument1.currentWaveformIndex == 2){
    text("TRI", width-20, 95 );}
}
void returnWaveform2(){
  if (!OSC2_on){
      fill(120);}
      else fill(360);
  if (instrument2.currentWaveformIndex == 0){
    text("SINE", width-20, 115 );}
if (instrument2.currentWaveformIndex == 1){
    text("SAW", width-20, 115 );}
if (instrument2.currentWaveformIndex == 2){
    text("TRI", width-20, 115 );}
}
