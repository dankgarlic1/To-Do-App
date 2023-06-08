
class todo{//This line declares a new class named todo using the class keyword.
  // The class will be used to represent a todo item.
  String? id;
  String? todo_text;
  bool isDone = false;
  /*
  These lines declare the instance variables id, todo_text, and isDone within the
  todo class.
  id and todo_text are of type String and are marked as nullable (String?), meaning
  they can hold a string value or null.
  isDone is of type bool and is initialized with a default value of false.
   */
  todo({
    /*
    This line declares a constructor named todo that takes named parameters.
    The parameters id and todo_text are marked as required, meaning they must be
    provided when creating a new todo object.
    The parameter isDone is an optional parameter with a default value of false.
    It can be provided when creating a new todo object, but if not provided,
    it willdefault to false.
     */
    required this.id,
    required this.todo_text,
    this.isDone=false,
});
  static List<todo>todoList (){
    /*
    This static method todoList is declared within the todo class.
    The method returns a list of todo objects (List<todo>).
    The method body creates a list of todo objects and initializes them with
    different values for id, todo_text, and isDone.
    Each todo object is created using the todo constructor with the provided
    values for id, todo_text, and isDone.
    By following this code structure, you have defined a todo class with
    instance variables and a constructor to represent a todo item.
    Additionally, the static todoList method allows you to create a list of todo
    objects with predefined values for demonstration purposes.
     */
    return [
      todo(id: '01', todo_text: 'Organize a "Starry Night Stargazing Party" ',),
      todo(id: '02', todo_text: 'Launch a cryptocurrency called "BelfortCoin" ', isDone: true),
      todo(id: '03', todo_text: 'Start a soap-making business using unconventional ingredients ',),
      todo(id: '04', todo_text: 'Train my pet scorpion to sit calmly on my shoulder',),
      todo(id: '05', todo_text: 'Practice my signature lawyer pose in front of the mirror',),
      // todo(id: '06', todo_text: 'Finish homework'),
      // todo(id: '07', todo_text: 'Read a book'),
      // todo(id: '08', todo_text: 'Buy groceries'),
      // todo(id: '09', todo_text: 'Call a friend'),
      // todo(id: '10', todo_text: 'Watch a movie'),
    ];
  }
}
