
void OnInit() {

// With an enumeration we are creating our own type and apart we are determining what values it can have
   enum custom
     {
         BUY, // Automatically assigned the value 0
         SELL, // A value above the previous one is automatically assigned 0+1=1
         OTHER = 3
     };
     
// To declare a variable using an enumeration we do the same
   custom a, b = BUY;
   
// Several variables can be declared on the same line and it is not always necessary to give an initial value
   
   a = SELL;
   
   Print(a);
   Print(b);
   
// We can also send values, it is not always necessary to send a variable
   Print(OTHER);
   Print("Hola: ", 5);
   
// As we will see below in the strategy tester, the values of an enumeration are still numbers.
   
   
    // Let's test the code in the strategy tester
}