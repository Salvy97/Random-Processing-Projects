Cell[][] allCells;
int wid;

ArrayList<Cell> cells;
int currentIndex = 0;
int steps = 0;

void fillArray()
{
  for (int i = 0; i < 8; i++)
    for (int j = 0; j < 8; j++)
      if (allCells[i][j].value != -1)
        cells.add(allCells[i][j]);
}

ArrayList<Cell> getColumnCells(int index)
{
  ArrayList<Cell> c = new ArrayList<Cell>();
  int row = cells.get(index).row;
  int column = cells.get(index).column;
  for (int i = row - 1; i >= 0; i--)
  {
    if (allCells[i][column].value == -1)
      break;
    else
      c.add(allCells[i][column]);
  }
  for (int i = row + 1; i < 8; i++)
  {
    if (allCells[i][column].value == -1)
      break;
    else
      c.add(allCells[i][column]);
  }
  return c;
}

ArrayList<Cell> getRowCells(int index)
{
  ArrayList<Cell> r = new ArrayList<Cell>();
  int row = cells.get(index).row;
  int column = cells.get(index).column;
  for (int j = column - 1; j >= 0; j--)
  {
    if (allCells[row][j].value == -1)
      break;
    else
      r.add(allCells[row][j]);
  }
  for (int j = column + 1; j < 8; j++)
  {
    if (allCells[row][j].value == -1)
      break;
    else
      r.add(allCells[row][j]);
  }
  return r;
}

int getRowSum(int index)
{
  int j = cells.get(index).column;
  while (true)
  {
    j--;
    if (allCells[cells.get(index).row][j] instanceof SumCell)
      return ((SumCell)allCells[cells.get(index).row][j]).sumRight;
  }
}

int getColumnSum(int index)
{
  int i = cells.get(index).row;
  while (true)
  {
    i--;
    if (allCells[i][cells.get(index).column] instanceof SumCell)
      return ((SumCell)allCells[i][cells.get(index).column]).sumDown;
  }
}

boolean isValid(int index)
{
  int value = cells.get(index).value;
  ArrayList<Cell> rowCells = getRowCells(index);
  ArrayList<Cell> columnCells = getColumnCells(index);
  int rowTotal = getRowSum(index);
  int columnTotal = getColumnSum(index);
  int rt = value;
  int ct = value;
  boolean rowValid = false;
  for (int i = 0; i < rowCells.size(); i++)
  {
    if (rowCells.get(i).value == value) return false;
    else if (rowCells.get(i).value == 0) rowValid = true;
    rt += rowCells.get(i).value;
  }
  if ((rt < rowTotal || rt > rowTotal) && !rowValid) return false;
  boolean columnValid = false;
  for (int i = 0; i < columnCells.size(); i++)
  {
    if (columnCells.get(i).value == value) return false;
    else if (columnCells.get(i).value == 0) columnValid = true;
    ct += columnCells.get(i).value;
  }
  if ((ct < columnTotal || ct > columnTotal) && !columnValid) return false;
  return true;
}

void backtracking()
{
  cells.get(currentIndex).value++;
  if (cells.get(currentIndex).value > 9)
  {
    cells.get(currentIndex).value = 0;
    currentIndex--;
  }
  else if (isValid(currentIndex))
  {
    if (!solved()) 
      currentIndex++;
  } 
}

void setup()
{
  size(400, 400);
  allCells = new Cell[8][8];
  wid = width / 8;
  initializeKakuro();
  cells = new ArrayList<Cell>();
  fillArray();
  //Solve it without drawing each step
  /*while (true)
  {
    if (!solved()) backtracking();
    else break;
    steps++;
  }*/
}

boolean solved()
{
  for (int i = 0; i < cells.size(); i++)
    if (cells.get(i).value == 0 || !isValid(i))
      return false;
  return true;
}

void drawCells()
{
  for (int i = 0; i < 8; i++)
    for (int j = 0; j < 8; j++)
      allCells[i][j].show();
}

void draw()
{
  drawCells();
  if (!solved())
    backtracking();
}
