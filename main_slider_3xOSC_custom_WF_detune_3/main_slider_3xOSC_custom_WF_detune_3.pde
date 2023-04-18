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
Button waveformButton4;

Instrument instrument1;
Instrument instrument2;

boolean OSC2_on = false;
boolean OSC1_on=false;

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
  size(1000,600);
  colorMode(HSB, 360);
  diameter = height - 10;
  setupSlider();
  background(0);
}

boolean CRX=false, HIDE_UI=false, HIDE_img= true;
float d1 = 10 + (sin(angle/2) * diameter) + diameter/2;
float d2 = 10 + (sin(angle2/2) * diameter/2) + diameter/2;
int i2 = 1;

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

  i2 = 1;
  inc = TWO_PI/25.0;
   rectMode(CORNER);
  for (int i=0; i<slider.length; i++)slider[i].update_sin();
  if (!HIDE_UI)UI();
  if (CRX)cursor(HAND);
  else cursor(ARROW);
  for (int i=0; i<slider.length; i++)slider[i].self_correct();
}
