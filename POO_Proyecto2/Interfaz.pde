class Interfaz{
  float x, y, r;
  float s, p, t;
  color col;
  float i=1;
  
  Interfaz(){
  }
  //Visuales para las pantallas de carga
  void Fuegos(){
    
    if (i == 220)
    {
      i=1;
      x = random(width);
      y = random(height);
    }
    
    s = random(255);
    p = random(255);
    t = random(255);
    col = color (s, p, t);
    
      stroke(col);
      strokeWeight(3);
      noFill();
      ellipse(x, y, i, i);
      if(s !=255) s++;
      if(p !=255) p++;
      if(t !=255) t++;
      i++;
      
  }
  
}
