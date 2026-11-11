Spaceship ship;
Star[] stars = new Star[100];
boolean thrusting = false;
//your variable declarations here
public void setup() 
{
  size(800, 600);
  ship = new Spaceship(); //initialization
  for(int i = 0; i < stars.length; i++)
  {
    stars[i] = new Star();
  }
  //your code here
}

public void keyPressed()
{
  if(key == 'a' || key == 'A')
  {
    ship.turn(-10);
  }
  
  if(key == 'd' || key == 'D')
  {
    ship.turn(10);
  }
  
  if(key == 'w' || key == 'W')
  {
    thrusting = true;
    ship.accelerate(0.02);
  }
  
  if(key == 's' || key == 'S')
  {
    ship.accelerate(-0.02);
  }
  
  if(key == 'h' || key == 'H')
  {
    ship.hyperspace();
  }
  
  if(key == ' ')
  {
    ship.stopShip();
  }
}

public void keyReleased()
{
  if(key == 'w' || key == 'W')
  {
    thrusting = false;
  }
}
public void draw() 
{
  background(4, 3, 22);
  
  for(int i = 0; i < stars.length; i++)
  {
    stars[i].show();
    
    ship.thrusting = thrusting;
    ship.move();
    ship.show();
  }
  //your code here
}

