import 'package:flutter/material.dart';

class todo extends StatefulWidget {
  const todo({super.key});

  @override
  State<todo> createState() => _todoState();
}

class _todoState extends State<todo> {
  final _controller = TextEditingController();
  todoPriority priority = todoPriority.Normal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Tasks'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addTodo();
        },
        child: Icon(Icons.add),
      ),
      body: MyTodo.todos.isEmpty
          ? Center(
              child: Text('Nothing To do!'),
            )
          : ListView.builder(
              itemCount: MyTodo.todos.length,
              itemBuilder: (context, index) {
                final todo = MyTodo.todos[index];
                return todoitem(
                    todo: todo,
                    onChanged: (value) {
                      setState(() {
                        MyTodo.todos[index].completed = value;
                      });
                    });
              },
            ),
    );
  }



  void addTodo() {
    showModalBottomSheet(
        context: context,
        // isScrollControlled: true,
        builder: (context) => StatefulBuilder(
              builder: (context, setBuilderState) => Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _controller,
                      decoration: InputDecoration(hintText: 'what to do?'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Priority'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Radio<todoPriority>(
                          value: todoPriority.Low,
                          groupValue: priority,
                          onChanged: (value) {
                            setBuilderState(() {
                              priority = value!;
                            });
                          },
                        ),
                        Text(todoPriority.Low.name),
                        Radio<todoPriority>(
                          value: todoPriority.Normal,
                          groupValue: priority,
                          onChanged: (value) {
                            setBuilderState(() {
                              priority = value!;
                            });
                          },
                        ),
                        Text(todoPriority.Normal.name),
                        Radio<todoPriority>(
                          value: todoPriority.High,
                          groupValue: priority,
                          onChanged: (value) {
                            setBuilderState(() {
                              priority = value!;
                            });
                          },
                        ),
                        Text(todoPriority.High.name),
                      ],
                    ),
                    ElevatedButton(onPressed: _save, child: Text('save'),
                    )

                  ],
                ),
              ),
            ));
  }

  void _save() {
    if(_controller.text.isEmpty){
      showMsg(context,'Input must not be empty');
      return;
    }
    final todo = MyTodo(
        id: DateTime.now().millisecondsSinceEpoch,
        name: _controller.text,
        priority: priority,
    );
    MyTodo.todos.add(todo);
    _controller.clear();
    setState(() {});
    Navigator.pop(context);
  }
}

void showMsg(BuildContext context, String s) {
  showDialog(context: context, builder: (context)=> AlertDialog(
    title: Text('Caution!'),
    content: Text(s),
    actions: [
      TextButton(onPressed: () => Navigator.pop(context),
      child: Text('Close'),
      ),
    ],
  ));
}

class todoitem extends StatelessWidget {
  final MyTodo todo;
  final Function(bool) onChanged;

  const todoitem({super.key, required this.todo, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        title: Text(todo.name),
        subtitle: Text('Priority:${todo.priority.name} '),
        value: todo.completed,
        onChanged: (value) {
          onChanged(value!);
        });
  }
}

class MyTodo {
  int id;
  String name;
  bool completed;
  todoPriority priority;

  MyTodo({
    required this.id,
    required this.name,
    this.completed = false,
    required this.priority,
  });

  static List<MyTodo> todos = [];
}

enum todoPriority { Low, Normal, High }
