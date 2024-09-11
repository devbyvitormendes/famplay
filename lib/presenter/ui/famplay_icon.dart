import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FamplayIcons {
  //menu
  static const ImageIcon filhos = ImageIcon(AssetImage('assets/images/icon_filho.png'));
  static const ImageIcon premios = ImageIcon(AssetImage('assets/images/icon_premio.png'));
  static const ImageIcon tarefas = ImageIcon(AssetImage('assets/images/icon_tarefa.png'));
  static const ImageIcon validar = ImageIcon(AssetImage('assets/images/icon_validar.png'));

  //messages
  static const IconData error = FontAwesomeIcons.circleExclamation;
  static const IconData info = FontAwesomeIcons.circleInfo;
  static const IconData logout = FontAwesomeIcons.doorOpen;
  static const IconData success = FontAwesomeIcons.circleCheck;
  static const IconData warning = FontAwesomeIcons.triangleExclamation;
}