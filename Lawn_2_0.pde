ArrayList<GardenObject> gardenobj = new ArrayList<GardenObject>();
int menu = 0;
int obj = 0;
int r=0;
int tinta;
boolean checker= false;
PImage fondo;

void setup() {
  size(1080, 720);
  fondo = loadImage("fondo.jpg");
  surface.setResizable(false);
  background(fondo);
  
}

void draw() {
  background(fondo);
  fill(255);
  rect((width/6)-60, 650, 120, 50);
  rect((width* 2/6)-60, 650, 120, 50);
  rect((width* 3/6)-60, 650, 120, 50);
  rect((width* 4/6)-60, 650, 120, 50);
  rect((width* 5/6)-60, 650, 120, 50);
  fill(0);
  textSize  (32);
  text("Lawn", (width/6)-40, 685);
  text("Stone", (width*2/6)-40, 685);
  text("Flower", (width*3/6)-50, 685);
  text("Move", (width*4/6)-40, 685);
  textSize  (30);
  text("Remove", (width*5/6)-57, 685);

  for (int i=0; i < gardenobj.size(); i++) gardenobj.get(i).draw();

  for (int i = 0; i < gardenobj.size(); i++) {
    if (gardenobj.get(i).isInside(mouseX, mouseY) && mousePressed == true && menu ==0) {
      obj=gardenobj.get(i).oj();
      tinta = gardenobj.get(i).colores();
      gardenobj.remove(i);
      gardenobj.add(new GardenObject(mouseX, mouseY, obj, tinta));
      
    }
  }
}


void mouseClicked() {
  if (mouseX> (width/6)-60 && mouseX <(width/6)-60+120 && mouseY>650 && mouseY <700) {
    println("Lawn");
    menu = 1;
    obj=3;
  } else if (mouseX> (width*2/6)-60 && mouseX <(width*2/6)-60+120 && mouseY>650 && mouseY <700) {
    println("Stone");
    menu = 1;
    obj =2;
  } else if (mouseX> (width*3/6)-60 && mouseX <(width*3/6)-60+120 && mouseY>650 && mouseY <700) {
    println("Flowers");
    menu = 1;
    obj = 1;
  } else if (mouseX> (width*4/6)-60 && mouseX <(width*4/6)-60+120 && mouseY>650 && mouseY <700) {
    println("Move");
    menu = 0;
  } else if (mouseX> (width*5/6)-60 && mouseX <(width*5/6)-60+120 && mouseY>650 && mouseY <700) {
    println("Remove");
    menu = 2;
  }

  if (mouseX> 0 && mouseX < 1080 && mouseY> 0 && mouseY <650 && menu == 1) {

    
    gardenobj.add(new GardenObject(mouseX, mouseY, obj));
  }

  if (menu==2) {
    for (int i = 0; i < gardenobj.size(); i++) {
      if (gardenobj.get(i).isInside(mouseX, mouseY)) {

        gardenobj.remove(i);
      }
    }
  }
}
