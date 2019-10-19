GameManager game;

void setup()
{
  size(800, 800);
  game = new GameManager();
}

void keyReleased()
{
   game.player.speed = 0;
}

void mousePressed()
{
   if (game.player.direction != 0)
     for (int i = 0; i < Shop.buttonsLength; i++)
       if (game.shop.buttons[i].isOnButton())
         game.shop.buttons[i].click(game.player);
}

void keyPressed()
{
   if (key == 'd') { game.player.direction = 1; game.player.speed = 2; }
   if (key == 'a') { game.player.direction = -1; game.player.speed = 2; }
   if (key == ' ') game.player.weapon.shoot();
}

void draw()
{
   background(88);
   game.update();
   game.GUI();
}
