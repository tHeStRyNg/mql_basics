
void OnInit() {
   // Task: Declare an array of 5 elements
   int array[];
   
   // array[0] = 1; // ¡¡ERROR!!
   
   ArrayResize(array, 5);
   
   array[0] = 1;
   
   Print(">>> ", ArraySize(array));
   ArrayFree(array);
}