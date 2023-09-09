import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:task_management_app/controller/colors.dart';
import 'package:task_management_app/controller/const.dart';
import 'package:task_management_app/widgets/custom_daily_task_list.dart';
import '../widgets/ContainerTile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              //circularAvatar and search icon in a Row
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
              //hello message
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Hello,',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              //name of user
              const Text(
                'Alex Marconi',
                style: headLineTextStyle,
              ).animate().scale(duration: 500.ms),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 300,
                child: GridView.count(
                  primary: false,
                  physics: const NeverScrollableScrollPhysics(
                      parent: NeverScrollableScrollPhysics()),
                  childAspectRatio: 1.6,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  crossAxisCount: 2,
                  children: <Widget>[
                    const ContainerTile(
                      icon: Icons.update_rounded,
                      text: 'In Progress',
                      color: orangeColor,
                    ).animate().slideX(delay: 500.ms),
                    const ContainerTile(
                      icon: Icons.cached_outlined,
                      text: 'Ongoing',
                      color: purpleColor,
                    ).animate().slideX(delay: 500.ms),
                    const ContainerTile(
                      icon: Icons.cached_outlined,
                      text: 'Completed',
                      color: greenColor,
                    ).animate().slideY(delay: 500.ms),
                    const ContainerTile(
                      icon: Icons.description_outlined,
                      text: 'Cancel',
                      color: redColor,
                    ).animate().slideY(delay: 500.ms),
                  ],
                ),
              ),
              //container tiles
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Daily Task",
                    style: subHeadLineTextStyle,
                  ),
                  Row(
                    children: [
                      Text(
                        "All Task",
                        style: secondaryTextStyle,
                      ),
                      const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.grey,
                      )
                    ],
                  )
                ],
              ),
              //daily tasks
              const CustomDailyTaskList(
                text: 'App Animation',
                progressColor: purpleColor,
                percent: 0.75,
                iconColor: Colors.grey,
              ),
              const CustomDailyTaskList(
                text: 'Dashboard Design',
                progressColor: greenColor,
                percent: 0.90,
                iconColor: greenColor,
              ),
              const CustomDailyTaskList(
                text: 'UI/UX Design',
                progressColor: orangeColor,
                percent: 0.40,
                iconColor: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
