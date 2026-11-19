class Asteroid extends Floater
{
  private double myRotationSpeed;
  private int[] craterX;
  private int[] craterY;
  private int[] craterSize;
  
  public Asteroid()
  {
    craterX = new int[5];
    craterY = new int[5];
    craterSize = new int[5];

    for(int i = 0; i < 5; i++)
    {
      craterX[i] = (int)(Math.random() * 30) - 15;
      craterY[i] = (int)(Math.random() * 30) - 15;
      craterSize[i] = (int)(Math.random() * 8) + 3;
    }
    corners = 10;
    
    int size = (int)(Math.random() * 20) + 20;

    //xCorners = new int[]{20, 10, -5, -20, -30, -15, -25, -10, 5, 25};
    //yCorners = new int[]{0, 15, 25, 15, 0, -15, -25, -30, -20, -10};
    
    
    corners = 12;

    xCorners = new int[corners];
    yCorners = new int[corners];

    for(int i = 0; i < corners; i++)
    {
        double angle = i * (2 * Math.PI / corners);
        int radius = (int)(Math.random() * 20) + 15;

        xCorners[i] = (int)(radius * Math.cos(angle));
        yCorners[i] = (int)(radius * Math.sin(angle));
     }

    myColor = color(120, 120, 120);

    myCenterX = Math.random() * width;
    myCenterY = Math.random() * height;

    myXspeed = Math.random() * 4 - 2;
    myYspeed = Math.random() * 4 - 2;

    myPointDirection = Math.random() * 360;

    myRotationSpeed = Math.random() * 6 - 3;
  }
  
  public void show()
  {  

  fill(myColor);
  stroke(myColor);

  translate((float)myCenterX, (float)myCenterY);

  float dRadians = (float)(myPointDirection * (Math.PI / 180));
  rotate(dRadians);

  beginShape();
  for(int i = 0; i < corners; i++)
  {
    vertex(xCorners[i], yCorners[i]);
  }
  endShape(CLOSE);

  // Craters
  //fill(80);
  //ellipse(-8, -5, 8, 8);

  //fill(100);
  //ellipse(10, 5, 6, 6);

  //fill(60);
  //ellipse(0, -12, 5, 5);
  
  for(int i = 0; i < craterX.length; i++)
{
  fill(90);
  ellipse(
    craterX[i],
    craterY[i],
    craterSize[i],
    craterSize[i]
  );
}

  rotate(-dRadians);
  translate(-(float)myCenterX, -(float)myCenterY);
  
  for(int i = 0; i < craterX.length; i++)
  {
    fill(90);
    ellipse(
      craterX[i],
      craterY[i],
      craterSize[i],
      craterSize[i]
    );
  }
}

  public void move()
  {
    super.move();
    turn(myRotationSpeed);
  }

  public double getX()
  {
    return myCenterX;
  }

  public double getY()
  {
    return myCenterY;
  }
}
