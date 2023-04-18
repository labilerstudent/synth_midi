void setupSlider() {
  slider = new setting[numSlider];
  slider[0] = new setting("max", 0.0f,1f, 0, 1);
  slider[1] = new setting("attack", 0.0f,1f, 0, 1);
  slider[1].value = 0.1;
  slider[2] = new setting("decay", 0.0f,1f, 0, 1);
  slider[2].value = 0;
  slider[3] = new setting("sustain",0.0f,1f, 0, 1);
  slider[3].value = 0.1;
  slider[4] = new setting("release",0.0f,1f, 0, 1);
  slider[4].value = 0.1;
  slider[5] = new setting("before",0.0f,1f, 0, 1);
  slider[5].value = 0.1;
  slider[6] = new setting("after",0.0f,1f, 0, 1);
  slider[6].value = 0;
  slider[7] = new setting("max", -6f,6f, 0, 1);
  slider[7].value = 0.1;
  slider[8] = new setting("attack", -6f,6f, 0, 1);
  slider[8].value = 0.1;
  slider[9] = new setting("decay", 0, 360, 0, 1);
  slider[9].value = 0.1;
  slider[10] = new setting("sustain", 0, 360, 0, 1);
  slider[10].value = 0.5;
  slider[11] = new setting("release", 0, 360, 0, 1);
  slider[11].value = 0.1;
  slider[12] = new setting("before", 0, 200, 0, 1);
  slider[13] = new setting("detune?", -12f, 12f, 0, 1);
  slider[14] = new setting("rotate", -0.000001, 0.000001, 0, 1);
  slider[15] = new setting("amount", 1, 150, 0, 1);
  slider[16] = new setting("space", .05, 4, 0, 1);
  slider[17] = new setting("move", -0.1, 0.1);
  slider[18] = new setting("sinus 1", -0.1, 0.1);
  slider[19] = new setting("sinus 2", -0.1, 0.1);
  slider[20] = new setting("rotate", 0, 360, 0, 1);
  slider[21] = new setting("imgz", 0, 50, 0, 1);
  slider[22] = new setting("imgamt", 0, 100, 0, 1);
  slider[23] = new setting("xImgH", 0, 360, 0, 1);
  slider[24] = new setting("xImgS", 0, 50, 0, 1);
  slider[25] = new setting("xImgB", 0, 50, 0, 1);
  slider[26] = new setting("xImgT", 0, 360, 0, 1);
  slider[27] = new setting("circlesamt", 0, 200, 0, 1);
  slider[28] = new setting("circlesizes", 0, 50, 0, 1);
  slider[29] = new setting("circlex", 0, 200, 0, 1);
  slider[30] = new setting("circley", 0, 50, 0, 1);
  slider[31] = new setting("CH", 0, 360, 0, 1);
  slider[32] = new setting("CS", 0, 360, 0, 1);
  slider[33] = new setting("CB", 0, 360, 0, 1);
  slider[34] = new setting("CT", 0, 360, 0, 1);
  slider[35] = new setting("energy", 0, 360, 0, 1);
  slider[36] = new setting("energy", 0, 360, 0, 1);
  slider[37] = new setting("energy", 0, 360, 0, 1);
  slider[38] = new setting("energy", 0, 360, 0, 1);
  waveformButton1 = new Button(550, 500, 50, "WOSC1");
  waveformButton2 = new Button(650, 500, 50, "WoSC2");
  waveformButton3 = new Button(750, 500, 50, "OSC1");
  waveformButton4 = new Button(850, 500, 50, "OSC2");
  

}
