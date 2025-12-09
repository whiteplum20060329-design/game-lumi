// Two space cats. Player 1 uses WAS, Player 2 uses Arrow keys.
// Hold W or UP to fly upward.
boolean gameStart=false;
boolean gameOver = false;  
boolean broken = false;// Whether the rope is broken or not  
boolean Win=false;

PImage backgroundImg;
PImage catImg1;
PImage catImg2;
PImage mImg;
PImage winImg;

Cat[] cats = new Cat[2];   // Arraylist of players
Marshmallow[]m = new Marshmallow[26];//arraylist of marshmallows
float gravity = 0.2;       // Downward speed
float moveSpeed = 0.5;     // Horizontal speed
float Up = -0.4;          // Upward speed and negative is upward for the y pos
Rope rope;         



int collectedCount = 0; // how many marshmallows have been collected


void setup() {
  size(400, 400);
  
  backgroundImg = loadImage("background.png");
  catImg1 = loadImage("cat.png");
  catImg2 = loadImage("cat.png");
 mImg = loadImage("marshmallow.png");
 winImg = loadImage("win.png");


  cats[0] = new Cat(100, 200, catImg1);
  cats[1] = new Cat(300, 200, catImg2);
  
 rope = new Rope(300); 
  
// create marshmallows
for (int i = 0; i < m.length; i++) {
 m[i] = new Marshmallow(random(40, width - 40), random(40, height - 60)); 
}

  
}

void draw() {
 
  image(backgroundImg, width/2,height/2, width, height);
  

  
 // move and display all marshmallows
for (int i = 0; i <m.length; i++) {
  m[i].mMove();
  m[i].mDisplay();
}
 
 // move and display all cats
for (int i = 0; i < cats.length; i++) {
    cats[i].catMove();
    cats[i].catDisplay();
  }


for (int i = 0; i < m.length; i++) {
  if (m[i].mActive == true) {
    float d1 = dist(cats[0].catPos.x, cats[0].catPos.y, m[i].mPos.x, m[i].mPos.y);
    float d2 = dist(cats[1].catPos.x, cats[1].catPos.y, m[i].mPos.x, m[i].mPos.y);//the distance between the marshmallow and each cat.
    
  if (d1 < cats[0].r + m[i].r || d2 < cats[1].r + m[i].r) {
      m[i].mActive = false;//this marshmallow is been eaten
     collectedCount = collectedCount + 1;   
   }
  }
}// This part checks if the cats touch any marshmallows.
//If a marshmallow is still not eaten,it calculates the distance between the marshmallow and each cat.
// If the distance is smaller than the sum of their values,it means the cat touches the marshmallow.
// Then the marshmallow disappears

 rope.rUpdate();
rope.rDisplay();

 

gamestart();
 gameover();
 win();
 
}

void keyPressed() {
  
   if (key == ' '){
 if(!gameStart){
      restart();
      gameStart=true;
    }else if(gameOver||Win){
     restart();
    }
  }
  
 // Player 1 uses WASD
  if (key == 'a' || key == 'A') {
    cats[0].left = true;
  }
  if (key == 'd' || key == 'D') {
    cats[0].right = true;
  }
  if (key == 'w' || key == 'W') {
    cats[0].up = true;
  }

  // Player 2 uses Arrow keys
  if (keyCode == LEFT) {
    cats[1].left = true;
  }
  if (keyCode == RIGHT) {
    cats[1].right = true;
  }
  if (keyCode == UP) {
    cats[1].up = true;
  }
  
 
}

void keyReleased() {
  // Player 1
  if (key == 'a' || key == 'A') {
    cats[0].left = false;
  }
  if (key == 'd' || key == 'D') {
    cats[0].right = false;
  }
  if (key == 'w' || key == 'W') {
    cats[0].up = false;
  }

  // Player 2
  if (keyCode == LEFT) {
    cats[1].left = false;
  }
  if (keyCode == RIGHT) {
    cats[1].right = false;
  }
  if (keyCode == UP) {
    cats[1].up = false;
  }
}


void gamestart(){// When the game hasn't started yet, show instructions and wait for the player to press SPACE to start.
if (!gameStart){
   background(0);
   fill(255,233,33);
   textSize(30);
   text("press the space to start",width/6,height/3);
   textSize(20);
   text("press WASD and arrow to move",width/6,height/2);
  text("collect marshmallows ",width/6 ,height/2+30);
   text("don't let the rope break",width/6 ,height/2+60);

 }
  }
  
  void gameover(){// When the rope breaks, the game enters a "Game Over" state.
    if (broken == true) {
    gameOver = true;
 
  } if(gameOver==true){
   background(0);
   fill(255,233,33);
   textSize(40);
    text("YOU LOST",width/6,height/2);
    textSize(20);
   text("press space to restart",width/6,height/1.5);
    }
  }
  
  void win(){// When all marshmallows are collected and the rope is still intact, the player wins.
   if(collectedCount == m.length-1 && broken == false){
       Win=true;
     }if(Win==true){
 imageMode(CENTER);
  image(winImg, width/2, height/2, width, height); 
       fill(255);
       textSize(40);
      text("YOU win!",width/6,height/2);
       textSize(20);
     text("press space to restart",width/6,height/1.5);
     }
} 

  
      
   void restart(){// When the player presses SPACE to restart, reset all game variables.

    gameStart=true;
     gameOver=false;
     Win=false;
     
  cats[0] = new Cat(100, 200, catImg1);
  cats[1] = new Cat(300, 200, catImg2);
  
 rope = new Rope(300); 
  
// create marshmallows
for (int i = 0; i < m.length; i++) {
 m[i] = new Marshmallow(random(40, width - 40), random(40, height - 60)); 
}
 broken = false;
collectedCount = 0;
   }
  


  
