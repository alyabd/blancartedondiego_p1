PFont josefin;
int P=1,J1,J2,turno=0;
float atk1,atk2,vida1,vida2;
int y,y1=800; //Mover texto
int tf=30,cf; //Tamaño de fuente variable en "Jugar"
float s1,s2,s3,s4,s5;
int cc; //cambia color de fondo en pantalla 3
int tl=0; //tamaño de letra escalable en pantalla final

class personaje{
  
  int x,y; //Posición
  String nombre;
  int atk,vida;
  int lugar; //Numero de selección para enlazarlos en switch
  
  personaje(String nombre, int atk, int vida, int lugar){
    
    nombre = nombre;
    atk = atk;
    vida = vida;
    lugar = lugar;
  }

  void eleccion(){
    switch(lugar){
      case 1:
        cassette();
      break;
      
      case 2:
        vinil();
      break;
      
      case 3:
        cd();
      break;
      
      case 4:
        usb();
      break;
      
      case 5:
        streaming();
      break;
    }
    
  }
}
personaje Cassette;
personaje Vinil;
personaje Cd;
personaje Usb;
personaje Streaming;

void setup(){
  frameRate(60);
  size(800,450);
  
  josefin = loadFont("JosefinSans-BoldItalic-48.vlw");

  Cassette = new personaje("Cassette",2,23,1);  //personaje(String nombre, int atk, int vida, int lugar)
  Vinil = new personaje("Vinil",3,21,2);
  Cd = new personaje("Compact Disc",4,25,3);
  Usb = new personaje("USB",5,22,4);
  Streaming = new personaje("Streaming",1,24,5);
  
}

void draw(){
  
  println(mouseX, mouseY);
  
  if(P==1){
  pantalla1();
    if (mousePressed && mouseX>348 && mouseX<448 && mouseY>315 && mouseY<340){
      P=2;
    }
  }
  
  if(P==2){
    pantalla2();
    if(J1!=0 && J2!=0){
      P=3;
    }
  }
  
  if(P==3){
    pantalla3();
  }
  
  if(P==4){
    pantalla4();
  }
}

void pantalla1(){
  
  //Efecto de estrellas
  fill(5,25);
  rect(0,0,width,height);
  fill(255);
  noStroke();
  ellipse(random(width),random(height),10,10);
  
  textFont(josefin);
  textAlign(CENTER, BOTTOM);
  textSize(100);
  fill(255);
  textLeading(80);
  text("GUERRA DE \nFORMATOS",400,y);
  if(y<=250){
    y=y+2;
  }
  
  fill(cf);
  textSize(tf);
  text("JUGAR",400,y1);
  if(y1>=350){
    y1=y1-3;
  }
  
  if(mouseX>348 && mouseX<448 && mouseY>315 && mouseY<340){
    tf=50;
    cf=255;
  }
    else{
      tf=30;
      cf=200;
    }
  }

void select1(){
  if (P==2){
    if (mousePressed && mouseX>0 && mouseX<160 && mouseY>0 && mouseY<450){ //Cassette
        J1 = 1;
        vida1 = 23;
        atk1 = random(3);
    }
    if (mousePressed && mouseX>160 && mouseX<320 && mouseY>0 && mouseY<450){ //Vinil
        J1 = 2;
        vida1 = 21;
        atk1 = random(4);
    }
    if (mousePressed && mouseX>320 && mouseX<480 && mouseY>0 && mouseY<450){ //CD
        J1 = 3;
        vida1 = 25;
        atk1 = random(5);
    }
    if (mousePressed && mouseX>480 && mouseX<640 && mouseY>0 && mouseY<450){ //USB
        J1 = 4;
        vida1 = 22;
        atk1 = random(6);
    }
    if (mousePressed && mouseX>640 && mouseX<800 && mouseY>0 && mouseY<450){ //Streaming
        J1 = 5;
        vida1 = 24;
        atk1 = random(2);
    }
  }
}

void select2(){
  if (P==2){
    if (keyPressed){
      if(key=='1'){
        J2 = 1;
        vida2 = 23;
        atk2 = random(3);
      }
      if(key=='2'){
        J2 = 2;
        vida2 = 21;
        atk2 = random(4);
      }
      if(key=='3'){
        J2 = 3;
        vida2 = 25;
        atk2 = random(5);
      }
      if(key=='4'){
        J2 = 4;
        vida2 = 22;
        atk2 = random(6);
      }
      if(key=='5'){
        J2 = 5;
        vida2 = 24;
        atk2 = random(2);
      }
    }
  }
}

