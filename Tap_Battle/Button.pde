
class Button {
  
 float x;
 float y;
 float type;
 float index;
 
 float time = 200;
 float direction = 0;
  
  Button(float x, float y, float type, float index)
  {
    this.x = x;
    this.y = y;
    this.type = type;
    this.index = index;
    
  }
  
  void show ()
  {
    if (type == 1 ){
   fill(140,time,20);
    }
    else if (type == 2 ){
   fill(20,time,140);
    }
    else if (type == 3 ){
   fill(time, 50, 120);
    }
    else if (type == 4 ){
   fill(120, 50, time);
    }
    
   ellipse(x,y,50,50);
   
   
   
   if (type == 1)
   {
     image(up,x-15,y-15,30,30);
   }
   else if (type == 2)
   {
     image(right,x-15,y-15,30,30);
   }
   else if (type == 3)
   {
     image(down,x-15,y-15,30,30);
   }
   else if (type == 4)
   {
     image(left,x-15,y-15,30,30);
   }
   else if (type == 5)
   {
     //No image
   }

 }
 //////////////////////////////////////////////////////////////
 void update() 
  {
    
   fill(255,255,255);
     if (location == index) {
   ellipse(x,y+50,10,10);
   }
    
    
    //graphics
    if (time >= 254){
        direction = 1;
      }
    else if (time <=200){
        direction = 0;
    }
    if (direction == 0){
      time++;
    }
    else if (direction == 1){
       time--;  
    }
    
    
    
  }
  
  
  
  
}
