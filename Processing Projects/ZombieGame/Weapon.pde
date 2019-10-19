abstract class Weapon extends Entity
{
    float yPos;
    int power;
    Player player;
    int ammo;
    ArrayList<Bullet> bullets;
  
    Weapon(float x, float y, int w, int h, int power, int ammo, Player player)
    {
       super(x, y, w, h, 0, 0);
       this.direction = player.direction;
       this.power = power;
       this.player = player;
       this.x = player.x + 15;
       this.ammo = ammo;
       bullets = new ArrayList<Bullet>();
    }
    
    abstract void setSprite();
    abstract String name();
    
    void update()
    {
       if (player.direction != 0) this.direction = player.direction;
       if (direction == 1) this.x = player.x + 15;
       else if (direction == -1) this.x = player.x + 5;
       this.y = player.y + 20;
       for (int i = 0; i < bullets.size(); i++)
       {
         bullets.get(i).update();
         bullets.get(i).show();
         if (bullets.get(i).x < 0 || bullets.get(i).x > width)
           bullets.remove(bullets.get(i));
       }
    }
    
    void shoot()
    {
       if (ammo > 0)
       {
         bullets.add(new Bullet(this));
         ammo--;
       }
    }
    
    void show()
    {
       setSprite();
       push();
       sprite.resize(w, h);
       image(sprite, x, y);
       pop();
    }
}