void pantalla2(){
  fill(50,100);
  rect(0,0,width,height);
  
  textFont(josefin);
  textAlign(CENTER, BOTTOM);
  textSize(30);
  fill(255);
  text("Escoge tu formato",400,50);
  
  textAlign(CENTER,TOP);
  textSize(30);
  fill(255);
  text("J1:Mouse+Click  ||  J2:Teclea Número ",400,60);
  textSize(50);
  text("1",50,350);
  text("2",200,350);
  text("3",360,350);
  text("4",535,350);
  text("5",715,350);
  
  pushMatrix();
  scale(s1);
  translate(-30,150);
  cassette();
  popMatrix();
  
  pushMatrix();
  scale(s2);
  translate(150,160);
  vinil();
  popMatrix();
  
  pushMatrix();
  scale(s3);
  translate(360,160);
  cd();
  popMatrix();
  
  pushMatrix();
  scale(s4);
  translate(600,160);
  usb();
  popMatrix();
  
  pushMatrix();
  scale(s5);
  translate(825,160);
  streaming();
  popMatrix();
  
  if(mouseX>14 && mouseX<110 && mouseY>127 && mouseY<290){
    s1=.8;
  }
  else{
    s1=.75;    
  }
  
  if(mouseX>149 && mouseX<240 && mouseY>127 && mouseY<290){
    s2=.8;
  }
  else{
    s2=.75;    
  }
  
  if(mouseX>304 && mouseX<410 && mouseY>127 && mouseY<290){
    s3=.8;
  }
  else{
    s3=.75;    
  }
  
  if(mouseX>480 && mouseX<600 && mouseY>127 && mouseY<290){
    s4=.8;
  }
  else{
    s4=.75;    
  }
  
  if(mouseX>670 && mouseX<750 && mouseY>127 && mouseY<290){
    s5=.8;
  }
  else{
    s5=.75;    
  }
  
  select1();
  select2();
  
}
 
void pantalla3(){
  fill(50,100);
  rect(0,0,width,height);
  fill(244,55,33);
  textAlign(CENTER,CENTER);
  textSize(100);
  text("VS",400,75);
  
  if(J1==1){
  pushMatrix();
  translate(50,100);
  cassette();
  popMatrix();
  }
  if(J1==2){
  pushMatrix();
  translate(50,100);
  vinil();
  popMatrix();
    
  }
  if(J1==3){
  pushMatrix();
  translate(50,100);
  cd();
  popMatrix();
  }
  if(J1==4){
  pushMatrix();
  translate(50,100);
  usb();
  popMatrix();
  }
  if(J1==5){
  pushMatrix();
  translate(50,100);
  streaming();
  popMatrix();
  }
  
  //Jugador 2
  if(J2==1){
  pushMatrix();
  translate(525,100);
  cassette();
  popMatrix();
  }
  if(J2==2){
  pushMatrix();
  translate(525,100);
  vinil();
  popMatrix();
  }
  if(J2==3){
  pushMatrix();
  translate(525,100);
  cd();
  popMatrix();
  }
  if(J2==4){
  pushMatrix();
  translate(525,100);
  usb();
  popMatrix();
  }
  if(J2==5){
  pushMatrix();
  translate(525,100);
  streaming();
  popMatrix();
  }
  
  //Pelea. Turno 0=J1
  if(turno==0 && keyPressed){
    if (key=='z'){
      vida2 = vida2 - atk1;
      turno=1;
    }
  }
  
  if(turno==1 && keyPressed){
    if (key=='m'){
      vida1 = vida1 - atk2;
      turno=0;
    }
  }
  
  //Mostrar Vida
  fill(136,255,103);
  textSize(50);
  text(vida2,162,375);
  text(vida1,620,375);
  textSize(25);
  fill(200);
  text("\nATK: Z",162,400);
  text("\nATK: M",620,400);
  
  if(vida1<=0 || vida2<=0){
    P=4;
  }
}

