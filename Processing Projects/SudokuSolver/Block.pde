class Block
{
   Cell[][] cells;
   
   Block(int blockR, int blockC, int row, int column, int[] values)
   {
     cells = new Cell[3][3];
     int index = 0;
     for (int i = 0; i < cells.length; i++)
     {
       for (int j = 0; j < cells[i].length; j++)
       {
         cells[i][j] = new Cell(row + i, column + j, blockR, blockC, wid, values[index]);
         index++;
       }
     }
   }
   
   void show()
   {
     for (int i = 0; i < cells.length; i++)
       for (int j = 0; j < cells[i].length; j++)
         cells[i][j].show();
   }
   
   boolean isValid(int row, int column)
   {
     int i = 0;
     while (i < 3)
     {
       if (i == row)
       {
         for (int j = 0; j < cells[i].length; j++)
           if (j != column)
             if (cells[i][j].value == cells[row][column].value)
               return false;
       }
       else
       {
         for (int j = 0; j < cells[i].length; j++)
           if (cells[i][j].value == cells[row][column].value)
             return false;
       }
       i++;
     }
     return true;
   }
}
