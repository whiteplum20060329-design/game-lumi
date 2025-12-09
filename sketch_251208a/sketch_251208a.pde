// Two space cats. Player 1 uses WASD, Player 2 uses Arrow keys.
// Hold W or UP to fly upward.

PImage backgroundImg;
PImage catImg1;
PImage catImg2;

Cat[] cats = new Cat[2];   // Array of players
float gravity = 0.2;       // Downward speed
float moveSpeed = 0.5;     // Horizontal speed
float Up = -0.4;           // Upward speed (negative = upward)

void setup() {
  size(400, 400);
  
  backgroundImg = loadImage("background.png");
  catImg1 = loadImage("cat.png");
  catImg2 = loadImage("cat.png");

  cats[0] = new Cat(100, 200, catImg1);
  cats[1] = new Cat(300, 200, catImg2);
}

void draw() {
  
  
  image(backgroundImg, width/2,height/2, width, height);

  for (int i = 0; i < cats.length; i++) {
    cats[i].catMove();
    cats[i].catDisplay();
  }

 
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
