public void bola() {
  fill(255,0,0);
 
 //gerar primeira bola
 ellipse(xBola[0], yBola[0], lBola, aBola);
  
 xBola[0] += speedX[0];
 yBola[0] += speedY[0];
 
 for(;speedX[0]>0 && abs(speedX[0])+abs(speedY[0])<maxSpeed;speedX[0]++){}
 for(;speedX[0]<0 && abs(speedX[0])+abs(speedY[0])<maxSpeed;speedX[0]--){}
 
  //colisão com paredes
  if (xBola[0]>width-aBola/2||xBola[0]<aBola/2) {
  speedX[0]*=-1;
  }
  
  //colisão da primeira bola com player 1
  if(yBola[0] + aBola/2 > y[0] && y[0] + a > yBola[0] && xBola[0] + lBola/2 > x[0] && x[0] + l > xBola[0]){
    
    if(speedX[0]>0){speedX[0] = int(random(1,4));}
    
    if(speedX[0]<0){speedX[0] = int(random(1,4))*-1;}
    
    speedY[0] = int(random(2,5))*-1;
  }
  if(tela!="vBot"){
  //colisão da primeira bola com player 2
  if(yBola[0] + aBola/2 > y[1] && y[1] + a > yBola[0] && xBola[0] + lBola/2 > x[1] && x[1] + l > xBola[0]){
    
    if(speedX[0]>0){speedX[0] = int(random(1,4));}
    
    if(speedX[0]<0){speedX[0] = int(random(1,4))*-1;}
    
    if(tela=="pvpN"){speedY[0] = int(random(2,5));
      }else{speedY[0] = int(random(2,5))*-1;}
    }
  }
  
  //Colisão da primeira bola com CPU1
  if(tela!="pvpN"){
  if(yBola[0] + aBola/2 > y[2] && y[2] + a > yBola[0] && xBola[0] + lBola/2 > x[2] && x[2] + l > xBola[0]){
    
    if(speedX[0]>0){speedX[0] = int(random(1,4))*-1;}
    
    if(speedX[0]<0){speedX[0] = int(random(1,4));}
    
    speedY[0] = int(random(2,5));
    }
  }
  
  //Colisão da segunda bola com CPU2
  if(tela=="pvpC"){
  if(yBola[1] + aBola/2 > y[3] && y[3] + a > yBola[1] && xBola[1] + lBola/2 > x[3] && x[3] + l > xBola[1]){
    
    if(speedX[1]>0){speedX[1] = int(random(1,4))*-1;}
    
    if(speedX[1]<0){speedX[1] = int(random(1,4));}
    
    speedY[1] = int(random(2,5));
    }
  }
  
 //gerar segunda bola no pvpC
 if(tela == "pvpC"){
 ellipse(xBola[1], yBola[1], lBola, aBola);

 xBola[1] -= speedX[1];
 yBola[1] += speedY[1];
 
  //colisão da segunda bola com paredes
  if (xBola[1]>width-aBola/2||xBola[1]<aBola/2) {
  speedX[1]*=-1;
  }

  //colisão da segunda bola com player 1
  if(yBola[1] + aBola/2 > y[0] && y[0] + a > yBola[1] && xBola[1] + lBola/2 > x[0] && x[0] + l > xBola[1]){
    speedY[1]*=-1;
  }
  if(tela!="vBot"){
  //colisão da segunda bola com player 2
  if(yBola[1] + aBola/2 > y[1] && y[1] + a > yBola[1] && xBola[1] + lBola/2 > x[1] && x[1] + l > xBola[1]){
    speedY[1]*=-1;
    }
   }
  }
}

public void divisor(){
    //renderizar divisor
    stroke(255);fill(0);
    rect(dX,dY,dL,height+1);
  
    if(tela=="pvpC"){
    //colisão das bolas com o divisor
    //bola 1
    if(xBola[0] + lBola/2 > dX && dX + dL > xBola[0]){
    speedX[0] *= -1;
      }
    //Bola 2
    if(xBola[1] + lBola/2 > dX && dX + dL > xBola[1]){
    speedX[1] *= -1;
      }
      
    //Colisão dos players com o divisor
    //Player 1
    if(x[0] + l > dX && dX + dL >x[0]){
    x[0]=315;
      }
    //Player 2
    if(x[1] + l > dX && dX + dL >x[1]){
    x[1]=406;
      }
      
    //Colisão com das cpus com o divisor
    //CPU 1
    if(x[2] + l > dX && dX + dL >x[2]){
    x[2]=294;
      }
    //CPU 2
    if(x[3] + l > dX && dX + dL >x[3]){
    x[3]=406;
      }
    }
}

//pontuação
public void scores() {

 fill(255);
 text(score1, 30, height/3.1);
 if(tela != "vBot"){
 text(score2, width-30, height/3.1);
 }
 
 //pontuação bola 1
 if(yBola[0]<0){
   score1+=1;
   
    if(speedX[0]>0){speedX[0] = int(random(1,4))*-1;}
    
    if(speedX[0]<0){speedX[0] = int(random(1,4));}
   
    if(tela == "vBot"){
     xBola[0]=400;yBola[0]=300;
     }
     else if (tela == "pvpN"){
       xBola[0]=400;yBola[0]=300;vidaPerdida[1]+=1;
     }
     else if(tela == "pvpC"){
     xBola[0]=180;yBola[0]=300;
   }
 }
 if(yBola[0]>height){
     if(tela != "pvpC"){
       score2+=1;xBola[0]=400;yBola[0]=300;vidaPerdida[0]+=1;
       
       if(speedX[0]>0){speedX[0] = int(random(1,4))*-1;}
    
       if(speedX[0]<0){speedX[0] = int(random(1,4));}
       
     }else{
       xBola[0]=180;yBola[0]=300;vidaPerdida[0]+=1;
       
       if(speedX[0]>0){speedX[0] = int(random(1,4))*-1;}
    
       if(speedX[0]<0){speedX[0] = int(random(1,4));}
       
     }
   }
 //pontuação bola 2
 if(yBola[1]<0){
   score2+=1;
   
    if(speedX[1]>0){speedX[1] = int(random(1,4))*-1;}
    
    if(speedX[1]<0){speedX[1] = int(random(1,4));}
   
    xBola[1]=600;yBola[1]=300;
   
 }
 if(yBola[1]>height){
     
       xBola[1]=600;yBola[1]=300;vidaPerdida[1]+=1;
       
       if(speedX[1]>0){speedX[1] = -int(random(1,4))*-1;}
    
       if(speedX[1]<0){speedX[1] = int(random(1,4));}
       
     }
}
