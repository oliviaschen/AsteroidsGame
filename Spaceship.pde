class Spaceship extends Floater  
{   
    public boolean thrusting = false; 
    
    public Spaceship(){
      corners = 3;
      xCorners = new int[corners];
      yCorners = new int[corners];
      xCorners[0] = -8;
      yCorners[0] = -8;
      xCorners[1] = 16; 
      yCorners[1] = 0; 
      xCorners[2] = -8; 
      yCorners[2] = 8;
      myColor = color(255);
      
      myCenterX = width/2;
      myCenterY = height/2;
      
      myXspeed = 0;
      myYspeed = 0;
      
      myPointDirection = 0;
    }
    
    public void hyperspace()
    {
      myCenterX = Math.random() * width;
      myCenterY = Math.random() * height;
      
      myXspeed = 0;
      myYspeed = 0;
      
      myPointDirection = Math.random() *360;
    }
    
    public void stopShip()
    {
      myXspeed = 0;
      myYspeed = 0;
    }
    
    public void show()
    {
      fill(myColor);
      stroke(myColor);
      
      translate((float)myCenterX, (float)myCenterY);
      
      //converts degrees to radians so ship can rotate correctly
      float dRadians = (float)(myPointDirection* (Math.PI/180)); 
      rotate(dRadians);
      
      beginShape();
      for(int nI = 0; nI < corners; nI++)
      {
        vertex(xCorners[nI], yCorners[nI]);
      }
      endShape(CLOSE);
      
      if(thrusting)
      {
        fill(0, 150, 255);
        stroke(0, 150, 255);
        
        triangle(
        -8, -4,
        -20, 0,
        -8, 4
        );
      }
      
      rotate(-1*dRadians);
      translate(-1*(float)myCenterX, -1*(float)myCenterY);
    }
}
