class Neighbor
{
   int i;
   int j;
   
   Neighbor(int i, int j)
   {
     this.i = i;
     this.j = j;
   }
   
   boolean isNotValid() { return i < 0 || i > dim - 1 || j < 0 || j > dim - 1; }
}

class Cell
{
   boolean isMine;
   boolean revealed;
   int row;
   int column;
   int w;
   float xPos;
   float yPos;
   int neighborBombs;
   
   Cell(int row, int column, int w)
   {
      this.row = row;
      this.column = column;
      this.w = w;
      xPos = column * w;
      yPos = row * w;
      float r = random(0, 1);
      if (r < 0.2) isMine = true;
      else isMine = false;
      revealed = false;
      neighborBombs = 0;
   }
   
   void show()
   {
      push();
      if (!revealed) fill(255);
      else if (revealed && isMine) fill(255, 0, 0);
      else if (revealed && !isMine) fill(202, 100);
      rect(yPos, xPos, w, w);
      if (revealed)
      {
        if (isMine)
        {
           fill(0);
           ellipse(yPos + w / 2, xPos + w / 2, w / 2, w / 2);
        }
        else if (!isMine && neighborBombs != 0)
        {
           textSize(32);
           fill(0);
           text("" + neighborBombs, yPos + 10, xPos + 30);
        }
      }
      pop();
   }
   
   boolean contains(float y, float x)
   {
      return x > xPos && x < xPos+ this.w && y > yPos && y < yPos + this.w; 
   }
   
   ArrayList<Neighbor> getNeighbors()
   {
      Neighbor[] neighbors = 
      {
         new Neighbor(row, column - 1),
         new Neighbor(row - 1, column - 1),
         new Neighbor(row - 1, column),
         new Neighbor(row - 1, column + 1),
         new Neighbor(row, column + 1),
         new Neighbor(row + 1, column + 1),
         new Neighbor(row + 1, column),
         new Neighbor(row + 1, column - 1)
      };
      ArrayList<Neighbor> possibleNeighbors = new ArrayList<Neighbor>();
      for (int i = 0; i  < neighbors.length; i++)
        if (!neighbors[i].isNotValid() && !grid[neighbors[i].i][neighbors[i].j].revealed)
          possibleNeighbors.add(neighbors[i]);
      return possibleNeighbors;
   }
   
   void setNeighborBombs()
   {
      int cont = 0;
      ArrayList<Neighbor> possibleNeighbors = getNeighbors();
      for (int i = 0; i < possibleNeighbors.size(); i++)
      {
        int iN = possibleNeighbors.get(i).i;
        int jN = possibleNeighbors.get(i).j;
        if (grid[iN][jN].isMine)
          cont++;
      }
      neighborBombs = cont;
   }
   
   void revealAllCloseEmpty()
   {
      ArrayList<Neighbor> possibleNeighbors = getNeighbors();
      for (int i = 0; i < possibleNeighbors.size(); i++)
      {
        int iN = possibleNeighbors.get(i).i;
        int jN = possibleNeighbors.get(i).j;
        grid[iN][jN].revealed = true;
        if (grid[iN][jN].neighborBombs == 0)
          grid[iN][jN].revealAllCloseEmpty();
      }
   }
}
