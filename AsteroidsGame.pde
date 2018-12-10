Spaceship ship;
Star[] s;
ArrayList<Asteroid>a;
ArrayList<Bullet>b;
boolean isAccelerating = false;
boolean isTurningLeft = false;
boolean isTurningRight = false;
boolean isHyperspace = false;
int lives,score,bullets;

public void setup(){
	size(500,500);
	lives = 3;
	score = 0;
	bullets = 30;
  	ship = new Spaceship();
  	s = new Star[150];
  	a = new ArrayList<Asteroid>();
  	b = new ArrayList<Bullet>();
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
		if(d < 20){
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

	if(a.size() < 1){
 		fill(255);
 		textSize(20);
 		textAlign(CENTER);
 		text("Good job",250,400);
 		text("Click to play again",250,450);
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
	if(key == ' ' && bullets > 0){
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
	}
}
public void mousePressed(){
	if(lives < 1 || a.size() < 1){
		lives = 3;
		score = 0;
		bullets = 30;
		ship.myCenterX = ship.myCenterY = 250;
		ship.setPointDirection(0);
		ship.setDirectionX(0);
	 	ship.setDirectionY(0);
	 	for(int i = 0; i < a.size(); i++){
	 		a.remove(i);
	 	}
	 	for(int j = 0; j < 15; j++){
	 		a.add(new Asteroid());
	 	}
		redraw();
	}
}
