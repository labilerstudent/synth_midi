import ddf.minim.*;
import ddf.minim.ugens.*;
import themidibus.*;

MidiBus midi;
Minim minim;
AudioOutput out;

setting slider[];

Button waveformButton1;
Button waveformButton2;
Button waveformButton3;

Instrument instrument1;
Instrument instrument2;

boolean OSC2_on = false;
PFont schriftart, font;                 //creating the font
int edit_slider=0, numSlider=39;
boolean UI_on = true;
float prev_xs, prev_ys, xs, inc, eRadius, angle, angle2, angle3, angle4, diameter;
float ys = 500;
boolean imageshown = false, HIDE_rect= true, LOAD_preset1=true;

void setup() {
  minim = new Minim(this);
  out = minim.getLineOut();
  MidiBus.list();
  midi = new MidiBus(this, 1, 1); // Change the first argument to the input port number of your MIDI keyboard, and the second argument to the output port number of your MIDI device  
  instrument1 = new Instrument(12); // Create an instrument with 12 oscillators (one for each MIDI note)
  instrument2 = new Instrument(12); // Create a second instrument with 12 oscillators 
  textParameter();
  size(1000,1000);
  colorMode(HSB, 360);
  diameter = height - 10;
  setupSlider();
  background(0);
}

boolean CRX=false, HIDE_UI=false, HIDE_img= true;
float d1 = 10 + (sin(angle/2) * diameter) + diameter/2;
float d2 = 10 + (sin(angle2/2) * diameter/2) + diameter/2;
int corners2 = 0;
int i2 = 1;
int counter;

void draw() {
  background(0);
  CRX=false;
  textSize(10);
  textAlign(LEFT, CENTER);
  checkbox_hover=false;
  d1 = 10 + (sin(angle/2) * diameter) + diameter/2;
  d2 = 10 + (sin(angle2/2) * diameter/2) + diameter/2;
  angle4 += slider[19].read_setting();
  angle3 += slider[18].read_setting();
  angle2 += slider[17].read_setting();
  angle += slider[14].read_setting();
  corners2 = 0;
  i2 = 1;
  inc = TWO_PI/25.0;
  for (int i=0; i<slider.length; i++)slider[i].update_sin();
  if (!HIDE_UI)UI();
  if (CRX)cursor(HAND);
  else cursor(ARROW);
  for (int i=0; i<slider.length; i++)slider[i].self_correct();
}

void UI ()
{
  waveformButton1.display();
  waveformButton2.display();
  waveformButton3.display();
  
  textFont(schriftart);
  textSize(10);
  strokeWeight(1);
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
  slider (13, width-300, 160, 150);
  slider (14, width-300, 180, 150);
  slider (15, width-300, 200, 150);
  slider (16, width-300, 220, 150);
  slider (17, 40, height-140, 200);
  slider (18, 40, height-80, 200);
  slider (19, 40, height-20, 200);
  slider (20, width-300, 240, 150);
  slider (21, width-300, 260, 150);
  slider (22, width-300, 280, 150);
  slider (23, width-300, 300, 150);
  slider (24, width-300, 320, 150);
  slider (25, width-300, 340, 150);
  slider (26, width-300, 360, 150);
  slider (27, width-300, 380, 150);
  slider (28, width-300, 400, 150);
  slider (29, width-300, 420, 150);
  slider (30, width-300, 440, 150);
  slider (31, width-300, 460, 150);
  slider (32, width-300, 480, 150);
  slider (33, width-300, 500, 150);
  slider (34, width-300, 520, 150);
  slider (35, width-300, 520, 150);
  slider (36, width-300, 520, 150);
  slider (37, width-300, 520, 150);
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
  rect(84, 600, 200, 200);
  rectMode(CORNER);
  pushMatrix();
  translate(184, 600);
  rotate(d1*125);
  popMatrix();
  ellipse(120+d2/8, height -170, 30, 30);
  textAlign(LEFT, TOP);
  textAlign(RIGHT, CENTER);
  text("askor", width-20, 35 );
  text("void001", width-20, 55, 16 );
  text("fps = "+(int)frameRate, width-20, 75 );
  text("amount = "+(int)slider[11].read_setting()*2, width-20, 95 );

}


class Button {
int x, y, size;
String label;

Button(int x, int y, int size, String label) {
this.x = x;
this.y = y;
this.size = size;
this.label = label;
}

void display() {
fill(0);
stroke(255);
strokeWeight(2);
rectMode(CENTER);
rect(x, y, size, size, 5);
textAlign(CENTER, CENTER);
textSize(16);
fill(155);
text(label, x, y);
}

boolean clicked() {
return (mouseX > x - size/2 && mouseX < x + size/2 &&
mouseY > y - size/2 && mouseY < y + size/2 &&
mousePressed);
}
}
