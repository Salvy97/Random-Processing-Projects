Tree tree = new Tree(8);

void setup()
{
  size(400, 400);
  tree.addElement(4);
  tree.addElement(2);
  tree.addElement(17);
  tree.addElement(3);
  tree.addElement(1);
}

void draw()
{
  tree.show(width/2, 40);
}
