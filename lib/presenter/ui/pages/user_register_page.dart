import 'dart:async';

import 'package:famplay/presenter/ui/constants/constants.dart';
import 'package:famplay/presenter/ui/widget/app_bar_widget.dart';
import 'package:flutter/material.dart';

class UserRegisterPage extends StatefulWidget {
  const UserRegisterPage({super.key});

  @override
  State<UserRegisterPage> createState() => _UserRegisterPageState();
}

class _UserRegisterPageState extends State<UserRegisterPage> {

  final List<String> _items = [];
  final StreamController<String> _controller = StreamController<String>.broadcast();

  @override
  void initState() {
    super.initState();
    _controller.stream.listen((item) {
      setState(() {
        _items.add(item);
      });
    });
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  void _addItem() {
    // Aqui você pode adicionar lógica para alimentar a lista dinamicamente.
    // Por exemplo, você pode adicionar um novo item a cada clique no botão.
    _controller.add('Novo item ${_items.length + 1}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstants.white,
      appBar: AppBarWidget(
        image: Image.asset(ImageConstants.validar),
        title: 'Validar',
        showBack: true,
        showLogoff: false,
        color: ColorsConstants.brown,
        backgroundColor: ColorsConstants.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (_items.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return ListTile(title: Text(_items[index]));
                },
              ),
            ),
          ElevatedButton(
            onPressed: _addItem,
            child: const Text('Adicionar Item'),
          ),
        ],
      ),
    );
  }
}
