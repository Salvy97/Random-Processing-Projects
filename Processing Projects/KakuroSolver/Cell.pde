abstract class Cell
{
  int row;
  int column;
  float x;
  float y;
  int w;
  int value;

  Cell(int row, int column, int w, int value)
  {
    this.row = row;
    this.column = column;
    this.w = w;
    this.x = column * w;
    this.y = row * w;
    this.value = value;
  }
  
  abstract void show();
}
