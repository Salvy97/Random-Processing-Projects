class ZombieEasy extends Enemy
{
   static final String zombieEasyLeft = "sprites/zombieEasyLeft.png";
   static final String zombieEasyRight = "sprites/zombieEasyRight.png";
   
   PImage leftSprite = loadImage(zombieEasyLeft);
   PImage rightSprite = loadImage(zombieEasyRight);
  
   ZombieEasy(float x, float terrainHeight)
   {
      super(x, terrainHeight, 40, 5);
      sprite = loadImage(zombieEasyLeft);
   }
   
   void setSprite()
   {
      if (direction == -1) sprite = leftSprite;
      else if (direction == 1) sprite = rightSprite;
   }
   
   int loot() { return 100; }
}
