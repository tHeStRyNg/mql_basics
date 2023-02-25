
void OnInit() {
   // Task: Declare the variable "i" and assign it the value 0
   int i = 0;
   
   do {
      // Task: Show in each iteration if i is even or odd
      Print( (i % 2 == 0) ? i+" es par" : i+" no es par" );
      i++;
   } while(i < 10);
}