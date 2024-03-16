/*import 'package:flutter/material.dart';

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
*/
/*import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  const Todo({Key? key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  final _controller = TextEditingController();
  TodoPriority priority = TodoPriority.Normal;

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
          return TodoItem(
            todo: todo,
            onChanged: (value) {
              setState(() {
                MyTodo.todos[index].completed = value;
              });
            },
          );
        },
      ),
    );
  }

  void addTodo() {
    showModalBottomSheet(

      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setBuilderState) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'What to do?',
                  border: OutlineInputBorder(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text('Priority'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio<TodoPriority>(
                    value: TodoPriority.Low,
                    groupValue: priority,
                    onChanged: (value) {
                      setBuilderState(() {
                        priority = value!;
                      });
                    },
                  ),
                  Text(TodoPriority.Low.name),
                  Radio<TodoPriority>(
                    value: TodoPriority.Normal,
                    groupValue: priority,
                    onChanged: (value) {
                      setBuilderState(() {
                        priority = value!;
                      });
                    },
                  ),
                  Text(TodoPriority.Normal.name),
                  Radio<TodoPriority>(
                    value: TodoPriority.High,
                    groupValue: priority,
                    onChanged: (value) {
                      setBuilderState(() {
                        priority = value!;
                      });
                    },
                  ),
                  Text(TodoPriority.High.name),
                ],
              ),
              ElevatedButton(
                onPressed: _save,
                child: Text('Save'),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _save() {
    if (_controller.text.isEmpty) {
      showMsg(context, 'Input must not be empty');
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
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Caution!'),
      content: Text(s),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Close'),
        ),
      ],
    ),
  );
}

class TodoItem extends StatelessWidget {
  final MyTodo todo;
  final Function(bool) onChanged;

  const TodoItem({Key? key, required this.todo, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: CheckboxListTile(
        title: Text(
          todo.name,
          style: TextStyle(
            decoration: todo.completed ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Text('Priority: ${todo.priority.name}'),
        value: todo.completed,
          onChanged: (value) {
            onChanged(value!);
          }
      ),
    );
  }
}

class MyTodo {
  int id;
  String name;
  bool completed;
  TodoPriority priority;

  MyTodo({
    required this.id,
    required this.name,
    this.completed = false,
    required this.priority,
  });

  static List<MyTodo> todos = [];
}

enum TodoPriority { Low, Normal, High }

*/
/*import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  const Todo({Key? key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  final _controller = TextEditingController();
  TodoPriority priority = TodoPriority.Normal;

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
          return TodoItem(
            todo: todo,
            onChanged: (value) {
              setState(() {
                MyTodo.todos[index].completed = value;
              });
            },
            onDelete: () {
              setState(() {
                MyTodo.todos.removeAt(index);
              });
            },
          );
        },
      ),
    );
  }

  void addTodo() {
    showModalBottomSheet(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setBuilderState) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'What to do?',
                  border: OutlineInputBorder(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text('Priority'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio<TodoPriority>(
                    value: TodoPriority.Low,
                    groupValue: priority,
                    onChanged: (value) {
                      setBuilderState(() {
                        priority = value!;
                      });
                    },
                  ),
                  Text(TodoPriority.Low.name),
                  Radio<TodoPriority>(
                    value: TodoPriority.Normal,
                    groupValue: priority,
                    onChanged: (value) {
                      setBuilderState(() {
                        priority = value!;
                      });
                    },
                  ),
                  Text(TodoPriority.Normal.name),
                  Radio<TodoPriority>(
                    value: TodoPriority.High,
                    groupValue: priority,
                    onChanged: (value) {
                      setBuilderState(() {
                        priority = value!;
                      });
                    },
                  ),
                  Text(TodoPriority.High.name),
                ],
              ),
              ElevatedButton(
                onPressed: _save,
                child: Text('Save'),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _save() {
    if (_controller.text.isEmpty) {
      showMsg(context, 'Input must not be empty');
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
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Caution!'),
      content: Text(s),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Close'),
        ),
      ],
    ),
  );
}

class TodoItem extends StatelessWidget {
  final MyTodo todo;
  final Function(bool) onChanged;
  final VoidCallback onDelete;

  const TodoItem({
    Key? key,
    required this.todo,
    required this.onChanged,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          todo.name,
          style: TextStyle(
            decoration: todo.completed ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Text('Priority: ${todo.priority.name}'),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: onDelete,
        ),
        leading: Checkbox(
          value: todo.completed,
          onChanged: (value) {
            onChanged(value!);
          },
        ),
      ),
    );
  }
}

class MyTodo {
  int id;
  String name;
  bool completed;
  TodoPriority priority;

  MyTodo({
    required this.id,
    required this.name,
    this.completed = false,
    required this.priority,
  });

  static List<MyTodo> todos = [];
}

enum TodoPriority { Low, Normal, High }

*/
import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Todo extends StatefulWidget {
  const Todo({Key? key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  final _controller = TextEditingController();
  TodoPriority priority = TodoPriority.Normal;
  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    _loadTodoList();
  }

  Future<void> _loadTodoList() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      MyTodo.todos = _prefs.getStringList('todos')?.map((e) => MyTodo.fromJson(e)).toList() ?? [];
    });
  }

  Future<void> _saveTodoList() async {
    List<String> todosJson = MyTodo.todos.map((e) => jsonEncode(e.toJson())).toList();
    await _prefs.setStringList('todos', todosJson);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // resize body to avoid keyboard
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
      body: SingleChildScrollView( // wrap the Scaffold body in SingleChildScrollView
        child: MyTodo.todos.isEmpty
            ?
        Center(
          child: Text('Nothing To do!',style: TextStyle(fontSize: 18),),
        )
            : ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: MyTodo.todos.length,
          itemBuilder: (context, index) {
            final todo = MyTodo.todos[index];
            return TodoItem(
              todo: todo,
              onChanged: (value) {
                setState(() {
                  MyTodo.todos[index].completed = value;
                  _saveTodoList();
                });
              },
              onDelete: () {
                setState(() {
                  MyTodo.todos.removeAt(index);
                  _saveTodoList();
                });
              },
            );
          },
        ),
      ),
    );
  }

  void addTodo() {
    showModalBottomSheet(
      isScrollControlled: true, // enable scrolling in the bottom sheet
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setBuilderState) => Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom, // adjust for keyboard
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'What to do?',
                  border: OutlineInputBorder(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text('Priority'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio<TodoPriority>(
                    value: TodoPriority.Low,
                    groupValue: priority,
                    onChanged: (value) {
                      setBuilderState(() {
                        priority = value!;
                      });
                    },
                  ),
                  Text(TodoPriority.Low.name),
                  Radio<TodoPriority>(
                    value: TodoPriority.Normal,
                    groupValue: priority,
                    onChanged: (value) {
                      setBuilderState(() {
                        priority = value!;
                      });
                    },
                  ),
                  Text(TodoPriority.Normal.name),
                  Radio<TodoPriority>(
                    value: TodoPriority.High,
                    groupValue: priority,
                    onChanged: (value) {
                      setBuilderState(() {
                        priority = value!;
                      });
                    },
                  ),
                  Text(TodoPriority.High.name),
                ],
              ),
              ElevatedButton(
                onPressed: _save,
                child: Text('Save'),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _save() {
    if (_controller.text.isEmpty) {
      showMsg(context, 'Input must not be empty');
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
    _saveTodoList(); // save the todo list after adding a new todo
    Navigator.pop(context);
  }
}

void showMsg(BuildContext context, String s) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Caution!'),
      content: Text(s),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Close'),
        ),
      ],
    ),
  );
}

class TodoItem extends StatelessWidget {
  final MyTodo todo;
  final Function(bool) onChanged;
  final VoidCallback onDelete;

  const TodoItem({
    Key? key,
    required this.todo,
    required this.onChanged,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          todo.name,
          style: TextStyle(
            decoration: todo.completed ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Text('Priority: ${todo.priority.name}'),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: onDelete,
        ),
        leading: Checkbox(
          value: todo.completed,
          onChanged: (value) {
            onChanged(value!);
          }
        ),
      ),
    );
  }
}

class MyTodo {
  int id;
  String name;
  bool completed;
  TodoPriority priority;

  MyTodo({
    required this.id,
    required this.name,
    this.completed = false,
    required this.priority,
  });

  factory MyTodo.fromJson(String json) {
    final map = jsonDecode(json);
    return MyTodo(
      id: map['id'],
      name: map['name'],
      completed: map['completed'],
      priority: TodoPriority.values[map['priority']],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'completed': completed,
      'priority': priority.index,
    };
  }

  static List<MyTodo> todos = [];
}

enum TodoPriority { Low, Normal, High }

void main() {
  runApp(MaterialApp(
    home: Todo(),
  ));
}
