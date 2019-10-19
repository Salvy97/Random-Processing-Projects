abstract class Button
{
   float x;
   float y;
   int w;
   int h;
  
   Button(float x, float y, int w, int h)
   {
      this.x = x;
      this.y = y;
      this.w = w;
      this.h = h;
   }
   
   boolean isOnButton()
   {
      return mouseX < x + w + 40 && mouseX > x && mouseY > y && mouseY < y + h;
   }
   
   abstract void click(Player player);
   abstract void show();
}
