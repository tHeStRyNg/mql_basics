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
      if (siguiente == NULL)
         this.siguiente = s;
      else
         this.siguiente.setSiguiente(s);
   }
   
   string toString() {
      return "Node "+IntegerToString(id)+""+ ( (siguiente == NULL) ? "" : " --> "+siguiente.toString() );
   }
};
ushort Node::nodes=0;



class LinkedList {
   Node     *first;
   
public:
   
   LinkedList() {
      first = NULL;
   }
   
   LinkedList(Node *Node) {
      first = Node;
   }
   
   void AnadirNode(Node *Node) {
      if (first != NULL)
         this.first.setSiguiente(Node);
      else
         this.first = Node;
   }
   
   string toString() {
      return first.toString();
   }
};
 
 

void OnInit() {
   Node n1(), n2(), n3(), n4(), n5();
   LinkedList list();
   
   list.AnadirNode(&n1);
   list.AnadirNode(&n2);
   list.AnadirNode(&n3);
   list.AnadirNode(&n4);
   list.AnadirNode(&n5);
   
   Print(list.toString());
}