class Marshmallow {
  PVector mPos;    // position of the marshmallow
  PVector mVel;    // speed of the marshmallow
  float r;        // for hit detection
  boolean mActive = true; // whether this marshmallow is still not be eat


  Marshmallow(float X, float Y) {
 mPos = new PVector(X, Y);
 mVel = new PVector(random(-1, 1), random(-1, 1)); //Random speed allows the marshmallows to appear randomly on the field and move randomly.
  r = 15;

 }

  void mMove() {
    if (mActive == true) {
      mPos.add(mVel);
    }
      // bounce on edges
      if (mPos.x < r || mPos.x > width - r) {
        mVel.x = -mVel.x;
      }
      
      if (mPos.y < r || mPos.y > height - r) {
        mVel.y = -mVel.y;
      }
      
   }

  void mDisplay() {
    if (mActive == true) {
      imageMode(CENTER);
      image(mImg, mPos.x, mPos.y, r * 2, r * 2);
    }
  }
}
