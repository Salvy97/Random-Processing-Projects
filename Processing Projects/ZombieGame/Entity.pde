import java.awt.Rectangle;

abstract class Entity
{
   static final float gravity = 0.1;
   static final float pushForce = 40;
  
   float x;
   float y;
   float fallVelocity;
   float speed;
   int hp;
   int w;
   int h;
   int direction;
   PImage sprite;
   
   Entity(float x, float y, int w, int h, float speed, int hp)
   {
      this.x = x;
      this.y = y;
      this.w = w;
      this.h = h;
      this.speed = speed;
      this.hp = hp;
      direction = 0;
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
   }
   
   abstract void show();
   
   boolean collision(Entity entity)
   {
      Rectangle e1 = new Rectangle((int)x, (int)y, w, h);
      Rectangle e2 = new Rectangle((int)entity.x, (int)entity.y, entity.w, entity.h);
      return e1.intersects(e2);
   }
   
   void pushEntity(float pushF)
   {
      this.x += pushF; 
   }
   
   void reduceHealth(int damage)
   {
      this.hp -= damage; 
   }
}
