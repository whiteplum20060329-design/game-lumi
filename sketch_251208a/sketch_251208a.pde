// Two space cats. Player 1 uses WASD, Player 2 uses Arrow keys.
// Hold W or UP to fly upward.

PImage backgroundImg;
PImage catImg1;
PImage catImg2;
PImage mImg;

Cat[] cats = new Cat[2];   // Arraylist of players
Marshmallow[]m = new Marshmallow[26 ];//arraylist of marshmallows
float gravity = 0.2;       // Downward speed
float moveSpeed = 0.5;     // Horizontal speed
float Up = -0.4;           // Upward speed and negative is upward for the y pos

int collectedCount = 0; // how many marshmallows have been collected


void setup() {
  size(400, 400);
  
  backgroundImg = loadImage("background.png");
  catImg1 = loadImage("cat.png");
  catImg2 = loadImage("cat.png");
 mImg = loadImage("marshmallow.png");

  cats[0] = new Cat(100, 200, catImg1);
  cats[1] = new Cat(300, 200, catImg2);
  
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
   }
  }
}// This part checks if the cats touch any marshmallows.
//If a marshmallow is still not eaten,it calculates the distance between the marshmallow and each cat.
// If the distance is smaller than the sum of their values,it means the cat touches the marshmallow.
// Then the marshmallow disappears


 
}

void keyPressed() {
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
