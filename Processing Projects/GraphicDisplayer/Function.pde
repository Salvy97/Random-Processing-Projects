class Function
{
   ArrayList<Point> points;
   String function;
   float max;
   float range;
   FunctionReader functionReader;
   
   Function(String function, float max, float range)
   {
      points = new ArrayList<Point>();
      this.function = function;
      this.max = max;
      this.range = range;
      functionReader = new FunctionReader();
   }
   
   Point findMinimum()
   {
      Point minimumPoint = points.get(0);
      for (int i = 0; i < points.size(); i++)
         if (functionReader.readFunction(function, points.get(i).x) < functionReader.readFunction(function, minimumPoint.x))
           minimumPoint = points.get(i);
      return minimumPoint;
   }

   void execute()
   {
      for (float x = 0.1; x < max; x += range)
         points.add(new Point(x, functionReader.readFunction(function, x), 50, 50));
   }
   
   void executePointByPoint(float x)
   {
      points.add(new Point(x, functionReader.readFunction(function, x), 50, 50));
   }
   
   void show()
   {
      for (int i = 0; i < points.size(); i++)
        points.get(i).show();
      push();
      fill(0);
      strokeWeight(2);
      textAlign(CENTER);
      text("" + functionReader.readFunction(function, findMinimum().x), findMinimum().getXPosition(), findMinimum().getYPosition() + offset); 
      pop();
   }
}
