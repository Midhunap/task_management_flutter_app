import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../controller/colors.dart';
import '../controller/task_provider.dart';

class CustomDailyTaskList extends StatefulWidget {
  const CustomDailyTaskList({
    Key? key,
    required this.text,
    required this.progressColor,
    required this.percent,
    required this.iconColor,
  }) : super(key: key);

  final String text;
  final Color progressColor;
  final double percent;
  final Color iconColor;

  @override
  State<CustomDailyTaskList> createState() => _CustomDailyTaskListState();
}

class _CustomDailyTaskListState extends State<CustomDailyTaskList> {
  bool isTapped = false;

  void _handleTap() {
    setState(() {
      isTapped = !isTapped;
    });
  }

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: _handleTap,
        child: AnimatedContainer(
          width: double.infinity,
          height: 80,
          decoration: BoxDecoration(
            color: isTapped ? Colors.grey.shade100 : Colors.white60,
            borderRadius: BorderRadius.circular(12),
          ),
          duration: const Duration(milliseconds: 10),
          child: Row(
            children: [
              Icon(
                Icons.check_circle_rounded,
                color: widget.iconColor,
              ),
              const SizedBox(
                width: 14,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Text(
                    widget.text,
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 160,
                    height: 8,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearPercentIndicator(
                        width: 160,
                        lineHeight: 8,
                        percent: widget.percent,
                        barRadius: const Radius.circular(10),
                        progressColor: widget.progressColor.withOpacity(0.8),
                        backgroundColor: Colors.grey.withOpacity(0.1),
                        animation: true,
                        animationDuration: 7000,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    for (int i = 0; i < taskProvider.imagePaths.length; i++)
                      Align(
                        widthFactor: 0.5,
                        child: CircleAvatar(
                          radius: 21,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                              radius: 18,
                              backgroundImage:
                                  AssetImage(taskProvider.imagePaths[i])),
                        ),
                      )
                  ],
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.grey,
                  size: 15,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
