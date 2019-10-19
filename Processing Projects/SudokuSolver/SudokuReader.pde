Block[][] sudokuReader(String path)
{
  Block[][] blocks = new Block[3][3];
  ArrayList<String> content = FileManager.content(path);
  int blockC = 0;
  int blockR = 0;
  while (blockR < 9)
  {
    int[] values = new int[9];
    int index = 0;
    for (int j = blockR; j < blockR + 3; j++)
    {
      for (int k = blockC; k < blockC + 3; k++)
      {
        values[index] = Integer.parseInt("" + content.get(j).charAt(k));
        index++;
      }
    }
    blocks[blockR / 3][blockC / 3] = new Block(blockR / 3, blockC / 3, blockR, blockC, values);
    blockC += 3; 
    if (blockC == 9)
    {
      blockC = 0;
      blockR += 3;
    }
  }
  return blocks;
}
