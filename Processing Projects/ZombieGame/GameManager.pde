class GameManager
{
   static final int terrainHeight = 120;
   static final String skySprite = "sprites/sky.png";
  
   PImage sky;
  
   Shop shop;
   Terrain terrain;
   Player player;
   ArrayList<Enemy> enemies;
   ArrayList<Bloodstain> bloodstains;
   
   int enemiesLength;
   int wave;
   
   GameManager()
   {
      sky = loadImage(skySprite);
      shop = new Shop();
      terrain = new Terrain(terrainHeight);
      player = new Player(terrainHeight);
      bloodstains = new ArrayList<Bloodstain>();
      wave = 1;
      enemiesLength = 5;
      spawnEnemies();
   }
   
   void spawnEnemies()
   {
      enemiesLength *= wave;
      enemies = new ArrayList<Enemy>(enemiesLength);
      for (int i = 0; i < enemiesLength; i++)
      {
        float x = random(0, 2);
        if (x <= 1) enemies.add(new ZombieEasy(random(-Terrain.terrainOffset, -10), terrain.terrainHeight));
        else enemies.add(new ZombieEasy(random(width + 10, width + Terrain.terrainOffset), terrain.terrainHeight));
      }
   }
   
   void update()
   {
      terrain.show();
      sky.resize(width, (int)(height - terrain.terrainHeight));
      image(sky, 0, 0);
      for (int i = 0; i < enemies.size(); i++)
      {
         enemies.get(i).update(terrain);
         enemies.get(i).AI(player);
         enemies.get(i).show();
         if (enemies.get(i).hp <= 0 && !enemies.get(i).isDead)
         {
           player.currency += enemies.get(i).loot();
           enemies.get(i).isDead = true;
           bloodstains.add(new Bloodstain(enemies.get(i).x, enemies.get(i).y, enemies.get(i).w, enemies.get(i).h));
         }
         if (enemies.get(i).angle >= 1.5 || enemies.get(i).angle <= -1.5)
           enemies.remove(enemies.get(i));
      }
      if (enemies.isEmpty())
      {
         wave++;
         spawnEnemies(); 
      }
      for (int i = 0; i < bloodstains.size(); i++)
        bloodstains.get(i).show();
      player.update(terrain);
      player.show(); 
   }
   
   void GUI()
   {
      push();
      stroke(255);
      textSize(28);
      textAlign(CENTER);
      text("" + player.currency, width / 2, 48);
      text("Weapon: " + player.weapon.name(), width - 32 * 4, 48);
      text("Ammo: " + player.weapon.ammo, width - 32 * 3, 48 * 2);
      text("Health: " + player.hp, width - 32 * 3, 48 * 3);
      shop.show();
      pop();
   }
}
