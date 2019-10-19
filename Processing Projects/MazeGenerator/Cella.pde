public class Cella
{
   public static final int UP = 0;
   public static final int DOWN = 1;
   public static final int LEFT = 2;
   public static final int RIGHT = 3;
  
   private boolean[] walls;
   private boolean visited;
   private int colonna;
   private int riga;
   private int x;
   private int y;
   private int w;
   
   public Cella(int colonna, int riga, int w)
   {
      walls = new boolean[]{ true, true, true, true };
      visited = false;
      this.w = w;
      this.colonna = colonna;
      this.riga = riga;
      this.x = colonna * w;
      this.y = riga * w;
   }
   
   public void show()
   {
      stroke(255);
      if (walls[UP]) line(x, y, x+w, y);
      if (walls[DOWN]) line(x, y+w, x+w, y+w);
      if (walls[LEFT]) line(x, y, x, y+w);
      if (walls[RIGHT]) line(x+w, y, x+w, y+w);
      if (visited)
      {
        noStroke();
        fill(128, 0, 128);
        rect(x+2, y+2, w, w);
      }
   }
   
   private int index(int i) 
   { 
     if (i < 0 || i > N - 1) return - 1;
     return i;
   } 
   
   public Cella neighbor(Cella[][] grid)
   {
      int N = grid.length;
      ArrayList<Cella> neighbors = new ArrayList<Cella>();
      Cella up = null, down = null, left = null, right = null;
      
      if (index(colonna-1) != -1) up = grid[index(colonna-1)][index(riga)];
      if (index(colonna+1) != -1) down = grid[index(colonna+1)][index(riga)];
      if (index(riga+1) != -1) left = grid[index(colonna)][index(riga+1)];
      if (index(riga-1) != -1) right = grid[index(colonna)][index(riga-1)];
      
      if (up != null && !up.isVisited()) neighbors.add(up);
      if (down != null &&!down.isVisited()) neighbors.add(down);
      if (left != null &&!left.isVisited()) neighbors.add(left);
      if (right != null &&!right.isVisited()) neighbors.add(right);
      
      if (!neighbors.isEmpty())
      {
         int r = floor(random(0, neighbors.size()));
         return neighbors.get(r);
      }
      return null;
   }
   
   public void removeWall(int wall) { walls[wall] = false; }
   public void visit() { visited = true; }
   
   public int getX() { return x; }
   public int getY() { return y; }
   public int getW() { return w; }
   public boolean getWall(int index) { return walls[index]; }
   public boolean isVisited() { return visited; }
}
