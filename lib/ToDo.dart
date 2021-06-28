import 'package:flutter/material.dart';

class ToDo extends StatefulWidget {

  @override
  _ToDoState createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
List<dynamic> lst = [1, 2, 3, 4, 5];
  var val = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: lst.length,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.greenAccent,
            margin: EdgeInsets.only(top:5),
            child: ListTile(
              title: Text("${lst[index]}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
              trailing:Container(
                width:50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 
                   GestureDetector(
                    onTap:(){
            showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Edit Item"),
                content: TextField(
                    decoration: InputDecoration(
                      hintText: "Enter new value",
                    ),
                    onChanged: (value) {
                      val = value;
                    }),
                    actions: [
                      ElevatedButton(onPressed: (){
                        setState(() {
                                   lst.replaceRange(index, index+1, {val});
                                                });
                              Navigator.of(context).pop();
                      }, child: Text("Submit")),
                      
                    ],
        
              );
            },
          );
                    
                     
                    },child: Icon(Icons.edit),
                  ),
                   GestureDetector(
                    onTap:(){
                      setState(() {
                                              lst.removeAt(index);
                                            });
                    },child: Icon(Icons.delete),
                  ),
                ],
              ),
              ),
            ),
          );
        },
      ),
  bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 50,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip:"Click me to Add",
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Add Item"),
                content: TextField(
                    decoration: InputDecoration(
                      hintText: "Enter a value",
                    ),
                    onChanged: (value) {
                      val = value;
                    }),
                    actions: [
                      ElevatedButton(onPressed: (){
                        setState(() {
                                                  lst.add(val);
                                                });
                              Navigator.of(context).pop();
                      }, child: Text("Submit")),
                      
                    ],
              );
            },
          );
        },child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}