import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  final List<Map<String, dynamic>> tasks = [
    {"title": "Cook Rice and Chicken at 10 am", "isDone": false},
    {"title": "Learn ReactJS at 12 pm", "isDone": false},
    {"title": "Have Lunch at 1 pm", "isDone": false},
    {"title": "Learn HTML and CSS at 3 pm", "isDone": false},
    {"title": "Have Dinner at 8 pm", "isDone": false},
    {"title": "Have Autuome at 83 pm", "isDone": false},
    {"title": "Learn ReactJS at 12 pm", "isDone": false},
    {"title": "Have Lunch at 1 pm", "isDone": false},
    {"title": "Learn HTML and CSS at 3 pm", "isDone": false},
    {"title": "Have Dinner at 8 pm", "isDone": false},
    {
      "title":
          "Have Autuome at 83 pmffffffffffffffffasdfasfasdfasfsadfsdafasfsfasdf",
      "isDone": false
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 16),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                blurRadius: 15,
                spreadRadius: 0,
                offset: Offset(0, 4),
                color: Color(0x40000000),
              )
            ],
          ),
          child: Column(
            children: [
              // label into block
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 26, right: 20),
                child: Stack(
                  children: [
                    Text(
                      'Tasks List',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          Icons.add_circle_outline_rounded,
                          size: 28,
                          color: Color(0xFFF4C27F),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              // tasks
              Expanded(
                child: ListView.builder(
                  itemCount: tasks.length,
                  itemExtent: 40,
                  padding: const EdgeInsets.only(left: 5.0, top: 5, right: 10),
                  //physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 15, right: 40),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                tasks[index]['isDone'] =
                                    !tasks[index]['isDone'];
                              });
                            },
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOutBack,
                              width: 17,
                              height: 17,
                              decoration: BoxDecoration(
                                shape: tasks[index]['isDone']
                                    ? BoxShape.circle
                                    : BoxShape.rectangle,
                                color: tasks[index]['isDone']
                                    ? const Color(0xABF4C27F)
                                    : const Color(0xFFFFFFFF),
                                border: tasks[index]['isDone']
                                    ? null
                                    : Border.all(
                                        width: 1,
                                        color: const Color(0xFF0F4E51)),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              tasks[index]['title'],
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: const Color(0xBF000000),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
