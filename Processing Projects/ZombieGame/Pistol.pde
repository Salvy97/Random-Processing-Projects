class Pistol extends Weapon
{
   static final String pistolLeft = "sprites/pistolLeft.png";
   static final String pistolRight = "sprites/pistolRight.png";
   static final int pistolW = 20;
   static final int pistolH = 20;
   static final int pistolPower = 10;
   static final int pistolAmmo = 24;
  
   Pistol(Player player) 
   { 
      super(0, 0, pistolW, pistolH, pistolPower, pistolAmmo, player);
      update();
      sprite = loadImage(pistolRight);
   }
   
   void setSprite()
   {
      if (player.direction == 1) sprite = loadImage(pistolRight);
      else if (player.direction == -1) sprite = loadImage(pistolLeft);
   }
   
   String name() { return "Pistol"; }
}
