class ShotgunButton extends Button
{
   static final String shotgunIcon = "sprites/shotgunImage.png";
   
   PImage shotgunImage = loadImage(shotgunIcon);
   int price;
  
   ShotgunButton(float x, float y, int w, int h)
   {
      super(x, y, w, h);
      price = Shop.shotgunPrice;
   }
   
   void click(Player player)
   {
      if (player.currency >= price)
      {
         player.currency -= price;
         player.weapon = new Shotgun(player);
      }
   }
   
   void show()
   {
      push();
      fill(255, 255, 255, 150);
      rect(x, y, w + 80, h);
      shotgunImage.resize(w, h);
      image(shotgunImage, x, y);
      pop();
      push();
      textSize(20);
      text("" + price + "€", x + w + 40, y + h - 22);
      pop();
   }
}
