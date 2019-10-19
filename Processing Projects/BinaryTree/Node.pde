class Tree extends Node
{
   Tree(int value) { super(value); }
}

class Node
{
   Node left;
   Node right;
   int value;
   
   Node(int value)
   {
      this.value = value;
      left = null;
      right = null;
   }
   
   boolean addElement(int value)
   {
      if (value < this.value && left != null) 
        left.addElement(value);
      else if (value < this.value && left == null) 
      { 
        left = new Node(value); 
        return true; 
      }
      if (value > this.value && right != null) 
        right.addElement(value);
      else if (value > this.value && right == null) 
      { 
        right = new Node(value); 
        return true; 
      }
      return false;
   }
   
   void printTree()
   {
      if (left != null) left.printTree();
      System.out.print(value + " ");
      if (right != null) right.printTree();
   }
   
   boolean search(int value)
   {
      if (this.value == value) return true;
      else if (value < this.value && left != null)
      {
         if (left.search(value))
            return true;
      }
      else if (value > this.value && right != null) 
      {
         if (right.search(value))
            return true;
      }
      return false;
   }
   
   void show(int x, int y)
   {
      int radius = 20;
      int arcLength = 40;
      int offset = 10;
      fill(255);
      ellipse(x, y, radius * 2, radius * 2);
      textSize(20);
      fill(0);
      text("" + value, x - radius / 3, y + radius / 3);
      if (left != null)
      {
        line(x - offset, y + radius, x - arcLength, y + arcLength);
        left.show(x - arcLength, y + arcLength);
      }
      if (right != null)
      {
        line(x + offset, y + radius, x + arcLength, y + arcLength);
        right.show(x + arcLength, y + arcLength);
      }
   }
}
