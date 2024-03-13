float [] x,y;
float [] x1,y1,l,vx1,vy1; //장애물 생성을 위한 변수 생성 

void setup()
{
 x=new float[3];
 y=new float[3];
 size(1000,800);
 for(int i=0; i<3; ++i)  // 각 원의 중심좌표 설정
 {
   x[i]=100+200*i;
   y[i]=100;
 }

 {
 
   //장애물 변수들 메모리 할당 
   x1 = new float[5];
   y1 = new float[5];
   l = new float[5];
   vy1 = new float[5];
   vx1 = new float[5];
   
   // 장애물 array에 랜덤변수 넣어주기
   for(int i = 0; i < 5; i++){ 
  x1[i] = random(0,width);
  y1[i] = random(200,height);
  l[i] = random(30,50);
  vx1[i] = random(1,3);
  vy1[i] = random(1,3);
 }
}
}

void draw()
{
  background(255,255,0);  // 배경색깔 채우기
  for(int i=0; i<3; ++i)  // 원(캐릭터)  3개 만들기
  {
 fill(100*i,0,0);
  circle(x[i],y[i],100);
  }
  
  
 { 

   //장애물 생성 및 벽에 닿으면 돌아오도록구현
   fill(255,255,255); //장애물 색깔 흰색으로 설정
  for(int i = 0; i < 5; i++){
   Obstacle(x1[i],y1[i],l[i]);
    y1[i] += vy1[i];
    if(y1[i]>height || y1[i] < 0 ) vy1[i] = -vy1[i];
    x1[i] += vx1[i];
    if(x1[i]>width || x1[i] < 0 ) vx1[i] = -vx1[i];
    crash(); // 충돌 함수 
  }
 }
}

void keyPressed()
{
  if(key == 'd') x[0] += 5;    // wasd 움직임
  else if(key == 'a') x[0] -= 20;
  else if(key == 'w') y[0] -= 20;
  else if(key == 's') y[0] += 20;  
  
  if(key == 'n') x[1] += 5;    // gvbn 움직임
  else if(key == 'v') x[1] -= 20;
  else if(key == 'g' ) y[1] -= 20;
  else if(key == 'b') y[1] += 20;  
  
  if(key == 'l') x[2] += 20;    // ijkl 움직임
  else if(key == 'j') x[2] -= 20;
  else if(key == 'i') y[2] -= 20;
  else if(key == 'k') y[2] += 20;  
}

void Obstacle(float x1, float y1, float l)
{ 
  // 장애물 생성 함수
  rect(x1,y1,l,l);
}
void crash(){
  for(int i=0; i<3; ++i){
    for(int j = 0; j < 5; j++){
      float dx = x[i]-(x1[j]+l[i]/2);
      float dy = y[i]-(y1[j]+l[i]/2);
      float d = sqrt(dx*dx+dy*dy);
      if (d<50+l[i]*sqrt(2)/2){
        fill (255,0,0);
        textSize(90);
        text("Game Over",200,300);

        exit();
        fill(255,255,255);  
      }
    }
  }
}
