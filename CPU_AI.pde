public void cpus(){
    //cor
    fill(#818181);
    stroke(#FFFFFF);
    
    if(speedX[0]>=4){
    botSpeed1=3;
    }else{botSpeed1=4;}
    
    if(speedX[1]>=4){
    botSpeed2=3;
    }else{botSpeed2=4;}
    
  //CPU1 seguir bola
  if(xBola[0] > x[2]+l-10){
      x[2]+=botSpeed1;
  }else if(xBola[0]<x[2]+10){
      x[2]-=botSpeed1;
    }
  
  if(tela=="pvpC"){
  //CPU2 seguir bola
  if(xBola[1]>x[3]+l+10){
      x[3]+=botSpeed2;
  }else if(xBola[1]<x[3]+10){
      x[3]-=botSpeed2;
    }
  }
    
  //renderizar CPU1  
  rect(x[2], y[2], l, a);
  
  //renderizar CPU2
  if(tela=="pvpC"){
  rect(x[3], y[3], l, a);
  }
  
  //Manter CPU1 na tela
  if(x[2]<2){
    x[2]=2;
  }
  if(x[2]>697){
    x[2]=697;
  }
  
  //Manter CPU2 na tela
  if(x[3]<2){
    x[3]=2;
  }
  if(x[3]>697){
    x[3]=697;
  }
  
}
