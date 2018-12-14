Spaceship ship;
Star[] s;
ArrayList <Asteroid> a;
ArrayList <Bullet> b;
boolean isAccelerating = false;
boolean isTurningLeft = false;
boolean isTurningRight = false;
boolean isHyperspace = false;
boolean inv = true;
boolean win,win2,level1,level2,level3 = false;

int lives,score,bullets,hyperspace,asize;

public void setup(){
	size(500,500);
	lives = 3;
	score = 0;
	hyperspace = 5;
  	ship = new Spaceship();
  	s = new Star[150];
  	a = new ArrayList <Asteroid>();
  	b = new ArrayList <Bullet>();
  	bullets = 30;
  	level1 = true;

	for(int j = 0; j < 15; j++){
		a.add(new Asteroid());
	}
	
  	for(int i = 0; i < s.length; i++){
  		s[i] = new Star();
  	}
}

public void draw(){
	background(0);
	ship.show();
    ship.move();
    
    if(inv == true){
    	noFill();
    	stroke(60, 252, 249);
    	ellipse(ship.getX(),ship.getY(),40,40);
    }

	   asize = a.size();
	   for(int k = 0; k < b.size(); k++){
			b.get(k).show();
			b.get(k).move();
		}

			
	for(int i = 0; i < s.length; i++){
		s[i].show();
	}
	for(int j = 0; j < a.size(); j++){
		a.get(j).show();
		a.get(j).move();
		float d = dist(ship.getX(),ship.getY(),a.get(j).getX(),a.get(j).getY());
		if(d < 20 && inv == false){
			a.remove(j);
			score+=10;
			lives-=1;
		}
	}
	fill(255);
	textSize(30);
	textAlign(CENTER);
	text("Lives: "+lives,150,30);
	text("Score: "+score,350,30);
	textSize(20);
	text("Bullets: "+bullets,50,450);
	text("Hyperspaces: "+hyperspace,75,470);

	if(a.size() < 1){
	 	fill(255);
	 	textSize(20);
	 	textAlign(CENTER);
	 	text("Good job",250,400);
	 	text("Click to play again",250,450);
	 	win = true;
	 }
	if(win == true){
		level2 = true;
	}
	if(win == true && level2 == true){
		level3 = true;
		level2 = false;
	}

	if(lives < 1){
		fill(0);
		background(0);
		fill(255);
		textSize(50);
		textAlign(CENTER);
		text("Game Over",250,210);
		text("Click to play again",250,260);
	}

	   if(isAccelerating == true){
	    ship.accelerate(.025);
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
	 for(int n = 0; n < b.size(); n++){
	 	for(int m = 0; m < a.size(); m++){
	 		float dB = dist(b.get(n).getX(),b.get(n).getY(),a.get(m).getX(),a.get(m).getY());
	 		if(dB < 20){
	 			a.remove(m);
	 			b.remove(n);
	 			score+=20;
	 			break;
	 		}
	 	}
	}
}


public void keyPressed(){
	if(key == 'w'){
		isAccelerating = true;
		inv = false;
	}
	if(key == 'a'){
		isTurningLeft = true;
		inv = false;
	}
	if(key == 'd'){
		isTurningRight = true;
		inv = false;
	}
	if(key == 'e' && hyperspace > 0){
		isHyperspace = true;
		hyperspace = hyperspace - 1;
	}
	if(key == ' ' && bullets > 0){
		inv = false;
		b.add(new Bullet());
		bullets = bullets - 1;
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
		if(key == 'w' || key == 'a' || key == 'd' || key == ' '){
			inv = false;
		}else{
			inv = true;
		}
	}
	
}
public void mousePressed(){
	if(lives < 1 || a.size() < 1){
		lives = 3;
		score = 0;
		hyperspace = 5;
		inv = true;
		ship.myCenterX = ship.myCenterY = 250;
		ship.setPointDirection(0);
		ship.setDirectionX(0);
	 	ship.setDirectionY(0);
	 	if(level1 == true){	
	 		bullets = 30;
	 		for(int j = 0; j < 15 - asize; j++){
	 			a.add(new Asteroid());
	 		}
		}
	
		if(level2 == true){
			bullets = 45;
		 	for(int j = 0; j < 30 - asize; j++){
		 		a.add(new Asteroid());
		 	}
		}
		if(level3 == true){
			bullets = 60;
		 	for(int j = 0; j < 45 - asize; j++){
		 		a.add(new Asteroid());
		 	}
		}
		redraw();
	}
}