void pantalla4(){
  fill(255,10);
  rect(0,0,width,height);
  textAlign(CENTER,CENTER);
  textSize(tl);
  
  if(vida2<=0){
    fill(0);  
    text("JUGADOR 2 \nES EL \nGANADOR", 400,175);
    if(tl<=55){
      tl+=5;
    }
  }
  
  if(vida1<=0){
    fill(0);  
    text("JUGADOR 1 \nES EL \nGANADOR", 400,175);
    if(tl<=55){
      tl+=5;
    }
  }
  
  textSize(20);
  fill(0);
  text("Pulsa Espacio para volver a jugar",400,400);
  
  if (keyPressed && key==' '){        //P=1,J1,J2,turno=0; float atk1,atk2,vida1,vida2;
    J1=0;
    J2=0;
    atk1=0;
    atk2=0;
    vida1=0;
    vida2=0;
    P=1;
    y=0;
    y1=800;
    tl=0;
  }
}

void cassette(){
  //Gris
  fill(199,199,199);
  noStroke();
  rect(70,20,100,60);
  //Beige
  fill(255,255,215);
  noStroke();
  rect(80,30,80,40);
  //Gris más obscuro
  fill(37,37,37);
  noStroke();
  rect(90,40,60,20);
  //Gris obscuro
  fill(116,116,116);
  noStroke();
  rect(110,40,20,20);
  //Naranja
  fill(255,66,0);
  noStroke();
  rect(100,70,40,10);
  //Azul marino
  fill(0,69,154);
  noStroke();
  rect(70,110,70,70);
  rect(110,90,10,20);
  //Azul claro
  fill(0,100,221);
  noStroke();
  rect(100,90,10,10);
  rect(120,90,10,10);
  rect(80,100,30,10);
  rect(120,100,20,10);
  rect(140,160,10,10);
  rect(70,170,10,10);
  rect(130,170,10,10);
  //Negro
  fill(0);
  noStroke();
  rect(60,30,10,50);
  rect(60,80,100,10);
  rect(70,110,10,50);
  rect(80,160,10,10);
  rect(90,130,10,30);
  rect(140,110,10,50);
  rect(130,160,10,10);
  rect(120,130,10,30);
  
  rect(70,180,70,20);
  rect(70,200,10,40);
  rect(80,230,10,10);
  rect(130,200,10,40);
  rect(140,230,10,10);
}

void vinil(){ 
  //Negro
  fill(0);
  noStroke();
  rect(80,10,60,100);
  rect(70,20,80,80);
  rect(60,30,100,60);
  rect(100,110,20,10);
    //Brazos
    rect(80,120,60,20);
    rect(70,140,80,10);
    rect(50,150,30,10);
    rect(140,150,30,10);
    rect(40,140,20,10);
    rect(160,140,20,10);
    rect(40,120,10,30);
    rect(170,120,10,30);
    rect(20,130,20,10);
    rect(180,130,20,10);
    rect(20,120,10,10);
    rect(190,120,10,10);
    
    //Piernas
    rect(40,180,140,10);
    rect(30,190,10,10);
    rect(180,190,10,10);
    rect(40,200,50,10);
    rect(130,200,50,10);
    
  //Azul
  fill(0,100,221);
  noStroke();
  rect(90,200,10,30);
  rect(120,200,10,30);
  
  //Beige
  fill(255,251,215);
  noStroke();
  rect(90,120,40,60);
  
  //Gris
  fill(37);
  noStroke();
  rect(100,120,20,20);
  
    //Lineas de cabeza
    rect(90,20,40,10);
    rect(90,90,40,10);
    rect(70,40,10,40);
    rect(140,40,10,40);
    rect(80,30,10,10);
    rect(130,30,10,10);
    rect(80,80,10,10);
    rect(130,80,10,10);
    
    rect(100,40,20,10);
    rect(100,70,20,10);
    rect(90,50,10,20);
    rect(120,50,10,20);
  
  //Naranja
  fill(255,66,0);
  noStroke();
  rect(100,50,20,20);
}

void cd(){
  //Gris claro
  fill(224);
  noStroke();
  rect(100,20,50,90);
  rect(90,30,70,70);
  rect(80,40,90,50);
  
  //Negro
  fill(0);
  noStroke();
  rect(70,210,30,30);
  rect(140,210,30,30);
  rect(80,200,10,10);
  rect(150,200,10,10);
  rect(60,190,120,10);
  rect(70,130,100,60);
  rect(80,120,80,10);
  rect(100,110,40,10);
    //Audifonos
    rect(70,20,10,30);
    rect(80,10,10,10);
    rect(90,0,60,10);
    rect(150,10,20,10);
    rect(170,20,10,30);
  
  //Gris
  fill(187);
  noStroke();
  rect(100,50,10,30);
  rect(140,50,10,30);
  rect(110,40,30,10);
  rect(110,80,30,10);
  rect(120,60,10,10);
    //Brazos
    rect(40,130,30,10);
    rect(20,120,20,10);
    rect(20,140,20,10);
    rect(170,130,30,10);
    rect(200,120,20,10);
    rect(200,140,20,10);
    //Pies
    rect(80,220,10,10);
    rect(150,220,10,10);
  
  //Azul  
  fill(0,69,154);
  noStroke();
  rect(60,50,20,30);
  rect(170,50,20,30);
  rect(50,60,10,10);
  rect(190,60,10,10);
  
  //Rojo
  fill(255,66,0);
  noStroke();
  rect(110,110,20,10);
  rect(90,120,60,70);
  
  //Beige
  fill(255,251,215);
  noStroke();
  rect(100,140,40,20);
    //Detalles Negro
    fill(0);
    noStroke();
    rect(120,140,10,10);
    rect(110,150,10,10);
}

