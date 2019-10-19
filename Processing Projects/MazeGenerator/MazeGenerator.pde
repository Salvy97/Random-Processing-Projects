import java.util.LinkedList;

Cella[][] grid;
final int cellWidth = 80;
final int N = 800 / cellWidth;
Cella current;
LinkedList<Cella> stack;

void setup()
{
  size(800, 800);
  grid = new Cella[N][N];
  stack = new LinkedList<Cella>();
  for (int i = 0; i < N; i++)
    for (int j = 0; j < N; j++)
      grid[i][j] = new Cella(i, j, cellWidth);
  current = grid[0][0];
  stack.add(current);
  frameRate(10);
}

void draw()
{
  background(0);
  for (int i = 0; i < N; i++)
    for (int j = 0; j < N; j++)
      grid[i][j].show();
  if (!stack.isEmpty())
  {
    current = stack.getFirst();
    current.visit();
    Cella next = current.neighbor(grid);
    if (next != null)
    {
       next.visit(); 
       removeWalls(current, next);
       stack.addFirst(next);
    }
    else stack.removeFirst();
  }
}

void removeWalls(Cella a, Cella b)
{
  if (a.riga > b.riga)
  {
     a.removeWall(Cella.UP);
     b.removeWall(Cella.DOWN);
  }
  else if (a.riga < b.riga)
  {
     a.removeWall(Cella.DOWN);
     b.removeWall(Cella.UP);
  }
  if (a.colonna > b.colonna)
  {
     a.removeWall(Cella.LEFT);
     b.removeWall(Cella.RIGHT);
  }
  else if (a.colonna < b.colonna)
  {
     a.removeWall(Cella.RIGHT);
     b.removeWall(Cella.LEFT);
  }
}
