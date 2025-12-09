class Cat {
  PVector catPos;   // the origin position of cat
  PVector catVel;   // the speed of cat
  boolean left;
  boolean right;
  boolean up;
  float r = 30;     // The cat's body range used for distance or hit detection
  PImage catImg;

  Cat(float x, float y, PImage img) {
    catPos = new PVector(x, y);
    catVel = new PVector(0, 0);
    catImg = img;
  }

  void catMove() {
    
    // Update position
    catPos.add(catVel);
    
    // Left and right movement
    if (left == true){
      catVel.x -= moveSpeed;
    }
    if (right == true ) {
      catVel.x += moveSpeed;
    }

    // When holding the up key W or arrow, give the cat an upward speed
    if (up == true) {
      catVel.y += Up;   
    }// Up value is negative, so y moves upward

    // Gravity pulls the cat down each frame
    catVel.y += gravity;

    // Limit max speed
    catVel.x = constrain(catVel.x, -5, 5);
    catVel.y = constrain(catVel.y, -10, 10);

 

    // Bottom boundary
    if (catPos.y > height - r) {
      catPos.y = height - r;
      catVel.y = 0;
    }

    // Top boundary
    if (catPos.y < r) {
      catPos.y = r;
      catVel.y = 0;
    }

    // Left and right boundaries
    if (catPos.x < r) {
      catPos.x = r;
    }
    if (catPos.x > width - r) {
      catPos.x = width - r;
    }

  
  }

  void catDisplay() {
    imageMode(CENTER);
    image(catImg, catPos.x, catPos.y, r * 2, r * 2);
  }
}
