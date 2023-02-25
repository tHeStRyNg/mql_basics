
void OnInit() {

// Let's start now with the operations. We can operate using +, -, /, * and %
    // Sums are always between numbers,
   int a = 5, b = 3;
   
   int c = a + b;
   Print(c);
   
//it would be best to always try to use the same type in both parts of the sum
    int d = 1 + 1.03; // In the variable d even though we try to save a result that is decimal, it will not be done since the variable is integer
    // We see how the compiler gives us an error and if we print the value, the decimals are ignored.
   
   Print("D: ", d);
   
// If we do the same using a decimal type this problem does not happen
   double e = 1 + 1.04;
   
   Print("E: ", e);
   
// Subtractions are the same as additions
   int resta = 1 - 3;
   Print("RESTA: ", resta);
   
// It is better not to do divisions using an integer type unless we are always going to get an integer value
   double div = 1.0 / 2.0;
   Print("DIVISION: ", div);
   
// Multiplications are just as simple
   int mul = 2 * a;
   Print("MULTIPLICACION: ", a);
   
// Finally we have the modulo operator that gives us the remainder of a division
   int modulo = 5 % 2;
   Print("MODULO: ", modulo);
   
// Let's test the code in the strategy tester
}