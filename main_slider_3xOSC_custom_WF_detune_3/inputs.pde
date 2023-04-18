void mouseReleased ()
{
  if (checkbox_hover)
  {

    if (sin_id==2)slider[checkbox_id].sinus =!slider[checkbox_id].sinus;
    if (sin_id==3)slider[checkbox_id].sinus2=!slider[checkbox_id].sinus2;

    checkbox_hover=false;
  }
}

void keyReleased()
{

  if (key=='H'||key=='h')HIDE_UI=!HIDE_UI;
  if (key=='1')LOAD_preset1=!LOAD_preset1;
  if (key=='R'||key=='r')randomiz();
  if (key=='S'||key=='s')savepreset();
  if (key=='L'||key=='l')loadpreset();
}

void mousePressed() {
  // Check if the waveform buttons were clicked
  if (waveformButton1.clicked()) {
    instrument1.toggleWaveform();
  }
  if (waveformButton2.clicked()) {
    instrument2.toggleWaveform();
  }
    if (waveformButton3.clicked()) {
    OSC1_on = !OSC1_on;
  }
      if (waveformButton4.clicked()) {
    OSC2_on = !OSC2_on;
  }
  
}

void noteOn(int channel, int pitch, int velocity) {
  // Route notes to the appropriate instrument
  if (channel == 0) {
    if (OSC1_on){instrument1.noteOn(channel, pitch, velocity);}
    if (OSC2_on){ instrument2.noteOn(channel, pitch, velocity);}

}}

void noteOff(int channel, int pitch, int velocity) {
  // Route notes to the appropriate instrument
  if (channel == 0) {
    instrument1.noteOff(channel, pitch, velocity);
    instrument2.noteOff(channel, pitch, velocity);
  } 
}

void stop() {
// Close Minim audio resources
out.close();
minim.stop();
super.stop();
}
