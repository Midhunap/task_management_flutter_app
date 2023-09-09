import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:task_management_app/screens/dashboard_screen.dart';

import '../../controller/colors.dart';
import '../../widgets/project_card.dart';

class AllProjects extends StatelessWidget {
  const AllProjects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        ProjectCard(
          text: 'App Animation',
          daySharedBy: 'Today, Shared by - Unbox Digital',
          date: 'June 15, 2021 - June 22, 2021',
          progressPercent: 0.65,
          percentText: '65%',
          progressColor: purpleColor,
          onTap: () {},
        ),
        const SizedBox(
          height: 10,
        ),
        ProjectCard(
          text: 'Dashboard Design',
          daySharedBy: 'Today, Shared by - Ui Been',
          date: 'June 15, 2021 - June 22, 2021',
          progressPercent: 0.85,
          percentText: '85%',
          progressColor: greenColor,
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                opaque: true,
                duration: const Duration(milliseconds: 500),
                type: PageTransitionType.leftToRight,
                child: DashBoardScreen(),
              ),
            );
          },
        ),
        const SizedBox(
          height: 10,
        ),
        ProjectCard(
          text: 'UI/UX Design',
          daySharedBy: 'Today, Shared by - Unbox',
          date: 'June 15, 2021 - June 22, 2021',
          progressPercent: 0.30,
          percentText: '30%',
          progressColor: orangeColor,
          onTap: () {},
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
