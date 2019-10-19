void initializeKakuro()
{
  //FIRST ROW
  allCells[0][0] = new BlackCell(0, 0, wid);
  allCells[0][1] = new SumCell(0, 1, wid, 23, 0);
  allCells[0][2] = new SumCell(0, 2, wid, 30, 0);
  allCells[0][3] = new BlackCell(0, 3, wid);
  allCells[0][4] = new BlackCell(0, 4, wid);
  allCells[0][5] = new SumCell(0, 5, wid, 27, 0);
  allCells[0][6] = new SumCell(0, 6, wid, 12, 0);
  allCells[0][7] = new SumCell(0, 7, wid, 16, 0);
  
  //SECOND ROW
  allCells[1][0] = new SumCell(1, 0, wid, 0, 16);
  allCells[1][1] = new NormalCell(1, 1, wid);
  allCells[1][2] = new NormalCell(1, 2, wid);
  allCells[1][3] = new BlackCell(1, 3, wid);
  allCells[1][4] = new SumCell(1, 4, wid, 17, 24);
  allCells[1][5] = new NormalCell(1, 5, wid);
  allCells[1][6] = new NormalCell(1, 6, wid);
  allCells[1][7] = new NormalCell(1, 7, wid);
  
  //THIRD ROW
  allCells[2][0] = new SumCell(2, 0, wid, 0, 17);
  allCells[2][1] = new NormalCell(2, 1, wid);
  allCells[2][2] = new NormalCell(2, 2, wid);
  allCells[2][3] = new SumCell(2, 3, wid, 15, 29);
  allCells[2][4] = new NormalCell(2, 4, wid);
  allCells[2][5] = new NormalCell(2, 5, wid);
  allCells[2][6] = new NormalCell(2, 6, wid);
  allCells[2][7] = new NormalCell(2, 7, wid);
  
  //FOURTH ROW
  allCells[3][0] = new SumCell(3, 0, wid, 0, 35);
  allCells[3][1] = new NormalCell(3, 1, wid);
  allCells[3][2] = new NormalCell(3, 2, wid);
  allCells[3][3] = new NormalCell(3, 3, wid);
  allCells[3][4] = new NormalCell(3, 4, wid);
  allCells[3][5] = new NormalCell(3, 5, wid);
  allCells[3][6] = new SumCell(3, 6, wid, 12, 0);
  allCells[3][7] = new BlackCell(3, 7, wid);
  
  //FIFTH ROW
  allCells[4][0] = new BlackCell(4, 0, wid);
  allCells[4][1] = new SumCell(4, 1, wid, 0, 7);
  allCells[4][2] = new NormalCell(4, 2, wid);
  allCells[4][3] = new NormalCell(4, 3, wid);
  allCells[4][4] = new SumCell(4, 4, wid, 7, 8);
  allCells[4][5] = new NormalCell(4, 5, wid);
  allCells[4][6] = new NormalCell(4, 6, wid);
  allCells[4][7] = new SumCell(4, 7, wid, 7, 0);
  
  //SIXTH ROW
  allCells[5][0] = new BlackCell(5, 0, wid);
  allCells[5][1] = new SumCell(5, 1, wid, 11, 0);
  allCells[5][2] = new SumCell(5, 2, wid, 10, 16);
  allCells[5][3] = new NormalCell(5, 3, wid);
  allCells[5][4] = new NormalCell(5, 4, wid);
  allCells[5][5] = new NormalCell(5, 5, wid);
  allCells[5][6] = new NormalCell(5, 6, wid);
  allCells[5][7] = new NormalCell(5, 7, wid);
  
  //SEVENTH ROW
  allCells[6][0] = new SumCell(6, 0, wid, 0, 21);
  allCells[6][1] = new NormalCell(6, 1, wid);
  allCells[6][2] = new NormalCell(6, 2, wid);
  allCells[6][3] = new NormalCell(6, 3, wid);
  allCells[6][4] = new NormalCell(6, 4, wid);
  allCells[6][5] = new SumCell(6, 5, wid, 0, 5);
  allCells[6][6] = new NormalCell(6, 6, wid);
  allCells[6][7] = new NormalCell(6, 7, wid);
  
  //EIGHTH ROW
  allCells[7][0] = new SumCell(7, 0, wid, 0, 6);
  allCells[7][1] = new NormalCell(7, 1, wid);
  allCells[7][2] = new NormalCell(7, 2, wid);
  allCells[7][3] = new NormalCell(7, 3, wid);
  allCells[7][4] = new BlackCell(7, 4, wid);
  allCells[7][5] = new SumCell(7, 5, wid, 0, 3);
  allCells[7][6] = new NormalCell(7, 6, wid);
  allCells[7][7] = new NormalCell(7, 7, wid);
}
