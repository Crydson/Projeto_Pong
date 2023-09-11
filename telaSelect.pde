public int selectOption=0;

public void telaSelect(){
   background(0);
    textSize(60);
   fill(#FFFFFF);
   fill(0);stroke(255);
   rect(200,15,400,64);
   fill(#FFFFFF);
   text("Modo de jogo",200,65);
   
   triangle(width/5,120+selectOption*80,width/5,150+selectOption*80,width/4.3,135+selectOption*80);
   
   textSize(40);
    text("Vs CPU",320,150);
    text("Pvp normal",280,230);
    text("Pvp competição",230,310);
    text("Menu",320,470);
    
}
