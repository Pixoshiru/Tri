int input;
int groupGap;
int numberToTest = 2017;
String inputStr = "";
Group hours = new Group();
Group minutes = new Group();
Group seconds = new Group();
Group testGroup = new Group();
//=========================================== Setup
void setup ()
{
  size (800, 800);
  groupGap = 60;
}

//=========================================== Tester input
void testerInput(){
  numberToTest = int (inputStr);
  stroke(255);
  fill(#ffffff);
  textSize(16);
  textAlign(CENTER, BOTTOM);
  text(":: input number ::", width/2, height/2 + 3*groupGap - 20);
  text(inputStr, width/2, height/2 + 3*groupGap);
  //text(numberToTest, 20, height - 5);
}

//=========================================== Tester display
void testerDisplay()
{
  int step = 1;
  input = numberToTest;
  if (input == 0)//edge case
  {
    testGroup.display(0, step, width/2, height/2 + 4*groupGap);
  }
  for (int i = 1; i <= input; i=i*3)
  {
    println(step);
    int code = (input % (i*3))/i;
    testGroup.display(code, step, width/2, height/2 + 4*groupGap);
    step++;
  }
}

//=========================================== Hours
void hoursGroup()
{
  int step = 1;
  input = hour();
  if (input == 0)//edge case
  {
    hours.display(0, step, width/2, height/2 - groupGap);
  }
  for (int i = 1; i <= input; i=i*3)
  {
    println(step);
    int code = (input % (i*3))/i;
    hours.display(code, step, width/2, height/2 - groupGap);
    step++;
  }
}

//=========================================== Minutes
void minutesGroup()
{
  int step = 1;
  input = minute();//edge case
  if (input == 0)
  {
    minutes.display(0, step, width/2, height/2);
  }
  for (int i = 1; i <= input; i=i*3)
  {
    println(step);
    int code = (input % (i*3))/i;
    minutes.display(code, step, width/2, height/2);
    step++;
  }
}

//=========================================== Seconds
void secondsGroup()
{
  int step = 1;
  input = second();
  if (input == 0)//edge case
  {
    seconds.display(0, step, width/2, height/2 + groupGap);
  }
  for (int i = 1; i <= input; i=i*3)
  {
    println(step);
    int code = (input % (i*3))/i;
    seconds.display(code, step, width/2, height/2 + groupGap);
    step++;
  }
}

//=========================================== HUD
void HUD()
{
  stroke(120);
  line(width/2 - 100, height/2 - 40, width/2 + 100, height/2 - 40);
  line(width/2 - 100, height/2 + 20, width/2 + 100, height/2 + 20);
  line(width/2 - 100, height/2 + 3*groupGap - 20, width/2 + 100, height/2 + 3*groupGap - 20);
}

//=========================================== Keyboard listener
void keyPressed() {
  if (key == BACKSPACE) {
    if (inputStr.length() > 0) {
      inputStr = inputStr.substring(0, inputStr.length()-1);
    }
  } else if (textWidth(inputStr+key) < width) {
    inputStr = inputStr + key;
  } else if (key == ENTER) {
    testerDisplay();
  }
}

//=========================================== Draw
void draw()
{
  frameRate(30);
  background (#323242);
  HUD();
  testerInput();
  hoursGroup();
  minutesGroup();
  secondsGroup();
  testerDisplay();
}
