Spaceship ship;
Star[] stars = new Star[100];

boolean thrusting = false;

ArrayList<Asteroid> asteroids;

public void setup()
{
  size(800, 600);

  ship = new Spaceship();

  for(int i = 0; i < stars.length; i++)
  {
    stars[i] = new Star();
  }

  asteroids = new ArrayList<Asteroid>();

  for(int i = 0; i < 5; i++)
  {
    asteroids.add(new Asteroid());
  }
}

public void draw()
{
  background(4, 3, 22);

  // stars
  for(int i = 0; i < stars.length; i++)
  {
    stars[i].show();
  }

  // ship
  ship.thrusting = thrusting;
  ship.move();
  ship.show();

  // asteroids
  for(int i = asteroids.size() - 1; i >= 0; i--)
  {
    Asteroid a = asteroids.get(i);

    float distance = dist(
      (float)ship.getX(),
      (float)ship.getY(),
      (float)a.getX(),
      (float)a.getY()
    );

    if(distance < 20)
    {
      asteroids.remove(i);
    }
    else
    {
      a.move();
      a.show();
    }
  }
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
    ship.accelerate(0.05);
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
