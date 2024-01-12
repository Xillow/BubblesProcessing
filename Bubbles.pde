ArrayList<Bubble> Bottle = new ArrayList<Bubble>();  
int numOfBubbles = 20;

void setup(){
  size(1920,1080);
  background(255);
  frameRate(120);
  
  for(int i = 0; i < numOfBubbles; i++){
    Bottle.add(new Bubble());       
  }
  
  colorMode(RGB, 255,255,255);
  
  
}

void draw(){
  background(255,255,255);
  
  //For loop spawns the bubbles on screen
  for(int i = 0; i < Bottle.size(); i++)
    Bottle.get(i).update();

  //Places the Grey Rectangle on screen
  fill(177);
  stroke(0);
  strokeWeight(2);
  rect(960 * 0.25, 540 * 0.25, 960 * 1.5, 540 * 1.5);

}

class Bubble{
  float xPos, yPos, extent, yVelocity, sWeight;
  color rgb;
  
  //Sets the initial values of the class
  Bubble(){
    setValues();      
    extent = random(50, 400);
    sWeight = random(5,40);
  }
   
  void update(){
      //Sets the strokeWeight, stroke color, and whether it has Fill
      noFill();
      strokeWeight(sWeight);
      stroke(rgb);
      
      //Creates the Circles each frame        
      circle(xPos, yPos, extent);
  
      //Updates the yPos based on the given Velocity    
      yPos += yVelocity;  
  
      //Calls to reset the values of the circle if the circle is off screen completely
      if(yPos > 1480)
        setValues();
  }
      
  //Sets the values that will be changing when the circles goes completely off screen      
  void setValues(){
       xPos = random(50,1870);
       yPos = -400;
       yVelocity = random(1,5);
       rgb = boolean(int(random(0,2))) ? color(255, 0, 0) : color(0,0,0);
  }    
};

