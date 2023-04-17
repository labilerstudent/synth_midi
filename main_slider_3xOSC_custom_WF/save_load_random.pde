void randomiz() {

  for (int i=0; i <= numSlider-1; i++ ) {
    slider[i].value = random(0, 1);
    int un = int(random(0, 2));
    switch(un) {
    case 0:
      slider[i].sinus = true;
      break;
    case 1:
      slider[i].sinus = false;
      break;
    }
    un = int(random(0, 2));
    switch(un) {
    case 0:
      slider[i].sinus2 = true;
      break;
    case 1:
      slider[i].sinus2 = false;
      break;
    }
    un = int(random(0, 2));
    switch(un) {
    case 0:
      slider[i].beat = true;
      break;
    case 1:
      slider[i].beat = false;
      break;
    }
    un = int(random(0, 2));
    switch(un) {
    case 0:
      slider[i].beat_negative = true;
      break;
    case 1:
      slider[i].beat_negative = false;
      break;
    }
  }
}
void savepreset() {
  String[] Seed;
  Seed = new String[numSlider];
  for (int i=0; i <= numSlider-1; i++ ) {
    String test = slider[i].value +"/"+slider[i].sinus+"/"+slider[i].sinus2+"/"+slider[i].beat+"/"+slider[i].beat_negative+"/"+slider[i].boundary_a+"/"+slider[i].boundary_b;
    Seed[i] = test;
  }
  saveStrings("Preset/neueDatei.txt", Seed);
}

void loadpreset() {
  String[] Seed;
  Seed = loadStrings("Preset/neueDatei.txt");
  for (int i=0; i <= numSlider-1; i++ ) {
    String[] list = split(Seed[i], '/');
    slider[i].value = float(list[0]);
    slider[i].sinus = boolean(list[1]);
    slider[i].sinus2 = boolean(list[2]);
    slider[i].beat = boolean(list[3]);
    slider[i].beat_negative = boolean(list[4]);
    slider[i].boundary_a = float(list[5]);
    slider[i].boundary_b = float(list[6]);
  }
}
