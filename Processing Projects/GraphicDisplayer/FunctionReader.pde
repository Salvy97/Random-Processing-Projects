class FunctionReader
{
   static final char SUM_CHAR = '+';
   static final char X_CHAR = 'x';
   static final char DIFF_CHAR = '-';
   static final char MULT_CHAR = '*';
   static final char DIV_CHAR = '/';
   static final char POW_CHAR = '^';
   static final char LN_CHAR = 'l';

   private int pos;
  
   boolean isNumber(char c)
   {
      return c != SUM_CHAR && c != X_CHAR && c != DIFF_CHAR && c != MULT_CHAR && c != DIV_CHAR && c != POW_CHAR && c != LN_CHAR; 
   }
   
   String splitFunction(String function)
   {
       String split = "";
       int i;
       for (i = pos; i < function.length(); i++)
       {
         if (function.charAt(i) != SUM_CHAR && function.charAt(i) != DIFF_CHAR)
           split += function.charAt(i);
         else
           break;
       }   
       pos = i + 1;
       return split;
   }
   
   String splitOperations(String function)
   {
       String operation = "";
       int i;
       for (i = pos; i < function.length(); i++)
       {
         if (function.charAt(i) == SUM_CHAR || function.charAt(i) == DIFF_CHAR)
         {
           operation += function.charAt(i);
           break;
         }
       }
       pos = i + 1;
       return operation;
   }
   
   float readFunction(String function, float x)
   {
      ArrayList<String> splitted = new ArrayList<String>();
      ArrayList<String> operations = new ArrayList<String>();
      while (pos < function.length()) splitted.add(splitFunction(function));
      pos = 0;
      operations.add("+");
      while (pos < function.length()) operations.add(splitOperations(function));
      operations.remove(operations.get(operations.size() - 1));
      float result = 0;
      int currentOperation = 0;
      for (int i = 0; i < splitted.size(); i++)
      {
         String funcPart = splitted.get(i);
         float r = 0;
         for (int j = 0; j < funcPart.length(); j++)
         {
            if (isNumber(funcPart.charAt(j)))
            {
              int firstPos = j;
              while (j < funcPart.length() && isNumber(funcPart.charAt(j))) j++;
              String number = funcPart.substring(firstPos, j);
              j--;
              r += Float.parseFloat(number);
            }
            else if (funcPart.charAt(j) == X_CHAR) r += x;
            else if (funcPart.charAt(j) == MULT_CHAR || funcPart.charAt(j) == DIV_CHAR || funcPart.charAt(j) == POW_CHAR)
            {
              if (funcPart.charAt(j + 1) != LN_CHAR)
              {
                if (funcPart.charAt(j + 1) == X_CHAR)
                  r = executeOperation(r, x, funcPart.charAt(j));
                else
                  r = executeOperation(r, Float.parseFloat("" + funcPart.charAt(j + 1)), funcPart.charAt(j));
                j++;
              }
              else
              {
                if (funcPart.charAt(j + 2) == X_CHAR)
                  r += executeOperation(x, 0, LN_CHAR);
                else
                  r += executeOperation(Float.parseFloat("" + funcPart.charAt(j + 2)), 0, LN_CHAR);
                j += 2;
              }
            }
            else if (funcPart.charAt(j) == LN_CHAR)
            {
               if (funcPart.charAt(j + 1) == X_CHAR)
                 r += executeOperation(x, 0, LN_CHAR);
               else
                 r += executeOperation(Float.parseFloat("" + funcPart.charAt(j + 1)), 0, LN_CHAR);
               j++;
            }
         }
         result = executeOperation(result, r, operations.get(currentOperation).charAt(0));
         currentOperation++;
      }
      pos = 0;
      return result;
   }
   
   float executeOperation(float x, float y, char operation)
   {
     switch (operation)
      {
         case SUM_CHAR:  return x += y;
         case DIFF_CHAR: return x -= y;
         case MULT_CHAR: return x *= y;
         case DIV_CHAR:  return x /= y;
         case POW_CHAR:  return pow(x, y);
      }
      return log(x);
   }
}
