public void Player() {
    background(0);
   
    fill(#00FF00);
    stroke(#FFFFFF);
    
    //mover P1
    
    if (direitaP1) x[0] +=speed1;
    if (esquerdaP1) x[0] -=speed1;
    
    //renderizar P1  
    rect(x[0], y[0], l, a);
    
    fill(#0000FF);
    //mover P2 
    if (direitaP2) x[1] +=speed2;
    if (esquerdaP2) x[1] -=speed2;
    
  if(tela!="vBot"){
  //renderizar P2 na tela se n for singleplayer
  rect(x[1], y[1], l, a);
  }

  //Manter player 1 na tela
  if(x[0]<2){
    x[0]=2;
  }
  if(x[0]>717){
    x[0]=717;
  }

  //Manter player 2 na tela
  if(x[1]<2){
    x[1]=2;
  }
  if(x[1]>717){
    x[1]=717;
  }

  //Barras de vida
  fill(#00FF00);
  stroke(#FFFFFF);
  
  //P1(verde)
  rect(30, height/3,20,100);
  
  //P2(verde)
  if(tela != "vBot"){
  rect(width-30, height/3,20,100);
  }
  fill(#FF0000);
  //P1(vida perdida)
  rect(30, height/3,20,20*vidaPerdida[0]);
  
  //P2(vida perdida)
  if(tela != "vBot"){
  rect(width-30, height/3,20,20*vidaPerdida[1]);
  }
  
  if (vidaPerdida[0] ==5 || vidaPerdida[1] ==5){
    tela="menu";vidaPerdida[0]=0;vidaPerdida[1]=0;
  }
}
