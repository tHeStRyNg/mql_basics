// In mql5 there are different types of variables.

// The ones that we are going to use the most during the course are the following:

int // This is an integer variable. Its name "int" comes from Integer which means integer.
// In this type of variables we can only store numbers and these also have to be integers.
// Integer variables occupy 4 bytes in memory. What does this mean? If we take into account that only
// positive and negative integers can be stored this means we can give an integer variable
// 2^(8*4) values. In short, many values

short // This is another variable for holding integer values. short in English means "short", this variable
// Takes up less space in memory. It is used when you want to be efficient.

long // To store integers but now we can put very large numbers. From -9 223 372 036 854 775 808 to 9 223 372 036 854 775 807

uint // The u comes from "unsigned", you can only put positive numbers and 0

ushort // Positive numbers but we can't put that many. The highest number we can use is 65535 while with 4 294 967 295

ulong // Positive numbers, we can put many. The highest we can use is 18 446 744 073 709 551 615

double // To store decimal numbers

float // To store decimal numbers but this variable occupies less and therefore cannot put as many numbers