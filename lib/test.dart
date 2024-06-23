import 'package:flutter/material.dart';
import 'package:gif/gif.dart';


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


class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> with TickerProviderStateMixin {
  GifController? controller;

  @override
  void initState() {
    super.initState();
    controller = GifController(vsync: this);

    // Start the GIF animation immediately
    controller!.repeat(min: 0, max: 29, period: const Duration(seconds: 1));

    // Perform the API call asynchronously
    _loadData();
  }

  Future<void> _loadData() async {
    // Simulate a delay for the API call
    await Future.delayed(const Duration(seconds: 3));
    navigateTo(context: context, widget: DoneView());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe9e9eb),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Gif(
              image: AssetImage("assets/images/loading.gif"),
              controller: controller,
              autostart: Autostart.loop,
              onFetchCompleted: () {
                controller!.reset();
                controller!.forward();
              },
            ),
          ],
        ),
      ),
    );
  }
}

void navigateTo({required BuildContext context, required Widget widget}) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => widget),
  );
}

class DoneView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Done"),
      ),
      body: Center(
        child: Text("Done!"),
      ),
    );
  }
}

