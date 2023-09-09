import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app/controller/task_provider.dart';

import '../controller/colors.dart';
import '../controller/const.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard(
      {Key? key,
      required this.text,
      required this.daySharedBy,
      required this.date,
      required this.progressPercent,
      required this.percentText,
      required this.progressColor,
      required this.onTap})
      : super(key: key);

  final String text;
  final String daySharedBy;
  final String date;
  final double progressPercent;
  final String percentText;
  final Color progressColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    return GestureDetector(
      onTap: onTap,
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          height: 180,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(right: 15, left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      text,
                      style: smallTextStyle,
                    ).animate().slideY(curve: Curves.easeIn, delay: 1000.ms),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      daySharedBy,
                      style: secondaryTextStyle,
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    const Text("Team",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                            fontWeight: FontWeight.w700)),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: List.generate(
                        taskProvider.imagePaths.length + 1,
                        (index) {
                          if (index < taskProvider.imagePaths.length) {
                            return Transform.translate(
                              offset: Offset(-15.0 * index, -0.0 * index),
                              child: CircleAvatar(
                                radius: 18,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  backgroundImage: AssetImage(
                                      taskProvider.imagePaths[index]),
                                  radius: 16,
                                ),
                              ),
                            );
                          } else {
                            return Transform.translate(
                              offset: Offset(-15.0 * index, -0.0 * index),
                              child: const CircleAvatar(
                                radius: 18,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  backgroundColor: Colors.amberAccent,
                                  radius: 16,
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                      ).toList(),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_month_outlined,
                          color: Colors.grey.withOpacity(0.8),
                          size: 18,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          date,
                          style: secondaryTextStyle,
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, right: 15),
                  child: CircularPercentIndicator(
                    animation: true,
                    radius: 40,
                    lineWidth: 7,
                    percent: progressPercent,
                    progressColor: progressColor,
                    backgroundColor: progressColor.withOpacity(0.08),
                    circularStrokeCap: CircularStrokeCap.round,
                    center: Text(
                      percentText,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
