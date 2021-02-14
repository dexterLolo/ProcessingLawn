class GardenObject {
  public int xCord;
  public int yCord;
  public int ancho = 100;//350
  public int alto = 100;//188
  public int objecto;
  public String a;
  public PImage flower;
  public PImage lawn;
  public int colour;
  public int r;
  public int g;
  public int b;
  public PGraphics maskImage;
  public boolean alive = true;

  GardenObject (int x, int y, int object) {
    xCord=x-50;
    yCord=y-50;
    objecto=object;
    colour = int (random(50, 200));
        
    flower = loadImage("flor.png");
    lawn = loadImage("lawn.jpg");
  }
  
  GardenObject (int x, int y, int object, int tinta) {
    xCord=x-50;
    yCord=y-50;
    objecto=object;
    colour = tinta;
    flower = loadImage("flor.png");
    lawn = loadImage("lawn.jpg");
  }
  
  

  boolean isInside (float px, float py) {
    
    alive = false;
    return xCord<=px && px<=xCord+ancho &&
      yCord<=py && py<=yCord+ancho;
  }
  void draw() {
    
    r =(colour/10)*5;
    g =(colour/7)*8;
    b =(colour/8)*6;
    
    
    noTint();
    if (objecto == 3) {
      
      image(lawn, xCord, yCord, 100,100);
    } else if (objecto == 2) {
      fill(colour);
      
      ellipse(xCord+50, yCord+50, 100, 100);
    } else if (objecto == 1) {
      tint(r,g,b);
      image(flower, xCord, yCord,100,100);
    }
  }
 
 int oj(){
 return objecto;
 }
 
 int colores(){
     return colour;
   
 }

  
  void move(int x, int y){
    while (mousePressed){
    xCord=x;
    yCord=y;
      draw();
    }
    
    
  }
 
  
}
