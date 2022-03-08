// assign varibles
final float SOLDIER_W = 80;
final float SOLDIER_H = 80;
final float ROBOT_W = 80;
final float ROBOT_H = 80;
final float LAZOR_DEV = 25;
final float LAZOR_MAX = 40;

PImage bgImg, groundHog, life, robot, soil, soldier;
float soldierX, soldierY, soldierSpeed;
float robotX, robotY;
float lazorStart, lazorEnd, lazorY, lazorSpeed;

void setup() {
  size(640, 480, P2D);
  // Enter Your Setup Code Here
  // load images
  bgImg = loadImage("img/bg.jpg");
  groundHog = loadImage("img/groundhog.png");
  life = loadImage("img/life.png");
  robot = loadImage("img/robot.png");
  soil = loadImage("img/soil.png");
  soldier = loadImage("img/soldier.png");
  
  // init robot
  robotY = 160+80*(floor(random(4)));
  robotX = random(160,width-ROBOT_W);
  lazorStart = robotX+LAZOR_DEV;
  lazorEnd = lazorStart;
  lazorY = robotY+37;
  lazorSpeed = 2;
  
  // init soldier
  soldierY = 160+80*(floor(random(4)));
  soldierX = floor(random(width/2 - SOLDIER_W/2)+1);
  soldierSpeed = random(5);
}

void draw() {
	// Enter Your Code Here
  // set up background
  image(bgImg, 0, 0, width, height);
  image(soil, 0, 160, width, 320);
  
  // draw the sun and grass
  colorMode(RGB);
  noStroke();
  fill(124, 204, 25);
  rectMode(CORNERS);
  rect(0, 145, width, 160);  
  
  stroke(255, 255, 0);
  strokeWeight(5);
  fill(253, 184, 19);
  ellipse(width-50, 50, 120, 120);
  
  // set up other images
  image(groundHog, 280, 80, 80, 80);
  image(life, 10, 10, 50, 50);
  image(life, 80, 10, 50, 50);
  image(life, 150, 10, 50, 50);
  
  // set up the running motion of soldier
  soldierX += soldierSpeed;
  
  // check the soldier
  if(soldierX>width){
    soldierX = -SOLDIER_W;
  }
  
  image(soldier, soldierX, soldierY, SOLDIER_W, SOLDIER_H);
  
  // set up the robot
  image(robot, robotX, robotY, ROBOT_W, ROBOT_H);
  
  // set up the lazor
  lazorEnd -= lazorSpeed;
  
  if(robotX-lazorEnd>LAZOR_MAX-LAZOR_DEV){
    if(robotX-lazorEnd>160){
    lazorEnd = robotX+LAZOR_DEV;
    }
    lazorStart = lazorEnd+LAZOR_MAX;
  }else{
    lazorStart = robotX+LAZOR_DEV;
  }
  
  colorMode( RGB );
  stroke( 255, 0, 0 );
  strokeWeight(10);
  line( lazorStart, lazorY, lazorEnd, lazorY);
}
