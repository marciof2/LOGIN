import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
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
                      name = text;
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
                    sName = text;
                  },
                ),
                TextButton(
                    onPressed: () {
                      final isValid = _formKey.currentState.validate();
                      if (isValid) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Dados Validados'),
                                content: Text('Olá $name $sName'),
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
