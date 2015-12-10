SpaceShip Ship;
Particle[] Star;
boolean wPressed = false;
boolean aPressed = false;
boolean sPressed = false;
boolean dPressed = false;//your variable declarations here
public void setup() 
{
  size(800, 800);

  Star = new Particle[500];
  for(int p = 0; p < Star.length; p++)
  {
  	Star[p] = new Particle();//  ----------------------finish background of star and the key pressed functions
  }
  Ship = new SpaceShip();
  //your code here
}
public void draw() 
{
  background(0, 0, 0, 0);
  println(wPressed);
  if(wPressed == true)//foreward
  {
    Ship.accelerate(0.075);
  }
  if(aPressed == true)//left
  {
  	Ship.rotate(-5);
  }
  if(dPressed == true)//right
  {
  	Ship.rotate(5);
  }
  if(sPressed == true)//backward
  {
  	Ship.accelerate(-0.075);
  }
  for(int p = 0; p < Star.length; p++)
  {
  	Star[p].show();
  }
  Ship.show();
  Ship.move();//your code here
}
class SpaceShip extends Floater  
{ 
  
  public void setX(int x) 
  {
    myCenterX = x;
  }
  public int getX(){return (int)myCenterX;}
  public void setY(int y)
  {
    myCenterY = y;
  }
  public int getY(){return (int)myCenterY;} 
  public void setDirectionX(double x)
  {
    myDirectionX = x;
  }
  public double getDirectionX(){return myDirectionX;}
  public void setDirectionY(double y)
  {
    myDirectionY = y;
  }
  public double getDirectionY(){return myDirectionY;}
  public void setPointDirection(int degrees)
  {
   myPointDirection = degrees;
  }
  public double getPointDirection(){return myPointDirection;}
  public SpaceShip()
  {
    //stuff for the spaceship
    myCenterX = 400;
    myCenterY = 400;
    myDirectionX = 0;
    myDirectionY = 0;
    myPointDirection = 0;
    //stuff to move the ship
    

    corners = 13;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = 8 * 3;
    yCorners[0] = 0 * 3;
    xCorners[1] = 2 * 3;
    yCorners[1] = 2 * 3;
    xCorners[2] = 0 * 3;
    yCorners[2] = 3 * 3;
    xCorners[3] =-1 * 3;
    yCorners[3] = 4 * 3;
    xCorners[4] = 1 * 3;
    yCorners[4] = 5 * 3;
    xCorners[5] =-2 * 3;
    yCorners[5] = 6 * 3;
    xCorners[6] =-4 * 3;
    yCorners[6] = 4 * 3;
    xCorners[7] =-4 * 3;
    yCorners[7] =-4 * 3;
    xCorners[8] =-2 * 3;
    yCorners[8] =-6 * 3;
    xCorners[9] = 1 * 3;
    yCorners[9] =-5 * 3;
    xCorners[10]=-1 * 3;
    yCorners[10]=-4 * 3;
    xCorners[11]= 0 * 3;
    yCorners[11]=-3 * 3;
    xCorners[12]= 2 * 3;
    yCorners[12]=-2 * 3;

    bCorners = 4;
    xBCorners = new int[bCorners];
    yBCorners = new int[bCorners];
    xBCorners[0] =-4 * 3;
    yBCorners[0] = 3 * 3;
    xBCorners[1] =-5 * 3;
    yBCorners[1] = 2 * 3;
    xBCorners[2] =-5 * 3;
    yBCorners[2] =-2 * 3;
    xBCorners[3] =-4 * 3;
    yBCorners[3] =-3 * 3;

    // finish making spaceship design
  }//your code here
}
class Particle
{
	float xPos, yPos, pSize;
	Particle()
	{
	  	xPos = (float)(Math.random()*800);
	  	yPos = (float)(Math.random()*800);
	  	pSize = 0.75;	
	}
	public void show()
	{
		fill(255, 255, 255);
		noStroke();
		ellipse(xPos, yPos, pSize, pSize);
	}
}
//moving the ship
public void keyPressed()
{
  if(keyCode == 'W' || keyCode == UP)
  {
    wPressed = true;
  }
  if(keyCode == 'A' || keyCode == LEFT) 
  {
    aPressed = true;  
  }
  if(keyCode == 'S' || keyCode == DOWN)
  {
    sPressed = true;
  }
  if(keyCode == 'D' || keyCode == RIGHT)
  {
    dPressed = true;
  }
}
public void keyReleased()
{
  if(keyCode == 'W' || keyCode == UP)
  {
    wPressed = false;
  }
  if(keyCode == 'A' || keyCode == LEFT) 
  {
    aPressed = false;  
  }
  if(keyCode == 'S' || keyCode == DOWN)
  {
    sPressed = false;
  }
  if(keyCode == 'D' || keyCode == RIGHT)
  {
    dPressed = false;
  }
}

abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;  

  protected int bCorners;
  protected int[] xBCorners;
  protected int[] yBCorners;

  protected int cCorners;
  protected int[] xCCorners;
  protected int[] yCCorners;
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(46, 92, 184);   
    strokeWeight(0.25);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);

    fill(77, 77, 255);  
    beginShape();         
    for(int nI = 0; nI < bCorners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xBCorners[nI]* Math.cos(dRadians)) - (yBCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xBCorners[nI]* Math.sin(dRadians)) + (yBCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE); 
  }   
} 

