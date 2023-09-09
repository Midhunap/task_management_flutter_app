import 'package:flutter/material.dart';
import 'package:task_management_app/controller/task_provider.dart';
import 'package:task_management_app/screens/home_screen.dart';
import 'package:task_management_app/screens/project_screen.dart';
import 'controller/colors.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => TaskProvider(),
      child: const TaskManagement(),
    ),
  );
}

class TaskManagement extends StatelessWidget {
  const TaskManagement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Consumer<TaskProvider>(builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: backgroundColor,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Container(
            height: 60,
            width: 60,
            margin: const EdgeInsets.only(bottom: 10.0),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: const BorderRadius.all(
                Radius.circular(100),
              ),
              boxShadow: [
                BoxShadow(
                  color: purpleColor.withOpacity(0.3),
                  spreadRadius: 6,
                  blurRadius: 6,
                  offset: const Offset(0.3, 0.6),
                ),
              ],
            ),
            child: FittedBox(
              child: FloatingActionButton(
                onPressed: () {},
                backgroundColor: purpleColor,
                elevation: 10,
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 18,
                  shadows: [
                    Shadow(
                      color: Colors.white,
                      offset: Offset(0.2, 0.5),
                      blurRadius: 5.0,
                    )
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: SizedBox(
            height: 70,
            child: BottomAppBar(
              shape: const CircularNotchedRectangle(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //home
                    IconButton(
                      icon: Icon(
                        Icons.home_filled,
                        color: provider.selectedIndex == 0
                            ? purpleColor
                            : Colors.grey,
                      ),
                      onPressed: () {
                        provider.updateSelectedIndex(0);
                      },
                    ),
                    //projects
                    IconButton(
                      icon: Icon(
                        Icons.insert_drive_file,
                        color: provider.selectedIndex == 1
                            ? purpleColor
                            : Colors.grey,
                      ),
                      onPressed: () {
                        provider.updateSelectedIndex(1);
                      },
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    //mail
                    IconButton(
                      icon: Icon(
                        Icons.mail,
                        color: provider.selectedIndex == 2
                            ? purpleColor
                            : Colors.grey,
                      ),
                      onPressed: () {
                        provider.updateSelectedIndex(2);
                      },
                    ),
                    //settings
                    IconButton(
                      icon: Icon(
                        Icons.settings,
                        color: provider.selectedIndex == 3
                            ? purpleColor
                            : Colors.grey,
                      ),
                      onPressed: () {
                        provider.updateSelectedIndex(3);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: _selectPages(provider.selectedIndex),
        );
      }),
    );
  }
}

Widget _selectPages(int selectedIndex) {
  switch (selectedIndex) {
    case 0:
      //home page.
      return const HomeScreen();
    case 1:
      //project page.
      return ProjectScreen();
    default:
      // return home page by default.
      return const HomeScreen();
  }
}
