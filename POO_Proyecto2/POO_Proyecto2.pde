//Programa
//Bibliotecas necesarias para el funcionamiento de BOX2D
import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;
import processing.sound.*;

//Inicializacion de Audio
SoundFile cancion;

Box2DProcessing box2d;

//Todas las clases
Flujo p;
Cortinas cortinas;
Interfaz f,h,j;

//Arreglos
ArrayList <Proyectiles> proyectiles;
ArrayList<Boundary> boundaries;


//Variables Global
PFont fuente;
float radio = 0;
color colr = color (random(255), random(255), random(255));
float rest = 0;


void setup (){
  size (800, 600);
  background(0);
  
  //Inicializar el mundo de Box2d
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.listenForCollisions();
  
  //Inicializar el audio
  cancion = new SoundFile(this, "Cancion.mp3");
 
  box2d.setGravity(0,-10);
  
  //Inicializar los objetos
  cortinas = new Cortinas();
  proyectiles = new ArrayList<Proyectiles>();
  boundaries = new ArrayList<Boundary>();
  
  p = new Flujo();
  f = new Interfaz();
  h = new Interfaz();
  j = new Interfaz();
  
  //Inicializar fuente
  fuente = loadFont("Coli48.vlw");
  cancion.play();
  
  boundaries.add(new Boundary(550,590,600,5, .5));

}

void draw(){
  p.PantallaActual();
  box2d.step();
  //Para la visualizacion de las particulas
  if(mousePressed == true){
    if (radio < 100) radio++;
    if (rest < 4) rest += .05;
 
    fill(colr);
    noStroke();
    ellipse(mouseX, mouseY, radio, radio);
    }
  
}

void beginContact(Contact cp) {
 //Diferentes situaciones de colisión
  Fixture f1 = cp.getFixtureA();
  Fixture f2 = cp.getFixtureB();

  Body b1 = f1.getBody();
  Body b2 = f2.getBody();

  Object o1 = b1.getUserData();
  Object o2 = b2.getUserData();
    
  if (o1.getClass() == Boundary.class && o2.getClass() == Proyectiles.class ) {
    Boundary p = (Boundary) o1;
    p.change();
    Proyectiles w = (Proyectiles) o2;
    w.change();
    
  } 
  
  if (o2.getClass() == Proyectiles.class && o1.getClass() == Circulos.class) {
    Circulos p = (Circulos) o1;
    p.change();
  } 
  
  else if ((o2.getClass() == Circulos.class && (o1.getClass() == Circulos.class))) {
    Circulos p = (Circulos) o1;
    p.change();
    Circulos w = (Circulos) o2;
    w.change();
  }
  
  
}

void endContact(Contact cp) {
}

void mouseReleased(){
  proyectiles.add(new Proyectiles(mouseX, mouseY, radio, colr));
  //Regresa los parametros para la creación de una nueva particula
  colr = color (random(255), random(255), random(255));
  radio = 0;
  rest = 0; 
}
