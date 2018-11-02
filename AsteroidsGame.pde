Spaceship ship;
Star[] s;
boolean isAccelerating = false;
boolean isTurningLeft = false;
boolean isTurningRight = false;
boolean isHyperspace = false;

public void setup(){
	size(500,500);
  	ship = new Spaceship();
  	s = new Star[100];
  	for(int i = 0; i < s.length; i++){
  		s[i] = new Star();
  	}
}

public void draw(){
	background(0);
	for(int i = 0; i < s.length; i++){
		s[i].show();
	}
    ship.show();
    ship.move();
    if(isAccelerating == true){
    	ship.accelerate(.1);
    }
    if(isTurningLeft == true){
    	ship.turn(-5);
    }
    if(isTurningRight == true){
    	ship.turn(5);
    }
    if(isHyperspace == true){
 		background(0);
 		for(int i = 0; i < s.length; i++){
 			stroke(255);
 			s[i].show();
 		}
    	ship.myCenterX = (int)(Math.random()*width);
 		ship.myCenterY = (int)(Math.random()*height);
 		ship.setPointDirection((int)(Math.random()*360));
 		ship.setDirectionX(0);
 		ship.setDirectionY(0);
 	}
}

public void keyPressed(){
	if(key == 'w'){
		isAccelerating = true;
	}
	if(key == 'a'){
		isTurningLeft = true;
	}
	if(key == 'd'){
		isTurningRight = true;
	}
	if(key == 'e'){
		isHyperspace = true;
	}
	
}

public void keyReleased(){
	if(key == 'w'){
		isAccelerating = false;
	}
	if(key == 'a'){
		isTurningLeft = false;
	}
	if(key == 'd'){
		isTurningRight = false;
	}
	if(key == 'e'){
		isHyperspace = false;
	}
}