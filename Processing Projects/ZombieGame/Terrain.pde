class Terrain extends Entity
{
   static final int terrainOffset = 120;
   static final String terrainSprite = "sprites/terrain.png";
   float terrainHeight; 

   Terrain(float terrainHeight)
   {
      super(-terrainOffset, height - terrainHeight, width + terrainOffset * 2, (int)(height - terrainHeight), 0, 0);
      this.terrainHeight = terrainHeight;
      sprite = loadImage(terrainSprite);
   }
  
   void show()
   {
      sprite.resize(w, h);
      image(sprite, x, y);
   }
}
