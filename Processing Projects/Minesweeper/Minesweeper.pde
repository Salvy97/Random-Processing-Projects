static final int dim = 10;

Cell[][] grid;

boolean gameOver = false;

void gameOver()
{
   push();
   fill(255, 0, 0);
   textSize(32);
   textAlign(CENTER);
   text("Game Over!", width / 2, height - 40);
   pop();
}

void setup()
{
   size(400, 400);
   grid = new Cell[dim][dim];
   for (int i = 0; i < dim; i++)
     for (int j = 0; j < dim; j++)
       grid[i][j] = new Cell(i, j, width / dim);
   for (int i = 0; i < dim; i++)
     for (int j = 0; j < dim; j++)
       grid[i][j].setNeighborBombs();
}

void mousePressed()
{
   for (int i = 0; i < dim; i++)
   {
     for (int j = 0; j < dim; j++)
     {
       if (grid[i][j].contains(mouseX, mouseY))
       {
         grid[i][j].revealed = true;
         if (grid[i][j].neighborBombs == 0 && !grid[i][j].isMine)
           grid[i][j].revealAllCloseEmpty();
         if (grid[i][j].isMine)
           gameOver = true;
       }
     }
   }
}

void draw()
{
   for (int i = 0; i < dim; i++)
     for (int j = 0; j < dim; j++)
       grid[i][j].show();
   if (gameOver)
   {
     gameOver();
     noLoop();
   }
}
