void remake(){

buttons = new Button[N];
  
  for (int i = 0; i < N; i++) //P1
  {
   buttons[i]= new Button((450-45*N)+90*i,90, round(random(1,4)), i); 
  }
}
