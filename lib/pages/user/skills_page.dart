import 'package:flutter/material.dart';

class SkillsPage extends StatefulWidget {
  const SkillsPage({Key? key}) : super(key: key);

  @override
  State<SkillsPage>createState() => _SkillsPageState();
}

class _SkillsPageState extends State<SkillsPage> {
  final _skills = <String>[];
  final _textController = TextEditingController();

  void _addSkill() {
    if (_textController.text.isNotEmpty) {
      setState(() {
        _skills.add(_textController.text);
        _textController.clear();
      });
    }
  }

  void _removeSkill(int index) {
    setState(() {
      _skills.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Skills'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _textController,
              decoration: const InputDecoration(
                labelText: 'Add Your Field Of Work',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: _addSkill,
            child: const Text('Add'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _skills.length,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(_skills[index]),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        _removeSkill(index);
                      },
                    ),
                  ],
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Add code here to navigate to the next page
            },
            child: const Text('Continue'),
          ),
        ],
      ),
    );
  }
}