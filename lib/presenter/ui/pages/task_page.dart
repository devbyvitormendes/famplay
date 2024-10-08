import 'dart:async';

import 'package:famplay/domain/model/task/task_model.dart';
import 'package:famplay/presenter/ui/constants/constants.dart';
import 'package:famplay/presenter/ui/famplay_icon.dart';
import 'package:famplay/presenter/ui/pages/task_register_page.dart';
import 'package:famplay/presenter/ui/widget/app_bar_widget.dart';
import 'package:famplay/presenter/ui/widget/task/task_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final List<TaskModel> tasks = [];
  final StreamController<TaskModel> _controller =
      StreamController<TaskModel>.broadcast();

  @override
  void initState() {
    super.initState();
    _controller.stream.listen((item) {
      setState(() {
        tasks.add(item);
      });
    });
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  void addTask() {
    setState(() {
      final id = tasks.length + 1;
      //final description = 'Tarefa grande pra caramba porque o pai queria que o filho fizesse e demorasse muito pra terminar, então deu um trabalho de Hércules $id';
      final description = 'Tarefinha simples $id';
      final points = id * 3;
      const weekdays = true;
      const weekends = false;
      tasks.add(
        TaskModel(
          id: id,
          description: description,
          points: points,
          weekdays: weekdays,
          weekends: weekends,
          done: false,
        ),
      );
    });
  }

  void removeTask(int id) {
    setState(() {
      tasks.removeWhere((task) => task.id == id);
    });
  }

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
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: Image.asset(ImageConstants.whiteBg).image,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ...tasks.map(
                (task) => Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Expanded(
                        child: TaskTile(
                          task: task,
                        ),
                      ),
                      IconButton(
                        iconSize: 14,
                        color: ColorsConstants.brown,
                        onPressed: () {
                          removeTask(task.id);
                        },
                        icon: const Icon(FamplayIcons.trash),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 24,
                ),
                alignment: Alignment.center,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(64),
                  ),
                  onPressed: () {
                    Navigator.of(context, rootNavigator: false).push(
                      CupertinoPageRoute(
                        builder: (context) => const TaskRegisterPage(
                          isCreate: true,
                        ),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.transparent,
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 3.0,
                              color: ColorsConstants.white,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(FamplayIcons.add),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'Nova tarefa',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
