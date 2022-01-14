int[][] result;
float t, c;

float ease(float p) {
  return 3*p*p - 2*p*p*p;
}

float ease(float p, float g) {
  return 1 - 0.8 * pow(2*(1 - p), g);
}

float mn = .5*sqrt(.6), ia = atan(sqrt(.8));

float c01(float g) {
  return constrain(g, 0, 1);
}

//////////////////////////////////////////////////////////////////////////////

int numFrames = 150;       

void setup() {
  size(750, 750, P3D);
  rectMode(CENTER);
  pixelDensity(2);
  result = new int[width*height][3];
  fill(32);
  blendMode(EXCLUSION);
  noStroke();
}

color[] cs = { #ff0000, #00ff00, #0000ff};
// interesting on black background:
//color[] cs = { #ffff00, #00ffff, #ff00ff}; 

float x, y, z, tt;
int N = 10;
int L = 12;
float r = 10, sp = 1.2*r;

float shift, dd, rot;

void draw() {
  background(0);
  push();
  translate(width/2, height/2);  
  
  t = (millis()/(20.0*numFrames))%1;
  
  // loops through RGB
  for (int a=0; a<3; a++) {
    fill(cs[a]);
    
    // draws dots horizontally
    for (int i=-N; i<N; i++) {
      // draws dots vertically
      for (int j=-N; j<N; j++) {
        x = (i+.5)*L;
        y = (j+.5)*L;
        
        // dots row offset, changing grid shape
        if (j%2 != 0)
          x += 0.5*sp;

        // dd creates the ripple effect, so dots move asynchronously
        dd = dist(x, y, 0, 0)/160.0;
        
        // 'a' offsets the colors
        tt = 2 * t - dd + 0.02*a;
        
        // how much to move the dots by
        shift = lerp(1, 0.9, ease(map(cos(TWO_PI*tt), 1, -1, 0, 1), 3));
        
        push();
        translate(x*shift, y*shift);
        ellipse(6, 6, 6, 6);
        pop();
      }
    }
  }
  pop();
}
