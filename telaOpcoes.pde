public int opcoesOption=0;

public void telaOpcoes(){
  background(0);
  
  //opções(palavra)
   textSize(60);
   fill(#FFFFFF);
   fill(0);stroke(255);
   rect(298,15,219,64);
   fill(#FFFFFF);
   text("Opções",300,65);
  
  //seta de seleção
   triangle(width/5,260+opcoesOption*50,width/5,290+opcoesOption*50,width/4.3,275+opcoesOption*50);
  
  //opções(opções msm)
  textSize(40);
  
  text("Como jogar",290,290);
  text("Volume",330,340);
  text("Menu",350,390);
}

public void telaIntrucoes() {
    background(0);
        textSize(20);
    fill(#FFFFFF);
    text("O primeiro jogador pode se movimentar por WASD,",10,20);
    text(" você possui 5 de vida e quando isso chegar a zero será game over",10,40);
  }
