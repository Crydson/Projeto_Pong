import ddf.minim.*;

public float speed1=3,speed2=3,lBola=10,aBola=10,randomStart;

public float[] xBola={400,600},yBola={300,300}; 

public int l,a,menuOption,dX=395,dY=-1,dA=height+1,dL=10, botSpeed1=4,botSpeed2=4, maxSpeed=6,score1=0,score2=0;

public int[] x={100,600,100,600},y={570,570,20,20},speedX={4,4},speedY={2,2},currentSpeed,vidaPerdida={0,0};

public boolean cimaP1, baixoP1, esquerdaP1, direitaP1, cimaP2, baixoP2, esquerdaP2, direitaP2, creditos=false;

String tela;

//audio
/*
Minim audio;
AudioPlayer musicaMenu,musicaNormal,musicaBoss,bolaQuicar;*/

void setup() {
      size(800,600);
    
      frameRate(60);
    
    /*
    audio = new Minim(this);
    musicaMenu = audio.loadFile("");musicaMenu.setGain(0);
    musicaMenu.loop();
    */
    
     randomStart = random(5);
     if(randomStart>3){
       speedX[0]*=-1;speedX[1]*=-1;
     }
     
     randomStart = random(5);
     if(randomStart>3){
       speedY[0]*=-1;speedY[1]*=-1;
     }
    
    //largura e altura dos player e bots
    l = 80;
    a = 10;
    
    tela = "menu";
}

void draw() {
     switch (tela){
         
       case "menu":
             telaMenu();
         break;
       
       case "opcoes":
             telaOpcoes();
         break;
       
       case "creditos":
             telaCreditos();
         break;
         
       case "select":
             telaSelect();
         break;
         
       case "vBot":
             Player();bola();scores();cpus();//colocar cpu na tela
        break;
       
       case "pvpN":
             Player();bola();scores();
         break;
         
       case "pvpC":
             Player();cpus();bola();scores();divisor();//colocar divisor e cpus na tela, bola 2 aparece tmb
         break;
       
       case "instrucoes":
           telaIntrucoes();
         break;
         
       case "sair":
             exit();
         return;
         
     }
}

public boolean telaMenu(){
    background(0);
    fill(#FFFFFF);
    textSize(100);
    
    //título
    text("Pongo God", width/6, 150);
    
    //seta de seleção
    triangle(width/8,270+menuOption*50,width/8,300+menuOption*50,width/6.5,285+menuOption*50);
    
    //opções do menu
    textSize(40);
    text("Start", width/6, 300);
    text("Opções", width/6, 350);
    text("Créditos", width/6, 400);
    text("Sair", width/6, 450);
    
    return true;
}

public void keyPressed() {
  if(tela=="vBot" || tela=="pvpN" || tela=="pvpC"){
  //controles P1 (apertar)
   if (keyCode == 68) direitaP1 = true;
   if (keyCode == 65) esquerdaP1 = true;
  
  //controles P2 (apertar)
   if (keyCode == 39) direitaP2 = true;
   if (keyCode == 37) esquerdaP2 = true;
  }
  
  
  //opções do menu
  if(tela == "menu" && keyCode == 87 && menuOption>0) menuOption-=1;
  if(tela == "menu" && keyCode == 83 && menuOption<3) menuOption+=1;
  
  //opções da tela de opções
  if(tela == "opcoes" && keyCode == 87 && opcoesOption>0) opcoesOption-=1;
  if(tela == "opcoes" && keyCode == 83 && opcoesOption<2) opcoesOption+=1;
  
  if(tela == "opcoes" && keyCode == 32 && opcoesOption==0) tela="instrucoes";
  
  if(tela == "instrucoes" && keyCode == 32 && opcoesOption==0) tela="opcoes";
  
  //selecionar modo de jogo
  if(tela == "select" && keyCode == 87 && selectOption>0) selectOption-=1;
  if(tela == "select" && keyCode == 83 && selectOption<4) selectOption+=1;
  if(tela == "select" && keyCode == 83 && selectOption==3) selectOption+=1;
  if(tela == "select" && keyCode == 87 && selectOption==3) selectOption-=1;
  
  if(tela == "select" && selectOption ==0 && keyCode == 32){tela = "vBot";selectOption=0;x[0]=(width/2)-50;}
 
  if(tela == "select" && selectOption ==1 && keyCode == 32){tela = "pvpN";selectOption=0;x[0]=(width/2)-50;x[1]=(width/2)-50;y[1]=20;}
  
  if(tela == "select" && selectOption ==2 && keyCode == 32){tela = "pvpC";selectOption=0;xBola[0]=180;} //posição da bola muda pro pvpC
  
   
  /menu para creditos
     if (tela == "menu" && menuOption==2 && keyCode == 32) { tela = "creditos";}

    if (tela == "creditos"  && keyCode == 32 && creditos==true) {tela="menu";creditos=false;}
if (tela == "creditos" && keyCode == 32) { creditos=true;}

}
void keyReleased() {
    //controles P1 (soltar)
   if (keyCode == 68) direitaP1 = false;
   if (keyCode == 65) esquerdaP1 = false;
   if (keyCode == 83) baixoP1 = false;
   if (keyCode == 87) cimaP1 = false;
    
    //controles P2 (soltar)
   if (keyCode == 39) direitaP2 = false;
   if (keyCode == 37) esquerdaP2 = false;
   if (keyCode == 40) baixoP2 = false;
   if (keyCode == 38) cimaP2 = false;

    //mudar de tela do menu
   if (tela == "menu" && menuOption==0 && keyCode == 32) tela = "select";
    
   if (tela == "menu" && menuOption==1 && keyCode == 32) {tela = "opcoes";menuOption=0;opcoesOption=0;}
    
   if (tela == "menu" && menuOption==3 && keyCode == 32) tela = "sair";
   
   //outros para menu
   if (tela == "select" && selectOption==4 && keyCode == 32){tela = "menu";selectOption=0;}
   
   
  
   if (tela == "opcoes" && opcoesOption==2 && keyCode == 32) {tela = "menu";opcoesOption=0;}
   
    
}
