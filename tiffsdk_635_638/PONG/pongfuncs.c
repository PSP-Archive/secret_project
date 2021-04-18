//GridShift Pong v1.0
//By: Dragula96
//01/07/09

//defenitions

int LEFT=1;
int RIGHT=2;
int UP=1;
int DOWN=2;

//Game Variables///
int ballX=200,ballY=100,ballV_Direction=2,ballH_Direction=1,ballWidth=16,ballHeight=16,ballV_Speed=4,ballH_Speed=4;
int paddleHeight=64;
int paddleWidth=16;
int paddleSpeed=6;
int paddle1X=10,paddle1Y=20;
int paddle2X=SCREEN_WIDTH-60,paddle2Y=20;
int playerScore=0,cpuScore=0;
int top=16;
int bottom=SCREEN_HEIGHT -16;
int bounces=0;
int var1, var2; //used for randomizing ball directions
//game functions////
void pong(){//main pong loop
     
     checkCollide();
     updateBall();
     AI();
    
     drawAll();     
     
}
void reset(){
ballX=200;
ballY=100;

ballV_Direction=var1;
ballH_Direction=var2; 
ballV_Speed=4;
ballH_Speed=4;
paddle1Y=20;
paddle2Y=20;
bounces=0;
sceKernelDelayThread(1*1000*1000);    
}
void AI(){
 
 if(ballY>paddle2Y+paddleHeight & paddle2Y+paddleHeight<bottom & ballH_Direction==RIGHT){
 paddle2Y+=paddleSpeed; 
    
}
 if(ballY+ballHeight<paddle2Y & paddle2Y>top& ballH_Direction==RIGHT){
 paddle2Y-=paddleSpeed;     
}
}

void checkCollide(){
 if(ballY<top){
    ballV_Direction=DOWN;
    bounces++;
    }
 if(ballY+ballHeight>bottom){
    ballV_Direction=UP;
    bounces++;
    } 
 //temp colides
 if(ballX<0){
    
    cpuScore++;
    reset();
    }
 if(ballX+ballWidth>SCREEN_WIDTH){
    
    playerScore++;
    reset();
    }
 ////
 if (ballX<paddle1X+paddleWidth & paddle1X<ballX+ballWidth & ballY<paddle1Y+paddleHeight & paddle1Y<ballY+ballWidth){
                                ballH_Direction=RIGHT;
                                bounces++;
 }  
 if (ballX+ballWidth>paddle2X & paddle2X+paddleWidth>ballX & ballY<paddle2Y+paddleHeight & paddle2Y<ballY+ballWidth){
                                ballH_Direction=LEFT;
                                bounces++;
 }
if(bounces>20){
  ballH_Speed++;
  ballV_Speed++;
  bounces=0;
}
}


void updateBall(){
if(ballV_Direction==UP){ballY-=ballV_Speed;}
if(ballV_Direction==DOWN){ballY+=ballV_Speed;}
if(ballH_Direction==LEFT){ballX-=ballH_Speed;}
if(ballH_Direction==RIGHT){ballX+=ballH_Speed;}                      
                        
}

void drawPaddles(){

drawPixel(paddle1X,paddle1Y,paddleWidth,paddleHeight,0x00FFFFFFL);   
drawPixel(paddle2X,paddle2Y,paddleWidth,paddleHeight,0x00FFFFFFL);           
     
}
void drawBall(){

drawPixel(ballX,ballY,ballWidth,ballHeight,0x00FFFFFFL);      
}

void drawScore(){
     
	 //for(playerScore =0 ; playerScore < 50 ; playerScore++)
	 
	 //for(cpuScore=0 ; cpuScore < 50 ; cpuScore++)
	 
}
drawBounds(){
drawPixel(0,0,SCREEN_WIDTH,top,0x00FFFFFFL); 
drawPixel(0,bottom,SCREEN_WIDTH,ballHeight,0x00FFFFFFL);              
}
void drawAll(){
drawBounds();
drawBall();
drawPaddles();     
drawScore();
changeBuffer();     
}

void ProcessKeys(unsigned long xikeys)
{
  
  if (xikeys & PSP_CTRL_UP) { //pressed up
             if(paddle1Y>top) { paddle1Y-=paddleSpeed; }
             
  }
  if (xikeys & PSP_CTRL_DOWN) {
             if(paddle1Y+paddleHeight<bottom) { paddle1Y+=paddleSpeed; }
            
  }


}
