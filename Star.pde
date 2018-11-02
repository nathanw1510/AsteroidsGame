class Star{
	private int myX, myY;
	public Star(){
		myX = (int)(Math.random()*501);
		myY = (int)(Math.random()*501);
	}
	public void show(){
		stroke(255);
		fill(255);
		ellipse(myX,myY,2,2);
	}
}
