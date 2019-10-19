class Bullet extends Entity
{
   static final int bulletW = 5;
   static final int bulletH = 2;
   static final float bulletSpeed = 8;
   
   Bullet(Weapon weapon)
   {
      super(weapon.x, weapon.y, bulletW, bulletH, bulletSpeed, 0);
      this.direction = weapon.direction;
   }
   
   void update()
   {
      if (direction == 1) this.x += this.speed;
      if (direction == -1) this.x -= this.speed;
   }
   
   void show()
   {
      ellipse(x, y, w, h); 
   }
}
