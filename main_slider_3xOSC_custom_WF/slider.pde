float ampl = 0;


void slider (int Slider_ID, int x, int y, int w)
{
  x+=44;
  fill(0);
  noStroke();
  rect(x-64, y-6, x+w+textWidth(slider[Slider_ID].name)-6, 12);  // resetBackground
  stroke(255);
  line(x, y, x+w, y);                // show Line
  if (edit_slider==Slider_ID)fill(128);
  else fill(0);
  ellipse(x+map(slider[Slider_ID].value, 0, 1, 0, w), y, 10, 10);
  noFill();
  fill(360);
  text(slider[Slider_ID].name, x+w+10, y);

  if (dist(mouseX, mouseY, x+map(slider[Slider_ID].value, 0, 1, 0, w), y)<10)
  {
    CRX=true;
    if (mousePressed)slider[Slider_ID].value=min(max(map(mouseX, x, x+w, 0, 1), 0), 1);
    if (mousePressed)edit_slider=Slider_ID;
  } else slider[Slider_ID].value= slider[Slider_ID].value;

  if (slider[Slider_ID].has_boundaries) {
    stroke(360);

    line(x+map(slider[Slider_ID].boundary_a, 0, 1, 0, w), y-8, x+map(slider[Slider_ID].boundary_a, 0, 1, 0, w), y+8);
    if (mouseX>x+map(slider[Slider_ID].boundary_a, 0, 1, 0, w)-4&&mouseX<x+map(slider[Slider_ID].boundary_a, 0, 1, 0, w)+4 &&  mouseY>y-8&&mouseY<y+8 )
    {
      CRX=true;
      if (mousePressed)slider[Slider_ID].boundary_a=min(max(map(mouseX, x, x+w, 0, 1), 0), 1);
    }

    line(x+map(slider[Slider_ID].boundary_b, 0, 1, 0, w), y-8, x+map(slider[Slider_ID].boundary_b, 0, 1, 0, w), y+8);

    if (mouseX>x+map(slider[Slider_ID].boundary_b, 0, 1, 0, w)-4&&mouseX<x+map(slider[Slider_ID].boundary_b, 0, 1, 0, w)+4 &&  mouseY>y-8&&mouseY<y+8 )
    {
      CRX=true;
      if (mousePressed)slider[Slider_ID].boundary_b=min(max(map(mouseX, x, x+w, 0, 1), 0), 1);
    }
  }

  check_box ( x-52, y, slider[Slider_ID].beat, Slider_ID, 0 );
  check_box ( x-38, y, slider[Slider_ID].beat_negative, Slider_ID, 1 );
}
Boolean checkbox_hover = false;
int checkbox_id=0, sin_id=0;

void check_box ( int px, int py, boolean on, int id, int sid)
{
  noFill();
  stroke(360, 0, 360);
  rect(px-5, py-5, 9, 9);
  if (mouseX>px-4&&mouseY>py-4&&mouseX<px+4&&mouseY<py+4)
  {
    fill(180, 0, 180);
    noStroke();
    rect(px-3, py-3, 6, 6);
    checkbox_hover=true;
    checkbox_id=id;
    sin_id=sid;
    CRX=true;
  }

  if (on) {
    noStroke();
    fill(360, 0, 360);
    rect(px-3, py-3, 6, 6);
  }
}

class setting
{
  boolean sinus=false, sinus2=false, beat=false, beat_negative=false, has_boundaries=false;
  String name ="";               // name vom slider
  float min = 0, max = 1;        // Standartwerte : hiert werden die maximalen skala werte gespeichert
  float value =.5;               // value vom slider : zwischen 0 und 1 :
  float boundary_a=0, boundary_b=1;
  setting (String n, float mn, float mx )
  {
    this.name=n;
    this.min=mn;
    this.max=mx;
  }
  setting (String n, float mn, float mx, float p1, float p2)
  {
    this.name=n;
    this.min=mn;
    this.max=mx;
    this.has_boundaries=true;
    this.boundary_a=p1;
    this.boundary_b=p2;
  }
  void self_correct ()
  {
    if ((this.boundary_b-this.boundary_a)<0.03) {
      this.boundary_a -=0.03 ;
      this.boundary_b +=0.03 ;
    }
    this.value=min(this.value, 1);
  }
  float read_setting ()
  {
    return map(this.value, 0, 1, this.min, this.max);        // auslesen der eigientlichen werte die auf die skala gemappt sind
  }
  void update_sin ()
  {
    if (this.sinus )this.value=(this.value+((sin( angle3/2 )+1)*abs(this.boundary_a-this.boundary_b))/2+min(this.boundary_a, this.boundary_b) )/2;
    if (this.sinus2)this.value=(this.value+((sin( angle4/2 )+1)*abs(this.boundary_a-this.boundary_b))/2+min(this.boundary_a, this.boundary_b) )/2;
    if (this.beat)this.value=(this.value+map(ampl, 0, 50, 0, 1)*abs(this.boundary_a-this.boundary_b)+min(this.boundary_a, this.boundary_b))/2; // amp
    if (this.beat_negative)this.value=(this.value-map(ampl, 0, 50, 0, 1)*abs(this.boundary_a-this.boundary_b)+1-(1-max(this.boundary_a, this.boundary_b)))/2; // amp
  }
}
