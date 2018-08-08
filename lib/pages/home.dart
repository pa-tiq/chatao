import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> mensagens = List();

  final myController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    mensagens.add('TESTE');
    mensagens.add('OUTRO TESTE');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Column(
        children: <Widget>[
          Expanded(
              child: new ListView(
            children: mensagens.map((msg) {
              return new ListTile(
                title: Text(msg),
              );
            }).toList(),
          )),
          ListTile(
            title: TextField(
              controller: myController,
              decoration: InputDecoration(hintText: 'Mensagem'),
            ),
            trailing: IconButton(icon: Icon(Icons.send), onPressed: () {
              setState(() {
                mensagens.add(myController.text);
                myController.clear();
              });
            }),
          ),
        ],
      ),
    );
  }
}
