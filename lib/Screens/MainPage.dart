import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'AddTask.dart';
class MainPage extends StatefulWidget {
  final String name;

  const MainPage({super.key, required this.name});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final Boxs = Hive.box('tasks');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFF101010),

      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: Boxs.listenable(),

          builder: (context, Box box, _) {
            List tasks = box.values.toList();

            int totalTasks = tasks.length;

            int completedTasks = tasks
                .where((task) => task['isCompleted'] == true)
                .length;

            double percentage = totalTasks == 0
                ? 0.0
                : completedTasks / totalTasks;

            return Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20, vertical: 18),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Row(
                            children: [
                              Text(
                                'WELCOME, ${widget.name} 👋                   ',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),

                              Lottie.asset(
                                'assets/Welcome (1).json',
                                width: 100,
                                height: 100,
                                //fit: BoxFit.fill,
                              ),
                            ],
                          ),

                          const SizedBox(height: 6),

                          Text(
                            'One task at a time',
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),

                      Container(
                        padding: const EdgeInsets.all(10),

                        decoration: BoxDecoration(
                          color: const Color(0xFF1E1E1E),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 28),


                  Row(
                    children: [
                      const Text(
                        'Yuhuu, Your work is\n         almost done!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          height: 1.2,
                        ),
                      ),

                      Lottie.asset(
                        'assets/technology rocekt business rise.json',
                        width: 50,
                        height: 50,
                        //fit: BoxFit.fill,
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),

                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF1F1F1F), Color(0xFF181818)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),

                      borderRadius: BorderRadius.circular(20),

                      border: Border.all(color: Colors.white.withOpacity(0.05)),
                    ),

                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              const Text(
                                'Achieved Tasks',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 8),

                              Text(
                                '$completedTasks out of $totalTasks done',
                                style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: 13,
                                ),
                              ),

                              const SizedBox(height: 15),

                              // Small progress bar
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),

                                child: LinearProgressIndicator(
                                  value: percentage,
                                  minHeight: 6,
                                  backgroundColor: Colors.grey[800],
                                  valueColor:
                                      const AlwaysStoppedAnimation<Color>(
                                        Color(0xFF00A86B),
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(width: 20),

                        SizedBox(
                          width: 65,
                          height: 65,

                          child: Stack(
                            alignment: Alignment.center,

                            children: [
                              SizedBox(
                                width: 65,
                                height: 65,

                                child: CircularProgressIndicator(
                                  value: percentage,
                                  strokeWidth: 7,
                                  backgroundColor: Colors.grey[800],

                                  valueColor:
                                      const AlwaysStoppedAnimation<Color>(
                                        Color(0xFF00A86B),
                                      ),
                                ),
                              ),

                              Text(
                                '${(percentage * 100).toInt()}%',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 28),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      const Text(
                        'My Tasks',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(
                        '$totalTasks Tasks',
                        style: TextStyle(color: Colors.grey[500], fontSize: 13),
                      ),
                    ],
                  ),

                   SizedBox(height: 14),

                  Expanded(
                    child: totalTasks == 0
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: [
                                Lottie.asset(
                                  'assets/Successful animation (1).json',
                                  width: 200,
                                  height: 200,
                                  //fit: BoxFit.fill,
                                ),

                                SizedBox(height: 15),

                                Text(
                                  'No tasks yet!',
                                  style: TextStyle(
                                    color: Colors.grey[400],
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),

                                SizedBox(height: 5),

                                Text(
                                  'Add your first task below',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : ListView.builder(
                            physics:  BouncingScrollPhysics(),

                            itemCount: totalTasks,

                            itemBuilder: (context, index) {
                              var task = tasks[index];

                              var taskKey = box.keyAt(index);

                              bool isCompleted = task['isCompleted'] == true;

                              return Container(
                                margin: EdgeInsets.only(bottom: 12),

                                decoration: BoxDecoration(
                                  color: const Color(0xFF1C1C1C),
                                  borderRadius: BorderRadius.circular(16),

                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.04),
                                  ),
                                ),

                                child: ListTile(
                                  contentPadding:  EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),

                                  // Checkbox
                                  leading: Checkbox(
                                    value: isCompleted,

                                    activeColor:  Color(0xFF00A86B),

                                    checkColor: Colors.white,

                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),

                                    onChanged: (bool? value) {
                                      Boxs.put(taskKey, {
                                        'name': task['name'],
                                        'description': task['description'],
                                        'isCompleted': value,
                                      });
                                    },
                                  ),

                                  // Task Name
                                  title: Text(
                                    task['name'] ?? 'No name',

                                    style: TextStyle(
                                      color: isCompleted
                                          ? Colors.grey
                                          : Colors.white,

                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,

                                      decoration: isCompleted
                                          ? TextDecoration.lineThrough
                                          : null,
                                    ),
                                  ),

                                  // Description
                                  subtitle: Padding(
                                    padding:  EdgeInsets.only(top: 5),

                                    child: Text(
                                      task['description'] ?? '',

                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,

                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),

                                  // Delete
                                  trailing: IconButton(
                                    icon:  Icon(
                                      Icons.delete_outline,
                                      color: Colors.redAccent,
                                      size: 21,
                                    ),

                                    onPressed: () {
                                      Boxs.delete(taskKey);
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                  ),

                  SizedBox(height: 12),

                  SizedBox(
                    width: double.infinity,
                    height: 54,

                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF00A86B),
                        foregroundColor: Colors.white,

                        elevation: 0,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),

                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  AddTask(),
                          ),
                        );
                      },

                      icon:  Icon(Icons.add, size: 22),

                      label:  Text(
                        'Add New Task',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
