class Node {
   Node        *siguiente;
   ushort      id;
   
public:
   static ushort    nodes;
   
   Node() {
      siguiente = NULL;
      nodes += 1;
      id = nodes;
   }
   
   Node(Node *s) {
      siguiente = s;
      nodes += 1;
      id = nodes;
   }
   
   void setSiguiente(Node *s) {
      this.siguiente = s;
   }
   
   string toString() {
      return "Node "+IntegerToString(id)+""+ ( (siguiente == NULL) ? "" : " --> "+siguiente.toString() );
   }
};
ushort Node::nodes=0;
 
void OnInit() {
   Node n1();
   Node n2();
   
   n1.setSiguiente(&n2);

   Print(n1.toString());
}