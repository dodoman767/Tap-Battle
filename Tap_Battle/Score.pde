void Score(){
  
   buttons[location].y +=50;
   location++;
   
//////////////////////////////////SOUNDS//////////////////////////////////////////
   if (player.isPlaying() ==false){
   player.rewind();
   player.play();
   }
   else
   {
     playerB.rewind();
     playerB.play();
   }
////////////////////////////////STREAKS///////////////////////////////////////////  
   streak++;
   streak2++;
   if (streak >= 20 && t <400){
     combo.rewind();
     combo.play();
     streak = 0;
     t = 0;
     score+=streak2;
   }
   else if (streak >=20)
   {
    streak = 0;
    t = 0;
   }
   if (streak2 >=45 && streak2 %25 ==0){
     fire.rewind();
     fire.play();
   }
}
