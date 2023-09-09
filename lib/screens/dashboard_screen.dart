import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app/controller/colors.dart';
import 'package:task_management_app/controller/const.dart';
import 'package:task_management_app/controller/task_provider.dart';
import 'package:task_management_app/widgets/custom_checkbox.dart';
import '../widgets/line_chart_widget.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert_rounded),
            color: Colors.black,
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Dashboard Design",
                style: subHeadLineTextStyle,
              ).animate().fade(duration: 1000.ms, delay: 500.ms),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Today, Shared by - Unbox Digital",
                style: secondaryTextStyle,
              ).animate().slideX(curve: Curves.easeIn, delay: 1000.ms),
              const SizedBox(
                height: 20,
              ),
              Material(
                elevation: 0.1,
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: CircularPercentIndicator(
                          animation: true,
                          animationDuration: 1500,
                          radius: 50,
                          lineWidth: 8,
                          percent: 0.85,
                          progressColor: greenColor,
                          backgroundColor: greenColor.withOpacity(0.08),
                          circularStrokeCap: CircularStrokeCap.round,
                          center: const Text(
                            "85%",
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.black87,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Team", style: smallTextStyle),
                          const SizedBox(
                            height: 10,
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
                            height: 15,
                          ),
                          const Text("Deadline", style: smallTextStyle),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_month_outlined,
                                color: Colors.grey.withOpacity(0.8),
                                size: 18,
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Text(
                                "July 25, 2021 - July 30, 2021",
                                style: secondaryTextStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Project Progress",
                style: subHeadLineTextStyle,
              ).animate().fade(duration: 1000.ms, delay: 500.ms),
              const SizedBox(
                height: 15,
              ),
              Column(
                children: [
                  CustomCheckBox(
                    label: 'Create user flow',
                    onChanged: (bool value) {
                      ('Checkbox state: $value');
                    },
                  ),
                  CustomCheckBox(
                    label: 'Create wireframe',
                    onChanged: (bool value) {
                      ('Checkbox state: $value');
                    },
                  ),
                  CustomCheckBox(
                    label: 'Transform to visual design',
                    onChanged: (bool value) {
                      ('Checkbox state: $value');
                    },
                  ),
                ],
              ).animate().slideY(duration: 1000.ms),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Project Overview",
                    style: subHeadLineTextStyle,
                  ).animate().slideX(curve: Curves.easeIn, delay: 1000.ms),
                  Row(
                    children: [
                      Text(
                        'Weekly',
                        style: TextStyle(
                            color: Colors.grey.withOpacity(0.7),
                            fontSize: 13,
                            fontWeight: FontWeight.w500),
                      ),
                      const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.grey,
                        size: 25,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              ProjectGraph(),
            ],
          ),
        ),
      ),
    );
  }
}
