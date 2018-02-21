int rows;
int cols;
int scl = 5;
int w = 1800;
int h = 2600;
float[][] terrain;
float flying = 0;

void setup() {
  size(800, 800, P3D);
  cols = w /scl;
  rows = h /scl;
  terrain = new float [cols][rows];
}

void draw() {
  flying -= 0.1;
  float yoff = flying;
  for (int y = 0; y < rows; y++) {
    float xoff = 0;
    for (int x = 0; x < cols; x++) {
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -100, 100);
      xoff += 0.02;
    }
    yoff += 0.02;
  }

  background(0);

  noStroke();
  fill(50, 150, 50);
  lights();
  translate(width/2, height/2+500, -500);
  translate(-w/2, -h/2);
  rotateX(0.7);

  for (int y = 0; y < rows-1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++) {
      vertex(x*scl, y*scl, terrain[x][y]);
      vertex(x*scl, (y+1)*scl, terrain[x][(y+1)]);
    }
    endShape();
  }
  //translate(0,0,-10);
  //fill(0,0,255);
  //rect(0,0,1200,2400);
}