class Cortinas{
  ArrayList<Circulos> circulos;
  int a = 0, b = 40, c= 0, contX = 0, contY = 1;
  
  Cortinas(){

    circulos = new ArrayList();
    //Algoritmo para la creación de cortinas, se puede seleccionar el espaciado y cantidad
    for(int i=0; i < 860; i++) {
      Circulos p = null;
      
      if (i == a)
      {
        p = new Circulos(contX*30,5,5,true);
        a += b;
        contX++;
        contY = 1;
        
        if (i < 820) b -= 1;
        if (i > 820) b += 1;
        
      }
      
      else p = new Circulos(contX*30,contY*7,5,false);
      circulos.add(p);
      
      contY++;
      
      if (i != c) {
         c = a;
         DistanceJointDef djd = new DistanceJointDef();
         Circulos previous = circulos.get(i-1);

         djd.bodyA = previous.body;
         djd.bodyB = p.body;
         djd.length = box2d.scalarPixelsToWorld(15);
         djd.frequencyHz = 0;
         djd.dampingRatio = 0;
     
         DistanceJoint dj = (DistanceJoint) box2d.world.createJoint(djd);
         }
       }
     }

  void display() {
    for (Circulos p: circulos) {
      p.display();
    }
  }
}
