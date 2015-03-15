import java.awt.Color;
// pair sudo
//color FORE_COLOR = color(0, 99, 130);
//color BACK_COLOR = color(228, 229, 173);

// pair rm-rf
//color FORE_COLOR = color(217, 208, 193);
//color BACK_COLOR = color(31, 30, 38);

// pair grep
//color FORE_COLOR = color(159, 191, 173);
//color BACK_COLOR = color(112, 109, 123);

// pair less
//color BACK_COLOR = color(99, 96, 106);
//color FORE_COLOR = color(216, 197, 79);

// pair scp
//color BACK_COLOR = color(89, 82, 65);
//color FORE_COLOR = color(172, 207, 204);

// pair ssh
color BACK_COLOR = color(16, 34, 43);
color FORE_COLOR = color(189, 214, 132);

int max_particles = 1023;
int total_particles = 10000;
ArrayList <Particle> particles = new ArrayList <Particle> ();
PGraphics pg;

void setup () { 
  smooth(8);
  size(1280, 720, P2D);  
  pg = createGraphics(width, height, JAVA2D);
  pg.beginDraw();
  pg.textSize(500);
  pg.background(BACK_COLOR);
  pg.fill(FORE_COLOR);
  int r = 60;
  pg.text("ssh", 32, height/2 + 198);
  pg.endDraw();  
  background(BACK_COLOR);
  
  //image(pg, 0, 0);
  
}



void draw () {
  while (particles.size() < max_particles && total_particles > 2) {
    particles.add(new Particle()); 
  }
  
  for (int i = particles.size()-1; i >=0; i--) {
    if (particles.get(i).life <= 0) {
      particles.remove(i);
      if (total_particles > 0) particles.add(new Particle());
      total_particles--;
      continue;
    }
    particles.get(i).update();
    particles.get(i).display();
  }
  
}


void mousePressed() {
  print(mouseX + " " + mouseY);
}



float color_distance( int colour1, int colour2 ) 
{

  int currR = (colour1 >> 16) & 0xFF; 
  int currG = (colour1 >> 8) & 0xFF;
  int currB = colour1 & 0xFF;

  int currR2 = (colour2 >> 16) & 0xFF; 
  int currG2 = (colour2 >> 8) & 0xFF;
  int currB2 = colour2 & 0xFF;

  int distance  = 0;
  distance += Math.pow(currR - currR2, 2);
  distance += Math.pow(currG - currG2, 2);
  distance += Math.pow(currB - currB2, 2);
    
  return dist(currR, currG, currB, currR2, currG2, currB2) / 441.67294;
}

