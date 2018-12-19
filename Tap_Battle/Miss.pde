void Miss() {
  location = 0;
  score--;
  player2.rewind();
    player2.play();
    streak=0;
    streak2 =0;
    t= 0;
    remake();
}
