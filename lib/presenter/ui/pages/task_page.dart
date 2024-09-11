import 'package:famplay/presenter/ui/constants/constants.dart';
import 'package:famplay/presenter/ui/widget/app_bar_widget.dart';
import 'package:flutter/material.dart';
    
class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstants.white,
      appBar: AppBarWidget(
        image: Image.asset(ImageConstants.tarefas),
        title: 'Tarefas',
        showBack: false,
        showLogoff: true,
        color: ColorsConstants.brown,
        backgroundColor: ColorsConstants.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitHeight,
            image: Image.asset(ImageConstants.whiteBg).image,
          ),
        ),
      ),
    );
  }
}