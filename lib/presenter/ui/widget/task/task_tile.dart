import 'dart:developer';

import 'package:famplay/domain/model/task/task_model.dart';
import 'package:famplay/presenter/ui/constants/constants.dart';
import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final TaskModel task;

  const TaskTile({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        log('task: $task');
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.width * 0.5,
              maxWidth: MediaQuery.of(context).size.width * 0.75,
            ),
            child: Text(
              task.description,
              maxLines: 5,
              textAlign: TextAlign.justify,
              textWidthBasis: TextWidthBasis.parent,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w900,
                color: ColorsConstants.brown,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
