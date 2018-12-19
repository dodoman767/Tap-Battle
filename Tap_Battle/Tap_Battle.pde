import ddf.minim.*;
AudioPlayer player;
AudioPlayer playerB;
AudioPlayer player2;
AudioPlayer soundtrack;
AudioPlayer combo;
AudioPlayer fire;
AudioPlayer start;
Minim minim;

PFont f;
PImage up;
PImage right;
PImage down;
PImage left;
PImage bg;
PImage bg2;

int score = 0;
int location = 0;
int N = 5;
int streak;
int streak2;
int t = 0;
int page = 0;
long sTime = 0;
int topScore = 0;

Button[] buttons;

void setup()
{
  // Create the font
  printArray(PFont.list());
  f = createFont("Berlin Sans FB Demi Bold", 24);
  textFont(f);

  size(810, 450);
  up = loadImage("UP.png");
  right = loadImage("RIGHT.png");
  down = loadImage("DOWN.png");
  left = loadImage("LEFT.png");
  bg = loadImage("background.jpg");
  bg2 = loadImage("bg2.jpg");

  minim = new Minim(this);
  player = minim.loadFile("blop.mp3", 256);
  playerB = minim.loadFile("blop.mp3", 256);
  player2 = minim.loadFile("no.mp3", 256);
  soundtrack = minim.loadFile("soundtrack.mp3", 512);
  combo = minim.loadFile("combo.mp3", 256);
  fire = minim.loadFile("fire.mp3", 256);
  start = minim.loadFile("start.mp3", 1024);

  soundtrack.loop();
  //Initializing buttons
  remake();
}

////////////////////////////////////////////////////////////////////////////////

void draw() 
{

  if (page == 0)
  {
    background(bg2);
    textSize(40);
    fill(0, 0, 0);
    text("Tappy Battles Ver 1.0.1", 220, 90);
    textSize(10);
    fill(255, 255, 255);
    text("PLAY:  enter\nHELP:  ?\nBATTLE:  b\nHOME:  backspace", 10, 20);  
    textSize(20);
    text("Score: " + score, 650, 30);
    textSize(32);  
    fill(199, 50, 255);
    text("TOP Score: " + topScore, 300, 250);
    fill(255, 255, 255);
  } else if (page == 1)
  {
    background(bg);
    stroke(0, 64, 0);
    textSize(30);
    text("Score: "+ score, 20, 430);
    textSize(15);
    text("press - & + to\nchange # of circles", 650, 410);

    if (location == 0 ) {
    }

    for (Button button : buttons)
    {
      button.show();
      button.update();
    }
    t++;
    long cTime = System.currentTimeMillis();
    if (cTime - sTime > 30000)
    {
      page = 0;
       if (score > topScore){
    topScore = score; 
   }
    }
    textSize(20);
    text("Time: " + (30 - (System.currentTimeMillis()-sTime)/1000), 650, 300);
  } else if (page == 2)//HELP
  {
  } else if (page == 3)//BATTLE
  {
  } 

  //Start sequence
  else if (page ==4)//bg
  {
    background(bg);
    page = 5;
  } else if (page == 5)///buzzer
  {
    start.rewind();
    start.play();
    page = 6;
  } else if  (page ==6)//3
  {
    background(bg);
    textSize(100);
    text("3", 390, 240);
    page =7;
    delay(1000);
  } else if  (page ==7)//2
  {
    background(bg);
    text("2", 390, 240);
    delay(1000);
    page =8;
  } else if  (page ==8)//1
  {
    background(bg);
    text("1", 390, 240);
    delay(1000);
    page = 9;
  } else if (page ==9)//Go
  {
    delay(1000);
    page = 1;
    sTime = System.currentTimeMillis();
    score = 0;
  }
}
////////////////////////////////////////////////////////////////////////////////
void keyPressed() 
{
  if (keyCode == ENTER && page !=4)
  {
    page = 4;
    draw();
  }

  if (keyCode == BACKSPACE)
  {
    page = 0;
  }
  if (keyCode == '/' || keyCode == '?')
  {
    page = 2;
  }
  if (keyCode == 'b' || keyCode == 'B')
  {
    page = 3;
  }



  if (page == 0)
  {
  } else if (page == 1) {

    if (keyCode == UP|| keyCode == 'W')
    {
      if (buttons[location].type == 1)
      {
        Score();
      } else {
        Miss();
      }
    }
    if (keyCode == RIGHT|| keyCode == 'D')
    {
      if (buttons[location].type == 2)
      {
        Score();
      } else {
        Miss();
      }
    }
    if (keyCode == DOWN|| keyCode == 'S')
    {
      if (buttons[location].type == 3)
      {
        Score();
      } else {
        Miss();
      }
    }
    if (keyCode == LEFT || keyCode == 'A')
    {
      if (buttons[location].type == 4)
      {
        Score();
      } else {
        Miss();
      }
    }
    if (location >=N) {
      location = 0;
      score += N;
      remake();
    }
    if (score < 0) {
      score = 0 ;
    }

    /////////////////////////////Change # of circle///////////////////////////////////
    if (keyCode == '-'||keyCode == '_') {
      if (N>1) {
        N--;
        remake();
      }
    } else if (keyCode == '=' ||keyCode == '+') {
      if (N<9) {
        N++;
        remake();
      }
    }
  }
}
