class Player extends Entity
{
   static final String playerLeft = "sprites/playerLeft.png";
   static final String playerRight = "sprites/playerRight.png";
   static final int playerW = 40;
   static final int playerH = 80;
   
   PImage spriteLeft = loadImage(playerLeft);
   PImage spriteRight = loadImage(playerRight);
   int currency;
   Weapon weapon;
  
   Player(float terrainHeight)
   {
      super(width / 2, height - terrainHeight - playerH, playerW, playerH, 2, 100);
      sprite = loadImage(playerRight);
      currency = 0;
      weapon = new Pistol(this);
   }
   
   void update(Terrain terrain)
   {
      if (!collision(terrain))
      {
        this.fallVelocity += gravity; 
        this.y += fallVelocity; 
      }
      else fallVelocity = 0; 
      this.x += speed * direction;
      weapon.update();
   }
   
   void setSprite()
   {
      if (direction == 1) sprite = spriteRight;
      else if (direction == -1) sprite = spriteLeft;
   }
   
   void pushEntity(float pushF)
   {
      this.x += pushF;
      this.weapon.pushEntity(pushF);
   }
   
   void show()
   {
      setSprite();
      push();
      sprite.resize(w, h);
      image(sprite, x, y);
      weapon.show();
      pop();
   }
}
