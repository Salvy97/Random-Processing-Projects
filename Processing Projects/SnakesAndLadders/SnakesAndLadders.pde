Cell[][] board;
static final int dim = 10;

Player player;
Ladder[] ladders;
Snake[] snakes;

void setCellsNumber()
{
  int counter = 1;
  boolean right = true;
  for (int i = dim - 1; i >= 0; i--)
  {
    if (right)
    {
      for (int j = 0; j < dim; j++)
      {
        board[i][j].cellNumber = counter;
        counter++;
      }
    }
    else
    {
      for (int j = dim - 1; j >= 0; j--)
      {
        board[i][j].cellNumber = counter;
        counter++;
      }
    }
    right = !right; 
  }
}

void setDirections()
{
  boolean right = true;
  for (int i = dim - 1; i >= 0; i--)
  {
    if (right)
    {
      for (int j = 0; j < dim - 1; j++)
        board[i][j].direction = 1;
      board[i][dim - 1].direction = 0;
    }
    else
    {
      for (int j = dim - 1; j >= 0; j--)
        board[i][j].direction = -1;
      board[i][0].direction = 0;
    }
    right = !right; 
  }
  board[0][0].direction = 100;
}

void initiateBoard()
{
  board = new Cell[dim][dim];
  boolean red = true, prev = red;
  for (int i = 0; i < dim; i++)
  {
    for (int j = 0; j < dim; j++)
    {
      if (red)
        board[i][j] = new Cell(i, j, width / dim, new PVector(255, 0, 0));
      else
        board[i][j] = new Cell(i, j, width / dim, new PVector(255, 255, 255));
      if (j < dim - 1)
        red = !red;
      else
      {
        boolean temp = red;
        red = !prev;
        prev = temp;
      }
    }
  }
  setCellsNumber();
  setDirections();
}

void generateLadders()
{
  ladders = new Ladder[5];
  for (int i = 0; i < ladders.length; i++)
  {
    
    Cell start = board[(dim - 1) - (i * 2)][floor(random(0, dim - 1))];
    while (start.row != dim - 1 && start.column != 0)
      start = board[(dim - 1) - (i * 2)][floor(random(0, dim - 1))];
    Cell end = board[floor(random(0, dim - i * 2 - 1))][floor(random(0, dim - 1))];
    ladders[i] = new Ladder(start, end);  
  }
}

void generateSnakes()
{
  snakes = new Snake[5];
  for (int i = 0; i < snakes.length; i++)
  {
    Cell start = board[floor(random(0, dim - i * 2 - 1))][floor(random(0, dim - 1))];
    Cell end = board[(dim - 1) - (i * 2)][floor(random(0, dim - 1))];
    snakes[i] = new Snake(start, end);  
  }
}

void setup()
{
  size(800, 800);
  initiateBoard();
  player = new Player(board[dim - 1][0]);
  generateLadders();
  generateSnakes();
}

void mousePressed()
{
  int positions = floor(random(1, 6));
  boolean exceeded = false;
  if (!player.won)
  {
    for (int i = 0; i < positions; i++)
    {
      player.move(exceeded);
      if (player.where.row == 0 && player.where.column == 0)
      {
        if (i == positions - 1) player.won = true;  
        else exceeded = true;
      } 
    }
  }
}

void draw()
{
  for (int i = 0; i < dim; i++)
    for (int j = 0; j < dim; j++)
      board[i][j].show();
  player.show();
  player.checkLadders(ladders);
  player.checkSnakes(snakes);
  for (int i = 0; i < ladders.length; i++)
    ladders[i].show();
  for (int i = 0; i < snakes.length; i++)
    snakes[i].show();
}
