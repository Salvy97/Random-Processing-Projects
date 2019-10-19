/**To write a function, use "x" to indicate the 'x', the chars "*, /, +, -" to indicate
   moltiplication, division, sum and difference respectively.
   You can use '^' to indicate a power, and 'l' to indicate a natural logarithm. 
   (Remember to write all without spaces and follow the right syntax without weird combinations).
*/

final static float COMPLETE = 400;
final static float POSITIVE_ONLY = 20;

final float offset = COMPLETE;
final float max = 40;

// POINT-BY-POINT DRAW
float x = 0.1;
float range = 0.01;

Function[] functions;

void drawAxis()
{
   // Y-AXIS
   push();
   fill(0);
   line(offset, 0, offset, height);
   textSize(20);
   text("y", offset / 5, offset);
   // X-AXIS
   line(0, height - offset, width, height - offset);
   text("x", width - offset, height - offset / 10);
   pop();
}

void setup()
{
  size(800, 800);
  functions = new Function[]
  {
    new Function("x^2+x+1", max, range),
  };
}

void draw()
{
  background(255);
  drawAxis();
  for (int i = 0; i < functions.length; i++)
  {
    functions[i].executePointByPoint(x);
    functions[i].show();
  }
  x += range;
}
