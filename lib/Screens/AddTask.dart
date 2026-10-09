import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _descController = TextEditingController();


  final Boxs = Hive.box('tasks');

  void _saveTask() {
    String name = _nameController.text.trim();
    String desc = _descController.text.trim();

    if (name.isNotEmpty) {
      Boxs.add({
        'name': name,
        'description': desc,
        'isCompleted': false,
      });

      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please enter task name')));
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xff121212),

      appBar: AppBar(
        backgroundColor:  Color(0xff121212),
        elevation: 0,

        leading: Padding(
          padding:  EdgeInsets.only(left: 8),
          child: IconButton(
            style: IconButton.styleFrom(
              backgroundColor:  Color(0xff242424),
            ),
            icon:  Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
              size: 18,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),

        title:  Text(
          'New Task',
          style: TextStyle(
            color: Colors.white,
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.fromLTRB(20, 10, 20, 20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
               Text(
                'Create a new task',
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),

               SizedBox(height: 28),

               Text(
                'Task Name',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),

               SizedBox(height: 9),

              TextField(
                controller: _nameController,

                style:  TextStyle(color: Colors.white, fontSize: 14),

                decoration: InputDecoration(
                  hintText: 'Name at Task',

                  hintStyle:  TextStyle(color: Colors.grey, fontSize: 13),

                  prefixIcon:  Icon(
                    Icons.task_alt,
                    color: Colors.grey,
                    size: 20,
                  ),

                  filled: true,
                  fillColor:  Color(0xff202020),

                  contentPadding:  EdgeInsets.symmetric(
                    vertical: 17,
                    horizontal: 15,
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide:  BorderSide(
                      color: Color(0xFF00A86B),
                      width: 1.2,
                    ),
                  ),
                ),
              ),

               SizedBox(height: 24),

              // Description
               Text(
                'Task Description',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),

               SizedBox(height: 9),

              TextField(
                controller: _descController,

                maxLines: 5,

                style:  TextStyle(color: Colors.white, fontSize: 13),

                decoration: InputDecoration(
                  hintText:
                      'Describe Your Task',

                  hintStyle:  TextStyle(color: Colors.grey, fontSize: 12),

                  prefixIcon:  Padding(
                    padding: EdgeInsets.only(bottom: 65),
                    child: Icon(
                      Icons.description_outlined,
                      color: Colors.grey,
                      size: 20,
                    ),
                  ),

                  filled: true,
                  fillColor:  Color(0xff202020),

                  contentPadding:  EdgeInsets.all(16),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide:  BorderSide(
                      color: Color(0xFF00A86B),
                      width: 1.2,
                    ),
                  ),
                ),
              ),

             SizedBox(height: 25,),
              // Add Task Button
              SizedBox(
                width: double.infinity,
                height: 52,

                child: ElevatedButton.icon(
                  onPressed: _saveTask,

                  icon:  Icon(Icons.add, size: 21),

                  label:  Text(
                    'Add Task',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),

                  style: ElevatedButton.styleFrom(
                    backgroundColor:  Color(0xFF00A86B),

                    foregroundColor: Colors.white,

                    elevation: 0,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
