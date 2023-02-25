class Person {
   // Attributes
   string            _nombre;
   string            _apellido;
   
private:
   void privateMethod() {}
   
public:
   static uint       persons;
   
   // Constructor
   Person(string n, string a) {
      this._nombre = n;
      this._apellido = a;
      persons += 1;
   }
   
   // Second constructor 
   Person(string n) {
      _nombre = n;
      persons += 1; // ADD
   }

   void caminar() {
      Print("I'm walking");
   }

   void saltar() {
      Print("I'm jumping");
   }

   // Method
   string ToString() {
      return _nombre+" "+_apellido+". There are "+IntegerToString(persons)+" persons";
   }
};
uint Person::persons=0;
 
void OnInit() {

   Person object("Kevin", "De la Coba");
   Print(object.ToString());

   Person o2("Test");
   Print(o2.ToString());

   Person o3("Test");
   Print(o3.ToString());

   Person o4("Test");
   Print(o4.ToString());

   Person o5("Test");
   Print(o5.ToString());
 

}