class Spaceship extends Floater{
	public void setX(int x) {myCenterX = x;}
	public int getX() {return (int)myCenterX;}
	public void setY(int y) {myCenterY = y;}
	public int getY() {return (int)myCenterY;}
	public void setDirectionX(double x) {myDirectionX = x;}
	public double getDirectionX() {return myDirectionX;}
	public void setDirectionY(double y) {myDirectionY = y;}
	public double getDirectionY() {return myDirectionY;}
	public void setPointDirection(int degrees) {myPointDirection = degrees;}
	public double getPointDirection() {return myPointDirection;}

	private int corners;
	private int fCorners;
	public Spaceship(){
		corners = 4;
		xCorners = new int[corners];
		yCorners = new int[corners];

		xCorners[0] = -10;
		yCorners[0] = -10;
		xCorners[1] = 16;
		yCorners[1] = 0;
		xCorners[2] = -10;
		yCorners[2] = 10;
		xCorners[3] = -4;
		yCorners[3] = 0;

		myColor = 255;

		myCenterX = 250;
		myCenterY = 250;

		myPointDirection = 0;
		
	}
	public void show(){ //Draws the floater at the current position             
    fill(myColor);   
    stroke(myColor);    
    
    //translate the (x,y) center of the ship to the correct position
    translate((float)myCenterX, (float)myCenterY);

    //convert degrees to radians for rotate()     
    float dRadians = (float)(myPointDirection*(Math.PI/180));
    
    //rotate so that the polygon will be drawn in the correct direction
    rotate(dRadians);
    
    //draw the polygon
    beginShape();
    for (int nI = 0; nI < corners; nI++)
    {
      vertex(xCorners[nI], yCorners[nI]);
    }
    endShape(CLOSE);

    if(isAccelerating == true){
    	noStroke();
    	fill(255,100,100);
    	int fCorners = 4;
    	xCorners = new int[fCorners];
    	yCorners = new int[fCorners];
    	xCorners[0] = -15;
    	yCorners[0] = 7;
    	xCorners[1] = 0;
    	yCorners[1] = 0;
    	xCorners[2] = -15;
    	yCorners[2] = -7;
    	xCorners[3] = -10;
    	yCorners[3] = 0;

    	beginShape();
	    for (int nI = 0; nI < corners; nI++)
	    {
	      vertex(xCorners[nI], yCorners[nI]);
	    }
	    endShape(CLOSE);
	    fill(255);
	    corners = 4;
		xCorners = new int[corners];
		yCorners = new int[corners];

		xCorners[0] = -10;
		yCorners[0] = -10;
		xCorners[1] = 16;
		yCorners[1] = 0;
		xCorners[2] = -10;
		yCorners[2] = 10;
		xCorners[3] = -4;
		yCorners[3] = 0;
		beginShape();
	    for (int nI = 0; nI < corners; nI++)
	    {
	      vertex(xCorners[nI], yCorners[nI]);
	    }
	    endShape(CLOSE);

    }
    //"unrotate" and "untranslate" in reverse order
    rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
  }



}
