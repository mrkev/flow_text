
class Particle {
  float life, maxLife, lifeRate;
  PVector location;
  color fill_color;
  
  Particle () {
    get_spawn_point();
    
    maxLife = 1.8;
    life = random(maxLife * 0.8, maxLife);
    lifeRate = random(0.01, 0.015);
    
    fill_color = color(FORE_COLOR);
    
  }
  
  void update() {
    float noise_scale = 0.01;
    float angle = noise(location.x * noise_scale, 
                        location.y * noise_scale) * TWO_PI;
    
    PVector vel = PVector.fromAngle(angle);
    location.add(vel);
    life -= lifeRate;
                      
  }
  
  void display() {
    //fill(34,84,109);
    //fill(fill_color);
    //float r = life * .9;
    Color java_color = new Color(fill_color);
    
    //stroke(random(0.0, 1.0) > 0.5 ? fill_color : java_color.darker().getRGB());
    stroke(fill_color);
    strokeWeight(0.75);
    point(location.x, location.y); 
  }
  
  void get_spawn_point() {
    while (location == null || !is_on_foreground())
      this.location = new PVector(random(width), random(height));
  }
  
  boolean is_on_foreground() {
    return color_distance(pg.get(int(location.x), int(location.y)), FORE_COLOR) < .1;
  }
}
void mouseClicked() {
  save("diagonal.tif");
}
