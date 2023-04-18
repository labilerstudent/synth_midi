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
