import 'dart:convert';
import 'dart:developer';

import 'package:famplay/domain/model/task/task_model.dart';
import 'package:famplay/domain/model/user/user_model.dart';
import 'package:famplay/presenter/ui/constants/constants.dart';
import 'package:famplay/presenter/ui/famplay_icon.dart';
import 'package:famplay/presenter/ui/widget/app_bar_widget.dart';
import 'package:famplay/presenter/ui/widget/task/task_tile.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ValidateTasksPage extends StatefulWidget {
  const ValidateTasksPage({super.key});

  @override
  State<ValidateTasksPage> createState() => _ValidateTasksPageState();
}

class _ValidateTasksPageState extends State<ValidateTasksPage> {
  late DateTime dateSelected;
  final DateFormat dateFormatter = DateFormat('dd/MM/yyyy');
  final List<TaskModel> tasks = [
    TaskModel(
      id: 1,
      description: 'Descrição da tarefa 1',
      points: 10,
      weekdays: true,
      weekends: false,
      done: true,
    ),
    TaskModel(
      id: 2,
      description: 'Descrição da tarefa 2',
      points: 10,
      weekdays: true,
      weekends: true,
      done: false,
    ),
    TaskModel(
      id: 3,
      description: 'Descrição da tarefa 3',
      points: 10,
      weekdays: false,
      weekends: false,
      done: false,
    ),
    TaskModel(
      id: 4,
      description: 'Descrição da tarefa 4',
      points: 10,
      weekdays: false,
      weekends: true,
      done: true,
    ),
    TaskModel(
      id: 5,
      description: 'Descrição da tarefa 5',
      points: 10,
      weekdays: true,
      weekends: false,
      done: false,
    ),
    TaskModel(
      id: 6,
      description: 'Descrição da tarefa 6',
      points: 10,
      weekdays: true,
      weekends: true,
      done: true,
    ),
    TaskModel(
      id: 1,
      description: 'Descrição da tarefa 1',
      points: 10,
      weekdays: true,
      weekends: false,
      done: true,
    ),
    TaskModel(
      id: 2,
      description: 'Descrição da tarefa 2',
      points: 10,
      weekdays: true,
      weekends: true,
      done: false,
    ),
    TaskModel(
      id: 3,
      description: 'Descrição da tarefa 3',
      points: 10,
      weekdays: false,
      weekends: false,
      done: false,
    ),
    TaskModel(
      id: 4,
      description: 'Descrição da tarefa 4',
      points: 10,
      weekdays: false,
      weekends: true,
      done: true,
    ),
    TaskModel(
      id: 5,
      description: 'Descrição da tarefa 5',
      points: 10,
      weekdays: true,
      weekends: false,
      done: false,
    ),
    TaskModel(
      id: 6,
      description: 'Descrição da tarefa 6',
      points: 10,
      weekdays: true,
      weekends: true,
      done: true,
    ),
  ];

  @override
  void initState() {
    final DateTime(:year, :month, :day) = DateTime.now();
    dateSelected = DateTime(year, month, day, 0, 0, 0);
    super.initState();
  }

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: dateSelected,
      firstDate: DateTime(2020),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) => Theme(
        data: ThemeData().copyWith(
          colorScheme: const ColorScheme.dark(
            primary: ColorsConstants.brown,
            onPrimary: ColorsConstants.white,
            surface: ColorsConstants.white,
            onSurface: ColorsConstants.brown,
          ),
        ),
        child: child!,
      ),
    );

    if (picked != null && picked != dateSelected) {
      setState(() {
        dateSelected = picked;
      });
    }
  }

  Future openDialog(TaskModel task) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: ColorsConstants.white,
          title: Text(
            task.done
                ? 'Quer marcar como não feita?'
                : 'Quer marcar como feita?',
            style: const TextStyle(
              color: ColorsConstants.brown,
              fontWeight: FontWeight.w900,
              fontSize: 18,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Não',
                style: TextStyle(
                  color: ColorsConstants.orange,
                  fontWeight: FontWeight.w900,
                  fontSize: 18,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  task.done = !task.done;
                });
                Navigator.pop(context);
              },
              child: const Text(
                'Sim',
              ),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    final child = ModalRoute.of(context)!.settings.arguments as UserModel;

    return Scaffold(
      backgroundColor: ColorsConstants.white,
      appBar: const AppBarWidget(
        title: 'Voltar',
        showBack: true,
        showLogoff: false,
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundColor: ColorsConstants.white,
                child: Center(
                  child: child.image == ''
                      ? CircleAvatar(
                          radius: 50.0,
                          backgroundColor: ColorsConstants.white,
                          backgroundImage: Image.memory(
                                  base64Decode(ImageConstants.defaultImage))
                              .image,
                        )
                      : CircleAvatar(
                          radius: 50.0,
                          backgroundImage:
                              Image.memory(base64Decode(child.image)).image,
                          backgroundColor: ColorsConstants.white,
                        ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                child.name,
                style: const TextStyle(
                    fontFamily: FontConstants.fontFamily,
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                    color: ColorsConstants.brown),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    dateFormatter.format(dateSelected),
                    style: const TextStyle(
                        fontFamily: FontConstants.fontFamily,
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                        color: ColorsConstants.brown),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    icon: const Icon(FamplayIcons.calendar),
                    color: ColorsConstants.brown,
                    onPressed: () {
                      _selectDate();
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Clique no ícone para alterar o status da tarefa',
                style: TextStyle(
                    fontFamily: FontConstants.fontFamily,
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
                    color: ColorsConstants.brown),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: ColorsConstants.orange,
                      ),
                      margin: const EdgeInsets.symmetric(
                        horizontal: 24,
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      child: Column(
                        children: [
                          ...tasks.map(
                            (task) => Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              margin: const EdgeInsets.symmetric(
                                horizontal: 24,
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
                                    onPressed: () => openDialog(task),
                                    iconSize: 14,
                                    icon: Icon(task.done
                                        ? FamplayIcons.success
                                        : FamplayIcons.undone),
                                    color: ColorsConstants.brown,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: ColorsConstants.brown,
                        backgroundColor: ColorsConstants.white,
                      ),
                      onPressed: () {
                        log("Zerou");
                      },
                      child: const Text(
                        'Zerar',
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: ElevatedButton(
                      onPressed: () {
                        log("Cadastrou");
                        // login(emailEC.text, passwordEC.text);
                      },
                      child: const Text(
                        'Validar',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
