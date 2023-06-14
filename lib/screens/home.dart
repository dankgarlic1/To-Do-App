
import 'package:flutter/material.dart';
import 'package:to_do_list/model/todo_work.dart';
import '../constants/color.dart';
import '../widgets/to_do_tabs.dart';
import 'package:url_launcher/url_launcher.dart';

/*
The two dots (..) in the path mean "go up one level in the directory tree",
so the relative path is specifying the location of the file relative to the
 current working directory.
 */

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final todos_list = todo.todoList();
  final todo_controller_addTasks= TextEditingController();
  /*
  The variable `final_todoList` was added to the code to store the filtered list
  of tasks that will be displayed based on the search functionality.
  Initially, the `final_todoList` is an empty list. It is later updated when the
  user performs a search by entering a keyword in the search bar. The
  `search_tasks` function filters the `todos_list` based on the entered keyword
  and assigns the filtered results to the `final_todoList`.
  By using `final_todoList` to display the tasks in the `ListView` widget, only
  the filtered tasks will be shown when the user searches for specific keywords.
  This ensures that the UI reflects the updated list of tasks based on the
  search criteria.
   */
  List<todo>final_todoList=[];

  @override
  void initState() {
    /*
     the initState method is overridden to assign the initial value of
     final_todoList to be equal to todos_list. This means that when the widget
     is first created and inserted into the widget tree, final_todoList will
     contain the same list of tasks as todos_list.
     The reason for assigning todos_list to final_todoList in the initState
     method is to ensure that the initial state of the widget is set correctly.
     By doing so, the initial state of the UI will display all the tasks from
     todos_list. Later, when the user performs a search or any other operation
     that modifies the final_todoList, the UI will reflect the updated state.
     Calling super.initState() is necessary to ensure that the base class's
     initState method is also executed, which performs essential initialization
     tasks for the widget's state.
     */
    // TODO: implement initState
    final_todoList=todos_list;
    super.initState();
  }

  /*
   final todos_list = todo.todoList(); declares a final variable named
   todos_list and assigns it the value returned by the todoList() method of the
   todo class. The todoList() method returns a list of todo objects.
   The purpose of declaring todos_list as final is to make it a read-only
   variable, meaning its value cannot be changed once assigned. This is often
   used when you have a variable that you don't want to be modified accidentally
    or unintentionally.
   */
  bool isClicked=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // backgroundColor: td_BG_Color,
      backgroundColor: Color.fromRGBO(28, 30, 19,1),
      appBar: buildAppBar(context), //refactored it by extract method
      drawer: Drawer(
        backgroundColor:Color.fromRGBO(28, 30, 19,1),
        child: DrawerHeader(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
          ListTile(
          leading: const Icon(
          size: 35,
            Icons.gavel_sharp,
            color: Color.fromRGBO(114, 143, 206, 1),
          ),
          title: const Text(
            'I Give Justice',
            style: TextStyle(
              color: Color.fromRGBO(114, 143, 206, 1),
              fontSize: 20,
            ),
          ),
          onTap: () {
            launch('https://www.youtube.com/shorts/PDc8DN4p3eg');
          },
          ),
              ListTile(
                title: const Text(
                    'I Drive',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromRGBO(114, 143, 206, 1),
                  ),
                ),
                leading: const Icon(
                  size: 35,
                    Icons.drive_eta,
                  color: Color.fromRGBO(114, 143, 206, 1),

                ),
                onTap: () {
                  launch('https://www.youtube.com/shorts/Jul_Bs_JRRU');

                },
              ),
              ListTile(
                leading: const Icon(
                  size: 35,
                    Icons.dangerous_rounded,
                  color: Color.fromRGBO(114, 143, 206, 1),
                ),
                title: const Text(
                    'I Fight',
                style: TextStyle(
                  color: Color.fromRGBO(114, 143, 206, 1),
                  fontSize: 20,
                ),
                ),
                onTap: () {
                  launch('https://www.youtube.com/shorts/Tu6F4xLC26o');
                },
              ),
              ListTile(
                leading: const Icon(
                  size: 35,
                    Icons.monetization_on_sharp,
                  color: Color.fromRGBO(114, 143, 206, 1),
                ),
                title: const Text(
                    'I Sell ',
                style: TextStyle(
                  color: Color.fromRGBO(114, 143, 206, 1),
                  fontSize: 20,
                ),
                ),
                onTap: () {
                  launch('https://www.youtube.com/shorts/dzTKsyHVM9M');
                },
              ),
              ListTile(
                leading: const Icon(
                  size: 35,
                    Icons.color_lens_sharp,
                  color: Color.fromRGBO(114, 143, 206, 1),
                ),
                title: const Text(
                    'I am Art',
                style: TextStyle(
                  color: Color.fromRGBO(114, 143, 206, 1),
                  fontSize: 20,
                ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  launch('https://www.youtube.com/shorts/tM0L8RZwe1c');
                },
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            child: Column(
              children: [
                searchBox(),
                Expanded(
                  child: ListView(//list view also adds scrolling functionality
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 50,
                          bottom: 20,
                          left: 15,
                        ),
                        child:Row(
                          children: [
                            Icon(
                              Icons.home_outlined,
                              color: Color.fromRGBO(114, 143, 206, 1),
                              size: 50,
                            ),
                            Text(
                              " All Tasks",
                              style: TextStyle(
                                color: Color.fromRGBO(114, 143, 206, 1),
                                fontSize: 38,
                                fontWeight: FontWeight.w500,

                              ),
                            ),
                          ],
                        ),
                      ),
                      //Creating a widget for to do task apps, making a file new
                      // directory called widget
                      for(todo Todoss in final_todoList.reversed)
                        /*
                        final_todoList.reversed returns an iterable that
                        represents the reversed version of the final_todoList
                        list. It allows iterating over the elements in reverse
                        order.
                        todo Todoss is the loop variable. It represents each
                        element in the final_todoList list as the loop
                        progresses. The loop variable Todoss is of type todo,
                        which seems to be a custom class representing a task.
                        Inside the loop, a new instance of the to_do_tabs widget
                        is created, and the corresponding element from the
                        final_todoList list is passed as the Todos parameter.
                        This means that for each task in the final_todoList, a
                        new to_do_tabs widget is created, and the specific data
                        for that task is displayed.
                        In summary, this for loop is responsible for creating
                        multiple instances of the to_do_tabs widget, each
                        representing a different task from the final_todoList
                        list. By iterating in reverse order, the tasks will be
                        displayed in the reverse order of their appearance in
                        the list.
                         */
                      to_do_tabs(
                        Todos: Todoss,
                        checkbox_change: checkbox_function,
                        delete_task: delete_function,
                      ),//first Todos is from for loop and
                      // other one is from "final todo Todos;" from to_do_tabs file
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                   margin: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
                   padding: const EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 5),
                   decoration: BoxDecoration(
                     // color: Colors.white,
                     color: Color.fromRGBO(42, 38, 48, 1),
                     borderRadius: BorderRadius.circular(15),
                     border: Border.all(
                       color: Color.fromRGBO(42, 38, 48, 1),
                     ),
                     boxShadow: const [
                        BoxShadow(
                          // color: Colors.grey,
                          // color: Color.fromRGBO(42, 38, 48, 1),
                          spreadRadius: 0,
                          offset: Offset(0, 0),
                          blurRadius: 10,
                        ),
                     ],
                   ),
                    child: TextField(
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      controller: todo_controller_addTasks,
                      autocorrect: true,
                      decoration: InputDecoration(
                        hintText: "Add your Tasks here...",
                        hintStyle: TextStyle(
                          // color: Colors.white,
                          color: Color.fromRGBO(114, 143, 206, 1),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 20,bottom: 20),
                  // padding: EdgeInsets.,
                  padding: const EdgeInsets.only(top: 5,bottom: 5),
                  child: ElevatedButton(
                      onPressed: (){
                        task_add(todo_controller_addTasks.text);
                      },
                      child:  Text(
                          "+",
                        style: TextStyle(
                          fontSize: 40,
                        ),
                      ),
                    style: ElevatedButton.styleFrom(
                      primary: tdBlue,
                      // primary: Color.fromRGBO(114, 143, 206, 1),
                      // primary: Colors.deepPurple,

                      // primary:Color.fromRGBO(114, 143, 206, 1) ,
                      minimumSize: const Size(60,60),
                      elevation: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //function for checkbox
  void checkbox_function(todo checkbox_done){
    setState(() {
      checkbox_done.isDone = !checkbox_done.isDone;
      // It means that the isDone
      // property of the checkbox_done object will be toggled/inverted. If it was
      // true, it will be set to false, and if it was false, it will be set to true.
      // NOTE it is NOT " != " operator which means inequality, we are using "!"
      //this operator which inverts
    });
  }

  //function for delete
  void delete_function(String id){
    setState(() {
      todos_list.removeWhere((element) => element.id == id);
      /*
      The delete_function takes a String parameter id, which represents the id
      of the todo item to be deleted.
      Inside the setState method, the todos_list is modified using the
      removeWhere method. The removeWhere method takes a callback function as an
      argument, which is executed for each element in the list.
      The callback function (element) => element.id == id compares the id of each
      todo item with the provided id. If a match is found, that element is
      considered for removal.
      If a todo item's id matches the provided id, it will be removed from the
      todos_list.
      Finally, the setState function is called to notify the framework that the
      state has changed. This triggers a rebuild of the UI, ensuring that the
      changes in the todos_list are reflected in the user interface.
      By using setState and modifying the todos_list, you ensure that the
      changes are properly propagated to the UI, and the deleted todo item will
      be removed from the displayed list.
       */
    });
  }

  //function for adding tasks
  void task_add(String todo_addTask){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Text added Successfully')),
    );
    setState(() {
      todos_list.add(todo(id: DateTime.now().microsecondsSinceEpoch.toString(), todo_text: todo_addTask));
      //we need unique id for every task so i decided to use timestamp, it
      //records time in MICRO seconds and converts them into string to be used as
      // id
    });
    todo_controller_addTasks.clear();//when we add the task the text we wrote in
    //text field should be cleared
  }
  //Added a new method search_tasks to perform the search and update the list
  // of displayed tasks:
  void search_tasks(String keyword_task){
    List <todo> Results=[];
    if(keyword_task.isEmpty){
      Results=todos_list;
    }
    else{
      Results=todos_list.where((element) => element.todo_text!.toLowerCase().contains(keyword_task.toLowerCase())).toList();
    }
    setState(() {
      final_todoList=Results;
    });
  }

Widget searchBox(){
  return Container(
    margin: const EdgeInsets.fromLTRB(20, 30, 20, 0),
    padding: const EdgeInsets.only(right: 20),
    width: double.infinity,
    height: 45,
    decoration: BoxDecoration(
      // color: Colors.white,
      color: Color.fromRGBO(42, 38, 48, 1),
      borderRadius: BorderRadius.circular(25),
    ),
    child:  TextField(
      /*
      Why it was added:
        The purpose of adding the onChanged callback is to respond to changes in
        the text input of the TextField.
        When the user types or modifies the text in the TextField, the onChanged
        callback will be triggered.

      What it does:
        (element) => search_tasks(element) is a lambda function
        (anonymous function) that takes a single argument element and calls the
        search_tasks method with element as its argument.
        search_tasks is a method defined in the _HomeState class, which is the
        state class for the Home widget.
        The purpose of calling search_tasks is to perform a search operation
        based on the input text.
        The element argument represents the current text value entered by the
        user in the TextField.
        By calling search_tasks with the current text value, the search
        operation can be executed and the results can be updated accordingly.
        In summary, the onChanged callback is used to detect and respond to
        changes in the text input of the TextField. When the user types or
        modifies the text, the search_tasks method is called to perform a search
         operation based on the input text.
       */
      style: TextStyle(
        color: Colors.white,
      ),
      onChanged:(element) => search_tasks(element),
      decoration: InputDecoration(
          border: InputBorder.none,//removing black line under search bar
          prefixIcon: Icon(
            // color: Colors.white,
            color: Color.fromRGBO(114, 143, 206, 1),
            Icons.search,
          ),
          hintText:"Search your Tasks here ...",
          hintStyle: TextStyle(
            // color: Colors.white,
            color: Color.fromRGBO(114, 143, 206, 1),

          ),

      ),
    ),
  );
}

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,//to remove the shadow between appbar and body
      backgroundColor: Color.fromRGBO(28, 30, 19,1),
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          color: Color.fromRGBO(114, 143, 206, 1),
          size: 35,
        ),
        onPressed: () {
          // Scaffold.of(context).openDrawer();
          _scaffoldKey.currentState?.openDrawer();
        },
      ),
      title:Row(
        children:  <Widget> [
          // Icon(
          //   Icons.menu,
          //   // color: Colors.white,
          //   color: Color.fromRGBO(114, 143, 206, 1),
          //   size: 35,
          // ),

          Spacer(),//The Spacer widget will take up any remaining free
          // space within its parent container after all other children have
          // been laid out. It effectively divides up the available space
          // between widgets and can be used to create more even or
          // proportional spacing between widgets.
          // Container(
          //   height: 50,
          //   width: 50,
          //   decoration: const BoxDecoration(
          //     shape: BoxShape.circle,
          //     image: DecorationImage(
          //       fit: BoxFit.cover,//This will scale the image to cover the
          //       // entire area of the widget's bounds while maintaining the
          //       // aspect ratio of the image. The entire image may not be
          //       // visible, but it will cover the entire area without any
          //       // blank space. This can cause some parts of the image to be
          //       // cropped if the aspect ratio of the widget is different from
          //       // the aspect ratio of the image.
          //       image: AssetImage(
          //           'assets/images/avatar2.jpg'
          //       ),
          //     ),
          //   ),
          // ),
          //all the code which has been commented above was done to do the same
          // thing which circle avatar didA
          GestureDetector(
            onTap: () {
              setState(() {
                isClicked = !isClicked;
              });
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => enlarge_image()),
              );
            },
            child: isClicked==false || true?  CircleAvatar(
              radius: 25,
              backgroundImage:  AssetImage('assets/images/imp.jpeg'),
            ): Container(),
          ),

        ],
      ),
    );
  }
}
class enlarge_image extends StatefulWidget {
  const enlarge_image({super.key});

  @override
  State<enlarge_image> createState() => _enlarge_imageState();
}

class _enlarge_imageState extends State<enlarge_image> {
  // bool isClicked1=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        // child:  GestureDetector(
        //   onTap: () {
        //     setState(() {
        //       isClicked1 = !isClicked1;
        //     });
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => Home()),
        //     );
        //   },
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             // ElevatedButton.icon(
             //   icon: Image.asset(
             //     'assets/images/imp.jpeg',
             //     alignment: Alignment.center,
             //     width: 300,
             //     height: 600,
             //     fit: BoxFit.contain,
             //   ),
             //   onPressed: (){
             //     Navigator.pop(context);
             //   },
             //   label: const Text(''),
             // ),
             GestureDetector(
               onTap: () {
                 Navigator.pop(context);
               },
               child: Image.asset('assets/images/imp.jpeg'),
             ),
           ],
         ),
       //),
      ),
    );
  }
}
