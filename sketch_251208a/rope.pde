class Rope {
  float maxLen; // The maximum length the rope can stretch   

 Rope(float max) {
    maxLen = max;
    broken = false;
  }

 void rUpdate() {
    if (!broken) {
      float d = dist(cats[0].catPos.x, cats[0].catPos.y,
                     cats[1].catPos.x, cats[1].catPos.y);
      if (d > maxLen) {
        broken = true; 
      }
    }
    // At the start, the rope is not broken and then check the distance between the two cats  
// Measure how far apart the two cats are,if the distance is greater than the allowed length, the rope breaks  
 }


  void rDisplay() {
    
 if (!broken) { // Only draw the rope if it has not broken
      stroke(0);
      strokeWeight(2);
      line(cats[0].catPos.x, cats[0].catPos.y,
           cats[1].catPos.x, cats[1].catPos.y);
      noStroke();
    }
  }
}
