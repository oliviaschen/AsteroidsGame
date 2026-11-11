class Star //note that this class does NOT extend Floater
{
  private int x; 
  private int y;
  private int size;
  
  public Star()
  {
    x = (int)(Math.random() * width);
    y = (int)(Math.random() * height);
    size = (int)(Math.random() * 3) + 1;
  }
  
  public void show()
  {
    noStroke();
    fill(255);
    ellipse(x, y, size, size);
  }
}
