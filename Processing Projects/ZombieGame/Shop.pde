class Shop
{
   static final int shotgunPrice = 1000;
   static final int buttonsLength = 1;
   
   Button[] buttons =
   {
      new ShotgunButton(20, 20, 120, 60)
   };
   
   void show()
   {
       for (int i = 0; i < buttonsLength; i++)
         buttons[i].show();
   }
}
