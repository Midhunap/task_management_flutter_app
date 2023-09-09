import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:task_management_app/screens/project_screen/all_projects.dart';
import 'package:task_management_app/screens/project_screen/completed_projects.dart';
import 'package:task_management_app/screens/project_screen/ongoing_projects.dart';
import 'package:task_management_app/widgets/project_card.dart';
import '../controller/colors.dart';
import '../controller/const.dart';

class ProjectScreen extends StatefulWidget {
  ProjectScreen({Key? key}) : super(key: key);

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  var tabSelectedIndex = 0;
  final textTabToggle = ["All", "Ongoing", "Completed"];

  final List<Widget> projectPages = const [
    AllProjects(),
    OngoingProject(),
    CompletedProjects(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 25,
              ),
              //circular avatar and search icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage("assets/users/img1.jpg")),
                  IconButton(
                    icon: const Icon(
                      Icons.search_rounded,
                      color: Colors.grey,
                      size: 35,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              //project title
              const Text(
                "Project",
                style: subHeadLineTextStyle,
              ).animate().fade(duration: 1000.ms, delay: 500.ms),
              const SizedBox(
                height: 25,
              ),
              //project toggle tab for allprojects,ongoing and completed
              SizedBox(
                height: 30,
                width: double.infinity,
                child: FlutterToggleTab(
                  width: 90,
                  borderRadius: 15,
                  height: 40,
                  selectedTextStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                  unSelectedBackgroundColors: const [
                    Colors.white,
                    Colors.white,
                  ],
                  selectedBackgroundColors: const [purpleColor],
                  unSelectedTextStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                  labels: textTabToggle,
                  selectedIndex: tabSelectedIndex,
                  selectedLabelIndex: (index) {
                    setState(() {
                      tabSelectedIndex = index;
                    });
                  },
                  isScroll: false,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                child: projectPages[tabSelectedIndex], //index
              ),
            ],
          ),
        ),
      ),
    );
  }
}
