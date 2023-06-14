import 'package:flutter/material.dart';
import 'package:to_do_list/model/todo_work.dart';
import '../constants/color.dart';
import 'package:flutter/services.dart';

class to_do_tabs extends StatelessWidget {
  final todo Todos;
  final checkbox_change;
  final delete_task;

  const to_do_tabs({Key? key, required this.Todos,required this.checkbox_change,required this.delete_task,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 30,
        right: 30,
        bottom: 20,//added so that multiple to do tabs don't stay joined
      ),
      decoration: BoxDecoration(
        // color: Colors.white,
        color: Color.fromRGBO(42, 38, 48, 1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        onTap: (){
          print("baby don't hearn me");
          checkbox_change(Todos);
        },
        leading:  Icon(
         Todos.isDone?  Icons.check_box:Icons.check_box_outline_blank,
          color: tdBlue,
        ),
        title:Text(
            Todos.todo_text!,
            /*
            The ! operator is called the "null check operator" or "bang operator"
            in Dart. It is used to assert that a nullable value is not null.
            In the code Todos.todo_text!, todo_text is declared as String?, which
            means it is nullable and can potentially hold a null value. By
            adding ! after todo_text, you are telling Dart that you are certain
            that todo_text will never be null at that point. It's a way to
            tell the compiler that you have handled the nullability case and
            you want to treat todo_text as a non-nullable string.
            Using the ! operator should be done with caution because if the value
            is actually null at runtime, it will result in a runtime error called
            a "null check exception". So, make sure that todo_text is guaranteed
            to have a non-null value before using the ! operator.
             */
            style: TextStyle(
            // color: tdBlack,
              color: Colors.white,
            decoration: Todos.isDone? TextDecoration.lineThrough:null,
              // "?" is if and ":" is else
              //added line through here so
              // that it looks task has been done since by default the check box
              // icon is checked, will add action later
        ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                Clipboard.setData(ClipboardData(text: Todos.todo_text!));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Text copied to clipboard')),
                );
              },
              icon: Icon(
                Icons.content_copy,
                color: Colors.white,
              ),
              padding: EdgeInsets.only(bottom: 1.5),
            ),
            Container(
              height: 35,
              width: 35,
              alignment: Alignment.centerRight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: tdRed,
              ),
              child: IconButton(
                onPressed: () {
                  // print("baby don't hearn me delete");
                  delete_task(Todos.id);
                },
                icon: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
                padding: EdgeInsets.only(bottom: 1.5),
              ),
            ),
          ],
        ),
        ),
    );
  }
}
