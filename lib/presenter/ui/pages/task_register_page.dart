import 'dart:developer';

import 'package:famplay/domain/helper/form_helper.dart';
import 'package:famplay/domain/helper/messages.dart';
import 'package:famplay/domain/model/task/task_model.dart';
import 'package:famplay/presenter/ui/constants/constants.dart';
import 'package:famplay/presenter/ui/widget/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:validatorless/validatorless.dart';

class TaskRegisterPage extends StatefulWidget {
  final bool isCreate;
  final TaskModel? task;
  const TaskRegisterPage({super.key, required this.isCreate, this.task});

  @override
  State<TaskRegisterPage> createState() => _TaskRegisterPageState();
}

class _TaskRegisterPageState extends State<TaskRegisterPage> {
  TaskModel? task;
  bool isCreate = true;
  final formKey = GlobalKey<FormState>();
  final taskEC = TextEditingController();

  @override
  void initState() {
    super.initState();
    isCreate = widget.isCreate;
    task = widget.task;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstants.orange,
      appBar: const AppBarWidget(
        title: 'Voltar',
        showBack: true,
        showLogoff: false,
        color: ColorsConstants.white,
        backgroundColor: ColorsConstants.orange,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitHeight,
            image: Image.asset(ImageConstants.orangeBg).image,
          ),
        ),
        child: Form(
          key: formKey,
          child: Padding(
            padding:
                const EdgeInsets.only(bottom: 30, left: 15, right: 15, top: 15),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Tarefa',
                    style: TextStyle(
                      color: ColorsConstants.white,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  TextFormField(
                    style: const TextStyle(
                      color: ColorsConstants.brown,
                      fontWeight: FontWeight.w900,
                    ),
                    keyboardType: TextInputType.text,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.deny(
                        RegExp(r'[0-9!@#$%^&*(),.?":{}|<>_+=\\/;]'),
                      ),
                    ],
                    onTapOutside: (_) => unfocus(context),
                    validator: Validatorless.multiple([
                      Validatorless.required('Tarefa é obrigatório'),
                      Validatorless.regex(
                          RegExp(r"[A-Za-z0-9]",
                              multiLine: true,
                              caseSensitive: false,
                              dotAll: true),
                          'Tarefa inválida, favor preencher corretamente.'),
                    ]),
                    controller: taskEC,
                    decoration: const InputDecoration(
                      hintText: 'Digite a tarefa',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      hintStyle: TextStyle(
                        color: ColorsConstants.wine,
                        fontWeight: FontWeight.w900,
                      ),
                      errorMaxLines: 2,
                      errorStyle: TextStyle(
                        color: ColorsConstants.yellow,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(children: [
                    Checkbox(
                        value: task != null ? task?.weekdays : false,
                        onChanged: (value) {
                          log('value for weekdays: $value');
                          setState(() {
                            task?.weekdays = value ?? false;
                          });
                        }),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Dias da semana',
                      style: TextStyle(
                        color: ColorsConstants.white,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ]),
                  Row(
                    children: [
                      Checkbox(
                          value: task != null ? task?.weekends : false,
                          onChanged: (value) {
                            log('value for weekends: $value');
                            setState(() {
                              task?.weekends = value ?? false;
                            });
                          }),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Finais de semana',
                        style: TextStyle(
                          color: ColorsConstants.white,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Visibility(
                    visible: isCreate,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(56),
                      ),
                      onPressed: () {
                        switch (formKey.currentState?.validate()) {
                          case (false || null):
                            Messages.showError(
                              'Existem campos inválidos',
                              context,
                            );
                          case true:
                            log("Cadastrou");
                          // login(emailEC.text, passwordEC.text);
                        }
                      },
                      child: const Text(
                        'Salvar',
                      ),
                    ),
                  ),
                  Visibility(
                    visible: !isCreate,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: OutlinedButton(
                            onPressed: () {
                              log("Excluiu");
                            },
                            child: const Text(
                              'Excluir',
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
                              switch (formKey.currentState?.validate()) {
                                case (false || null):
                                  Messages.showError(
                                    'Existem campos inválidos',
                                    context,
                                  );
                                case true:
                                  log("Cadastrou");
                                // login(emailEC.text, passwordEC.text);
                              }
                            },
                            child: const Text(
                              'Salvar',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
