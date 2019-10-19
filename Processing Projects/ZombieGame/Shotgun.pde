class Shotgun extends Weapon
{
   static final String shotgunLeft = "sprites/shotgunLeft.png";
   static final String shotgunRight = "sprites/shotgunRight.png";
   static final int shotgunW = 20;
   static final int shotgunH = 20;
   static final int shotgunPower = 40;
   static final int shotgunAmmo = 24;
  
   Shotgun(Player player) 
   { 
      super(0, 0, shotgunW, shotgunH, shotgunPower, shotgunAmmo, player);
      update();
      setSprite();
   }
   
   void setSprite()
   {
      if (direction == 1) sprite = loadImage(shotgunRight);
      else if (direction == -1) sprite = loadImage(shotgunLeft);
   }
   
   String name() { return "Shotgun"; }
}
