class Person {
   // Attributes
   string            _nombre;
   string            _apellido;
   uint              _id;
   
public:
   // Constructor
   Person(string n, string a, uint id) {
      this._nombre = n;
      this._apellido = a;
      this._id = id;
   }
   
   // Second constructor 
   Person(string n) {
      _nombre = n;
   }
   
   string ToString() {
      return _nombre+" "+_apellido;
   }
};
 
void OnInit() {

   Person object("Kevin", "Of Space", 1234567);
   Person o2("Test");
   
   Print(o2.ToString());
   
}