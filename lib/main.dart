import 'package:flutter/material.dart';
import 'package:layout/ChatMessage.dart';

const String _name = "Bruno";

void main() => runApp(new FriendlyChatApp());

class FriendlyChatApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'FriendlyChat',
      home: new ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  State createState() => new ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final _textController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('ChatApp'),
      ),
      body: new Column(
        children: <Widget>[
          new Flexible(
            child: new ListView.builder(
              padding: new EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
            ),
          ),
          new Divider(
            height: 1.0
          ),
          new Container(
            child: _buildTextComposer(),
          )
        ],
      ),
    );
  }
  Widget _buildTextComposer() {
    return new Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: new Row(
        children: <Widget>[
          new Flexible(
            child: new TextField(
              controller: _textController,
              onSubmitted: _handleSubmitted,
              decoration: new InputDecoration.collapsed(
                hintText: 'Envie uma mensagem'
              ),
            ),
          ),
          new Container(
            margin: new EdgeInsets.symmetric(horizontal: 4.0),
            child: new IconButton(
              icon: new Icon(
                Icons.send,
                color: Theme.of(context).accentColor
              ),
              onPressed: () => _handleSubmitted(_textController.text),
            ),
          ),
        ],
      ),
    );
  }
  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = new ChatMessage(
      text: text,
      name: _name
    );
    setState(() {
      _messages.insert(0, message);
    });
  }
}
