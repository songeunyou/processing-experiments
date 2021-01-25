void setup() {
  size(500, 500);
  stroke(255,100,100);
}

float t = 0;

void draw() {
  background(255);
  
  beginShape();
  
  for (float theta = 0; theta <= 20 * PI; theta += 0.01) {
    float x = 10*sin(t)*cos(-t+theta) + height/2;
    float y = theta*10 + width/2 + 20;
    vertex(x, y);
  }
  stroke(0,0,0);
  noFill();
  
  endShape();
  
  for (float i = 0; i <= PI; i += PI) {
    beginShape();
    
    for (float theta = 0; theta <= 20 * PI; theta += 0.01) {
      float x = 30*cos((theta-i)/3 + t)/(sin(theta)+1.2) + height/2;
      float y = 30*(abs(cos(theta)) + sin(theta)) + width/2;
      vertex(x, y);
    }
    fill(255,120,80);
    
    endShape();
  }
  
  t += 0.03;
}
