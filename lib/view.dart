import 'package:flutter/material.dart';
import 'package:login/controller.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  var controller = FormController();
  String name = '';
  String sName = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 400,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CircleAvatar(
                  child: Text(
                    'Avatar',
                    style: TextStyle(fontSize: 25),
                  ),
                  maxRadius: 60,
                  backgroundColor: Colors.cyan,
                ),
                TextFormField(
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Nome é Obrigatório !';
                      }
                      return null;
                    },
                    decoration: InputDecoration(hintText: 'Nome'),
                    onChanged: (text) {
                      controller.updateName(text);
                    }),
                TextFormField(
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Sobrenome é Obrigatório !';
                    }
                    return null;
                  },
                  decoration: InputDecoration(hintText: 'Sobrenome'),
                  onChanged: (text) {
                    controller.updatesurName(text);
                  },
                ),
                FutureBuilder<String>(
                    future: controller.fullName,
                    builder: (context, snapshot) {
                      return Text(snapshot.data ?? '');
                    }),
                TextButton(
                    onPressed: () {
                      final isValid = _formKey.currentState!.validate();
                      if (isValid) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Dados Validados'),
                                content: Column(
                                  children: [
                                    Text(
                                        '${controller.name} ${controller.surname}'),
                                    TextButton(
                                        onPressed: () {
                                          controller.saveUser();
                                        },
                                        child: Text('Save'))
                                  ],
                                ),
                              );
                            });
                      }
                    },
                    child: Text('Validar'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
