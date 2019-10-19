int wid;
Block[][] blocks;

ArrayList<Cell> cells;
int currentIndex;
boolean lastValue;
int steps = 0;

int seconds;
float totalSeconds = 0;
int minutes = 0;
boolean beGreen = false;

void drawGrid()
{
  strokeWeight(4);
  line(3 * wid, 0, 3 * wid, 9 * wid);
  line(6 * wid, 0, 6 * wid, 9 * wid);
  line(0, 3 * wid, 9 * wid, 3 * wid);
  line(0, 6 * wid, 9 * wid, 6 * wid);
}

void setup()
{
  size(400, 500);
  wid = width / 10;
  
  blocks = sudokuReader("C:/Users/Salvy/Desktop/Progetti Processing/SudokuSolver/sudoku.txt");

  cells = new ArrayList<Cell>();
  lastValue = false;
  fillArray();
  
  //Without drawing each step
  /*while (true)
  {
     if (!solved())
       backtracking();
     else
       break;
     steps++;
  }*/
}

void fillArray()
{
  int blockRow = 0;
  int cellRow = 0;
  while (blockRow < 3)
  {
    for (int j = 0; j < 3; j++)
    {
      for (int k = 0; k < 3; k++)
      {
        if (blocks[blockRow][j].cells[cellRow][k].value == 0)
          cells.add(blocks[blockRow][j].cells[cellRow][k]);
      }
    }
    cellRow++;
    if (cellRow >= 3)
    {
      cellRow = 0;
      blockRow++;
    }
  }
}

boolean isValid(int index)
{ 
  int row = cells.get(index).row;   
  int column = cells.get(index).column;  
  int value = cells.get(index).value;
  int blockR = cells.get(index).blockR;
  int blockC = cells.get(index).blockC;
  
  int tempRow = row;
  int tempColumn = column;
  
  if (row > 2) tempRow -= 3;
  if (row > 5) tempRow -= 3;
  if (column > 2) tempColumn -= 3;
  if (column > 5) tempColumn -= 3;

  //Check block
  if (!blocks[blockR][blockC].isValid(tempRow, tempColumn)) 
    return false;

  //Check row
  for (int j = 0; j < 3; j++)
    for (int l = 0; l < 3; l++)
      if (blockC != j && blocks[blockR][j].cells[tempRow][l].value == value)
        return false;     
        
  //Check column
  for (int i = 0; i < 3; i++)
    for (int k = 0; k < 3; k++)
      if (blockR != i && blocks[i][blockC].cells[k][tempColumn].value == value)
        return false;
  
  return true;
}

boolean solved()
{
   for (int i = 0; i < cells.size(); i++)
   {  
     if (i == cells.size() - 1 && !lastValue)
     {
       cells.get(i).value++;
       lastValue = true;
     }
     if (!isValid(i))
       return false;
   }
   return true;      
}

void backtracking()
{
   cells.get(currentIndex).value++;
   if (cells.get(currentIndex).value == 10)
   {
      cells.get(currentIndex).value = 0;
      if (currentIndex > 0)
        currentIndex--;
   }
   else
   {
     if (isValid(currentIndex) && currentIndex < cells.size())
       currentIndex++;   
   }
}

void drawTime(int red, int green, int blue)
{
   push();
   background(200);
   fill(red, green, blue);
   textSize(32);
   textAlign(CENTER);
   text(nf(minutes, 2) + ":" + nf(seconds, 2), width / 2, height - 65);
   pop();
}

void draw()
{
  if (!solved())
  {
    seconds = (int)((millis() / 1000) - totalSeconds);
    if (seconds >= 60)
    {
       minutes++;
       totalSeconds = millis() / 1000;
    }
  }
  if (!beGreen)
    drawTime(255, 0, 0);
  else
    drawTime(0, 255, 0);
  translate(20, 20);
  for (int i = 0; i < 3; i++)
    for (int j = 0; j < 3; j++)
      blocks[i][j].show();
  drawGrid();
  if (!solved())
  {
    backtracking();
    steps++;
  }
  else
  {
    beGreen = true;
    push();
    fill(0, 255, 0);
    textSize(32);
    textAlign(CENTER);
    text("SOLVED!", width / 2 - 20, height - 40);
    pop();
  }
  push();
  textSize(26);
  text("Steps:", width - 110, height - 80);
  text("" + steps, width - 100, height - 40);
  pop();
}
