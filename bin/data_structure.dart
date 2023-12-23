
void main(List<String> arguments) {
  final list = LinkedList<int>();
  list.push(6);
  list.push(6);
  list.push(6);
  list.push(5);
  list.push(4);
  list.push(4);
  list.push(4);
  list.push(2);
  list.push(1);

  print(list);
  print('Linkd List****************************************');
  list.challenge1ReverseElement();
  print('Linkd List****************************************');
  list.challenge2FindMiddle();
  print('Linkd List****************************************');
  LinkedList list2= list.challenge3ReverseLinkdList();
  print(list2);
  print('Linkd List****************************************');
  list.challenge4RemoveOccurrences();

  print('Stack****************************************');

  Stack x=Stack();
  x.push(5);
  x.push(6);
  x.push(67);

  x.printingStack();
  print('Stack****************************************');

  x.pop();

  x.printingStack();
  print('Stack****************************************\n');

  x.reverse();
  x.parenthesesBa('()Hello (world): ');
  print('\nStack****************************************\n');

  x.parenthesesBa('(()Hello (world): ');

}

class Node<T> {
  Node({required this.value, this.next});
  T value;
  Node<T>? next;
  Node<T>? previous;
  @override
  String toString() {
    if (next == null) return '$value';
    return '$value -> ${next.toString()}';
  }

}
class LinkedList<E> extends Iterable<E> {
  @override
  Iterator<E> get iterator => _LinkedListIterator(this);

  @override
  bool get isEmpty => head == null;

  Node<E>? head;
  Node<E>? tail;

  @override
  String toString() {
    if (isEmpty) return 'Empty list';
    return head.toString();
  }

  void push(E value) {
    head = Node(value: value, next: head);
    tail ??= head;
  }
  void append(E value) {
    // 1
    if (isEmpty) {
      push(value);
      return;
    }

    // 2
    tail!.next = Node(value: value);

    // 3
    tail = tail!.next;
  }
  Node<E>? nodeAt(int index) {
    // 1
    var currentNode = head;
    var currentIndex = 0;

    // 2
    while (currentNode != null && currentIndex < index) {
      currentNode = currentNode.next;
      currentIndex += 1;
    }
    return currentNode;
  }
  Node<E> insertAfter(Node<E> node, E value) {
    // 1
    if (tail == node) {
      append(value);
      return tail!;
    }

    // 2
    node.next = Node(value: value, next: node.next);
    return node.next!;
  }
  E? pop() {
    final value = head?.value;
    head = head?.next;
    if (isEmpty) {
      tail = null;
    }
    return value;
  }
  E? removeLast() {
    // 1
    if (head?.next == null) return pop();

    // 2
    var current = head;
    while (current!.next != tail) {
      current = current.next;
    }

    // 3
    final value = tail?.value;
    tail = current;
    tail?.next = null;
    return value;
  }
  E? removeAfter(Node<E> node) {
    final value = node.next?.value;
    if (node.next == tail) {
      tail = node;
    }
    node.next = node.next?.next;
    return value;
  }




  challenge1ReverseElement (  ){
    LinkedList a=this.challenge3ReverseLinkdList();
    for (final element in a) {
      print(element);
    }
  }
  challenge2FindMiddle(){
    var a=this;
    var towJumps=a.head;
    var oneJump=a.head;
    print(oneJump);
    while (towJumps?.next != null) {
      if(towJumps!.next==null){
        towJumps= towJumps.next;
      }else{
        towJumps = towJumps.next!.next;
      }

      oneJump = oneJump!.next;

    }
    print (oneJump!.value);



  }
  LinkedList challenge3ReverseLinkdList(){
    LinkedList x=this;
    LinkedList a=LinkedList();
    for (final element in x) {

      a.push(element);

    }
    x=a;
    return x;



  }
  challenge4RemoveOccurrences(){
    var currentNode=this.head;
    var val;

    while (currentNode?.next != this.tail) {
      if(currentNode?.next?.value==currentNode?.next?.next?.value||currentNode?.value==val){
        val=currentNode?.value;
        this.removeAfter(currentNode!);
      }
      if(currentNode?.next?.next==null||currentNode?.value==val){
        this.removeLast();
      }
      else{
        currentNode = currentNode!.next;
      }

    }
    print(val);
    print(this);
  }




}
class _LinkedListIterator<E> implements Iterator<E> {
  _LinkedListIterator(LinkedList<E> list) : _list = list;
  final LinkedList<E> _list;

  Node<E>? _currentNode;

  @override
  E get current => _currentNode!.value;


  bool _firstPass = true;

  @override
  bool moveNext() {
    // 1
    if (_list.isEmpty) return false;

    // 2
    if (_firstPass) {
      _currentNode = _list.head;
      _firstPass = false;
    } else {
      _currentNode = _currentNode?.next;
    }

    // 3
    return _currentNode != null;
  }

}

class Stack<E> {
  Stack() : _storage = <E>[];
  final List<E> _storage;
  void push(E element) => _storage.add(element);
  void printingStack(){
    print(_storage);
  }
  E pop() => _storage.removeLast();

  void reverse(){
    print(_storage.reversed);
  }
  bool isEmptyStack(){
    if (_storage.isEmpty){
      return true;
    }
    else{
      return false;
    }
  }
  bool isNotEmptyStack(){
    if (_storage.isNotEmpty){
      return true;
    }
    else{
      return false;
    }
  }
  bool parenthesesBa(String s){
    print(s);
    Stack a= Stack();
    s=s.replaceAll(' ','');
    var myList=s.split('');


    for (var element in myList) {
      if (element==')'&& a.isEmptyStack()){
        a.push(element);
        break;

      }
      if(element=='(' ){
        a.push(element);

      }
      if (element==')'&& a.isNotEmptyStack()){
        a.pop();

      }
    }

    if(a.isEmptyStack()){
      print('balanced parentheses');
      return true;
    }
    else{
      print('unbalanced parentheses');

      return false;
    }


  }

}