void usb(){
  //Cafe
  fill(188,109,0);
  noStroke();
  rect(80,100,70,20);
  rect(40,120,150,70);
  
  //Negro
  fill(37);
  noStroke();
  rect(10,30,10,20);
  rect(30,30,20,20);
  rect(60,30,10,20);
  rect(150,30,20,20);
  rect(180,30,10,20);
  rect(200,30,20,20);
  rect(30,70,40,10);
  rect(150,70,10,10);
  rect(170,70,10,10);
  rect(190,60,10,10);
  rect(200,70,10,10);
  rect(190,80,10,10);
    //Lineas Chamarra
    rect(40,130,150,10);
    rect(40,150,150,10);
    rect(40,170,150,10);
    //Piernas
    rect(60,190,110,10);
    rect(60,200,50,20);
    rect(130,200,40,20);
    
  //Gris Claro
  fill(224);
  noStroke();
  rect(90,20,50,30);
  
  //Gris Obscuro
  fill(187);
  noStroke();
  rect(90,50,50,10);
    //Cabeza (Negro)
    fill(37);
    noStroke();
    rect(90,60,50,50);
    rect(100,30,10,10);
    rect(120,30,10,10);
    //Logo(Gris)
    fill(224);
    noStroke();
    rect(100,70,10,20);
    rect(120,70,10,20);
    rect(110,90,10,10);
  
  //Rojo
  fill(255,66,0);
  noStroke();
  rect(60,220,40,10);
  rect(60,230,20,10);
  rect(130,220,40,10);
  rect(130,230,20,10);
  
  //Naranja
  fill(255,148,0);
  noStroke();
  rect(50,110,30,10);
  rect(40,120,20,10);
  rect(40,130,10,30);
  rect(30,160,10,20);
  rect(40,180,40,10);
  rect(80,150,10,30);
  rect(140,150,10,30);
  rect(150,180,40,10);
  rect(190,160,10,20);
  rect(180,130,10,30);
  rect(170,120,20,10);
  rect(150,110,30,10);
}

void streaming(){
  //Azul Marino
  fill(0,69,154);
  noStroke();
  rect(80,30,70,130);
  
  //Azul claro
  fill(0,100,221);
  noStroke();
  rect(90,20,70,130);
  
  //Gris
  fill(224);
  noStroke();
  rect(100,30,50,100);
  
  //Negro
  fill(0);
  noStroke();
  rect(120,110,10,10);
  rect(120,90,10,10);
  rect(120,70,10,10);
  rect(120,40,10,10);
  rect(110,50,10,10);
  rect(130,50,10,10);
    //Pantalones
    rect(100,160,50,10);
    rect(100,170,20,10);
    rect(130,170,20,10);
    rect(100,180,10,20);
    rect(140,180,10,30);
    rect(70,190,30,10);
    rect(120,210,20,10);
  
  //Rojo
  fill(255,66,0);
  noStroke();
  rect(60,190,10,30);
  rect(110,210,10,20);
    //Logo de bajada
    rect(180,70,30,40);
    rect(210,90,10,10);
      //Sombra
      fill(165,43,0);
      noStroke();
      rect(180,90,20,20);
      rect(170,90,10,10);
      rect(180,80,10,10);
      rect(190,110,10,10);
  
  //Verde claro
  fill(197,255,143);
  noStroke();
  rect(30,80,30,40);
  rect(20,90,10,10);
    //Sombra
    fill(155,255,61);
    noStroke();
    rect(40,80,20,20);
    rect(40,70,10,10);
    rect(50,100,10,10);
    rect(60,90,10,10);
  }
