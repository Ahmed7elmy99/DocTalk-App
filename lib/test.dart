import 'package:flutter/material.dart';


class WhoIsThisScreen extends StatefulWidget {
  @override
  _WhoIsThisScreenState createState() => _WhoIsThisScreenState();
}

class _WhoIsThisScreenState extends State<WhoIsThisScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();
  int _score = 0;
  final String _correctName = 'MOM'; // Change this to the name of your image
  final String _imagePath = 'assets/images/Frame 2610771.png'; // Path to your image

  void _checkName() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        if (_controller.text.trim().toLowerCase() == _correctName.toLowerCase()) {
          _score = 25;
        } else {
          _score = 0;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Who is this?'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Who is this?',
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Image.asset(
              _imagePath,
              height: 200,
            ),
            SizedBox(height: 20),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: 'Enter name',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.text,
                    textCapitalization: TextCapitalization.none,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _checkName,
                    child: Text('Submit'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Score: $_score',
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
