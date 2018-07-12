// The little emoji face moves with the mouse. bv

//colors
color yellow = color(255,255,0);
color white = color(255,255,255);
color black = color(0,0,0);
//face properties
float face_diameter = 300;
float eye_diameter = face_diameter/3.8;
float face_locationX, face_locationY;

void settings(){
  size(displayWidth/2, displayHeight - displayHeight/28);
}
void setup(){
  background(0);
}
void draw(){
  background(0);
  getFaceLocation();
  drawFace(face_locationX, face_locationY, face_diameter, eye_diameter);
}

boolean MouseIsOnScreen(){
  if (mouseX > 1 && mouseX < width - 1 && 
      mouseY > 1 && mouseY < height - 1)
  {return true;}
  else{return false;}
}
void getFaceLocation(){
  if (MouseIsOnScreen()){
    face_locationX = mouseX;
    face_locationY = mouseY;
  }
  else{
    face_locationX = width/2;
    face_locationY = height/2;
  }
}

void drawFace(float face_locationX, float face_locationY, 
              float face_diameter, float eye_diameter)
{ 
  fill(yellow);
  noStroke();
  //face
  ellipse(face_locationX, face_locationY, face_diameter, face_diameter);
  //eyes
  fill(white);
  //left eye
  ellipse(face_locationX - face_diameter/5, 
          face_locationY - face_diameter/10, 
          eye_diameter, eye_diameter);
  fill(black);
  ellipse(face_locationX - face_diameter/5, 
          face_locationY - face_diameter/10, 
          eye_diameter/2, eye_diameter/2);
  //right eye
  fill(white);
  ellipse(face_locationX + face_diameter/5, 
          face_locationY - face_diameter/10, 
          eye_diameter, eye_diameter);
  fill(black);
  ellipse(face_locationX + face_diameter/5, 
          face_locationY - face_diameter/10, 
          eye_diameter/2, eye_diameter/2);
  //mouth
  noStroke();
  arc(face_locationX,
      face_locationY + face_diameter/5,
      face_diameter/2.5,
      face_diameter/2.5, 
      0, PI+QUARTER_PI, OPEN);
}
