abstract class Enemy extends Entity
{
   static final int enemyW = 40;
   static final int enemyH = 80;
   
   int damage;
   boolean isDead;
   float angle = 0;
   
   Enemy(float x, float terrainHeight, int hp, int damage)
   {
      super(x, height - terrainHeight - enemyH, enemyW, enemyH, 0.5, hp);
      this.damage = damage;
      isDead = false;
   }
   
   abstract void setSprite();
   abstract int loot();
   
   void AI(Player player)
   {
      if (!isDead)
      {
        if (player.x < x) direction = -1;
        else direction = 1;
        if (collision(player))
        {
           pushEntity(-direction * (pushForce + 30));
           player.pushEntity(direction * pushForce);
           player.reduceHealth(damage);
        }
        for (int i = 0; i < player.weapon.bullets.size(); i++)
        {
           Bullet b = player.weapon.bullets.get(i);
           if (collision(b))
           {
              player.weapon.bullets.remove(b);   
              this.reduceHealth(player.weapon.power);
           }
        }
      }
      else speed = 0;
   }
   
   void show()
   {
      setSprite();
      push();
      sprite.resize(w, h);
      if (isDead)
      {
        angle = angle + 0.05;
        translate(x, y);
        if (direction == 1)
        {
          rotate(-angle);
          this.y += angle * 3;
        }
        else
        {
          rotate(angle);
          this.y += angle * 2;
        }
        image(sprite, 0, 0);
        
      }
      else image(sprite, x, y);
      
      pop();
   }
}
