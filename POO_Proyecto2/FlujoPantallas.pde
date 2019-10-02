class Flujo{
  
  int pantalla = 1;
  int cont = 160;
  boolean d = false;
  
  Cortinas c;
  
  void PantallaActual(){
  switch (pantalla){
    case 1:
    Pantalla_Inicio();
    break;
    
    case 2:
    Pantalla_Instrucciones();
    break;
    
    case 3:
    Pantalla_Juego();
    break;
  }
  }
  
  void Pantalla_Inicio(){
    
    if (cont == 160)
    {
      fill(random(255), random(255), random(255));
      cont = 0;
    }
    
    background(0);
    cont++;
    textSize(30);
    textAlign(CENTER, CENTER);
    textFont(fuente);
    text("Colision cromatica", 400, 200);
    
    text("Presione '1' para continuar", 400, 400);
    
    if (keyPressed)
    if(key == '1')
    pantalla++;
    
    
    
    
    for(int i=0; i<20; i++)
    {
      f.Fuegos();
      h.Fuegos();
      j.Fuegos();
    }
  }
  
  void Pantalla_Instrucciones(){
    
    if (cont == 160)
    {
      fill(random(255), random(255), random(255));
      cont = 0;
    }
    cont++;
    
    background(0);
    textSize(30);
    textAlign(CENTER, CENTER);
    text("-Instrucciones-", 400, 100);
    
    textSize(20);
    text("Este es un programa interactivo de objetos.", 400, 150);
    text("Deje presionado el click izquiero para crear una particula", 400, 200);
    text("Mientras más tiempo pase el tamaño y el rebote seran mayores", 400, 240);
    text("Experimente con la barra y los tamaños para las colisiones", 400, 280);
 
    text("Presione '2' para continuar.", 400, 500);
    
    if (keyPressed)
    if(key == '2')
    pantalla++;
    
    for(int i=0; i<20; i++)
    {
      f.Fuegos();
    }
  }
  
  void Pantalla_Juego(){
    background(0);
    textSize(20);
    
    cortinas.display();
    for (Proyectiles s : proyectiles) 
    {
      s.display();
    }
    
    for (Boundary wall: boundaries) {
    wall.display();
    }
    
    if (cont == 2000)
    d = true;
    if (cont == 0)
    d = false;
   
    //Finaliza el programa cuando el jugador quiere
    if(d)
    {
      text("Presione '3' para terminar", 200, 570);
      cont -= 10;
    }
    else cont++;
    
    if (keyPressed)
    if(key == '3')
    exit();

  }
}
