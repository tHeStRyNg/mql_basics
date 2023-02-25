
void OnInit() {
   int i = 0;
   
   while (i < 10) {
      Print(i);
      i++; // Watch out infinite loop!
   }
   
   // Task: Declare an array with five elements, initialize the array with the values 10, 20, 30, 40, 50
   int array[5] = {10, 20, 30, 40, 50};
   
   while (i < 5) {
      Print(array[i]);
      i++;
   }
}