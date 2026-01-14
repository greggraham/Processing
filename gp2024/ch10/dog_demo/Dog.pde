class Dog {
  String name;
  
  Dog() { }
  
  Dog(String tempName) {
    name = tempName;
  }
  
  void bark() {
    println(name + " says bow-wow!");
  }
}
