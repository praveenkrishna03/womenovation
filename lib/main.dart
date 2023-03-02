//import 'dart:async';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Phone Verification',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: VerifyPage(),
    );
  }
}

class VerifyPage extends StatefulWidget {
  @override
  _VerifyPageState createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  final _phoneNumberController = TextEditingController();

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appBar: AppBar(
        //  title: Text('Verify'),
        //),
        body: Container(
            color: Color.fromRGBO(21, 29, 54, 1),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 10),
                  Image(
                    image: AssetImage(
                        'lib/assets/images/logo.png'), // Specify the image file location here
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Maternal Care',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 228, 222, 137)),
                  ),
                  SizedBox(height: 32),
                  Text(
                    'Enter your phone number:',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    style: TextStyle(
                      color: Color.fromARGB(
                          255, 126, 123, 123), // Set the input text color here
                    ),
                    cursorColor: Colors.white,
                    controller: _phoneNumberController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 109, 109, 109)),
                      hintText: 'Enter phone number',
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => type_of_user(),
                        ),
                      );
                    },
                    child: Text('Verify'),
                  ),
                ],
              ),
            )));
  }
}

class type_of_user extends StatefulWidget {
  @override
  type_of_userState createState() => type_of_userState();
}

class type_of_userState extends State<type_of_user> {
  int ans = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromRGBO(21, 29, 54, 1),
            shadowColor: Colors.transparent,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context); // Navigate back to previous screen
              },
            )),
        body: Container(
            color: Color.fromRGBO(21, 29, 54, 1),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 5),
                  Image(
                    image: AssetImage(
                        'lib/assets/images/logo.png'), // Specify the image file location here
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Who are you?',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: 16),
                  RadioListTile(
                    title: Text(
                      'Patient',
                      style: TextStyle(
                        fontSize: 15,
                        color: ans == 1 ? Colors.blue : Colors.white,
                      ),
                    ),
                    value: 1,
                    groupValue: ans,
                    onChanged: (value) {
                      ans = 1;
                    },
                  ),
                  RadioListTile(
                    title: Text(
                      'Doctor',
                      style: TextStyle(
                        fontSize: 15,
                        color: ans == 1 ? Colors.blue : Colors.white,
                      ),
                    ),
                    value: 2,
                    groupValue: ans,
                    onChanged: (value) {
                      ans = 2;
                    },
                  ),
                  RadioListTile(
                    title: Text(
                      'Well Wisher',
                      style: TextStyle(
                        fontSize: 15,
                        color: ans == 1 ? Colors.blue : Colors.white,
                      ),
                    ),
                    value: 3,
                    groupValue: ans,
                    onChanged: (value) {
                      ans = 3;
                    },
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      if (ans == 1) {
                        // The answer is correct
                        print('You are a Patient');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => pat_det1(),
                          ),
                        );
                      } else if (ans == 2) {
                        // The answer is wrong
                        print('You are a Doctor');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => doc_det1(),
                          ),
                        );
                      } else if (ans == 3) {
                        print('You are a Well Wisher');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => wel_det1(),
                          ),
                        );
                      }
                    },
                    child: Text('Submit'),
                  ),
                ],
              ),
            )));
  }
}

class pat_det1 extends StatefulWidget {
  @override
  pat_det1State createState() => pat_det1State();
}

class pat_det1State extends State<pat_det1> {
  final _namecontroller = TextEditingController();
  final _agecontroller = TextEditingController();
  final _emailcontroller = TextEditingController();

  void dispose_name() {
    _namecontroller.dispose();
    super.dispose();
  }

  void dispose_age() {
    _agecontroller.dispose();
    super.dispose();
  }

  void dispose_email() {
    _emailcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromRGBO(21, 29, 54, 1),
            shadowColor: Colors.transparent,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context); // Navigate back to previous screen
              },
            )),
        body: Container(
            color: Color.fromRGBO(21, 29, 54, 1),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  /*Text(
                    'You are A Patient',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),*/
                  SizedBox(height: 32),
                  Text(
                    'Name:',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  /*SizedBox(height: 50),
                  Image(
                    image: AssetImage(
                        'lib/assets/images/pat.png'), // Specify the image file location here
                    height: 250,
                    //fit: BoxFit.cover,
                  ),*/
                  SizedBox(height: 16),
                  TextField(
                    style: TextStyle(
                      color: Color.fromARGB(
                          255, 126, 123, 123), // Set the input text color here
                    ),
                    cursorColor: Colors.white,
                    controller: _namecontroller,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 109, 109, 109)),
                      hintText: 'Enter your name',
                    ),
                  ),
                  SizedBox(height: 32),
                  Text(
                    'Age:',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    style: TextStyle(
                      color: Color.fromARGB(
                          255, 126, 123, 123), // Set the input text color here
                    ),
                    cursorColor: Colors.white,
                    controller: _agecontroller,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 109, 109, 109)),
                      hintText: 'Enter your age',
                    ),
                  ),
                  SizedBox(height: 32),
                  Text(
                    'Email:',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    style: TextStyle(
                      color: Color.fromARGB(
                          255, 126, 123, 123), // Set the input text color here
                    ),
                    cursorColor: Colors.white,
                    controller: _emailcontroller,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 109, 109, 109)),
                      hintText: 'Enter your email',
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => pat_det2(),
                        ),
                      );
                    },
                    child: Text('Enter'),
                  ),
                ],
              ),
            )));
  }
}

class pat_det2 extends StatefulWidget {
  @override
  pat_det2State createState() => pat_det2State();
}

class pat_det2State extends State<pat_det2> {
  final _pmcontroller = TextEditingController();
  final _hcontroller = TextEditingController();
  final _wcontroller = TextEditingController();

  void dispose_pm() {
    _pmcontroller.dispose();
    super.dispose();
  }

  void dispose_h() {
    _hcontroller.dispose();
    super.dispose();
  }

  void dispose_w() {
    _wcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromRGBO(21, 29, 54, 1),
            shadowColor: Colors.transparent,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context); // Navigate back to previous screen
              },
            )),
        body: Container(
            color: Color.fromRGBO(21, 29, 54, 1),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  /*SizedBox(
                    height: 16,
                  ),
                  Text(
                    'You are A Patient',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),*/
                  SizedBox(height: 32),
                  Text(
                    'Pregnant Month:',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  /*SizedBox(height: 50),
                  Image(
                    image: AssetImage(
                        'lib/assets/images/pat.png'), // Specify the image file location here
                    height: 250,
                    //fit: BoxFit.cover,
                  ),*/
                  SizedBox(height: 16),
                  TextField(
                    style: TextStyle(
                      color: Color.fromARGB(
                          255, 126, 123, 123), // Set the input text color here
                    ),
                    cursorColor: Colors.white,
                    controller: _pmcontroller,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 109, 109, 109)),
                      hintText: 'Enter your pregnant month',
                    ),
                  ),
                  SizedBox(height: 32),
                  Text(
                    'Height:',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    style: TextStyle(
                      color: Color.fromARGB(
                          255, 126, 123, 123), // Set the input text color here
                    ),
                    cursorColor: Colors.white,
                    controller: _hcontroller,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 109, 109, 109)),
                      hintText: 'Enter your height',
                    ),
                  ),
                  SizedBox(height: 32),
                  Text(
                    'Weight:',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    style: TextStyle(
                      color: Color.fromARGB(
                          255, 126, 123, 123), // Set the input text color here
                    ),
                    cursorColor: Colors.white,
                    controller: _wcontroller,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 109, 109, 109)),
                      hintText: 'Enter your weight',
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => pat_detfi1(),
                        ),
                      );
                    },
                    child: Text('Submit'),
                  ),
                ],
              ),
            )));
  }
}

class pat_detfi1 extends StatefulWidget {
  @override
  pat_detfi1State createState() => pat_detfi1State();
}

class pat_detfi1State extends State<pat_detfi1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromRGBO(21, 29, 54, 1),
            shadowColor: Colors.transparent,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context); // Navigate back to previous screen
              },
            )),
        body: Container(
            color: Color.fromRGBO(21, 29, 54, 1),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'You Are Succesfully Regitered As A Patient',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 50),
                  Image(
                    image: AssetImage(
                        'lib/assets/images/pat.png'), // Specify the image file location here
                    height: 250,
                    //fit: BoxFit.cover,
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VerifyPage(),
                        ),
                      );
                    },
                    child: Text('Go to Home Page'),
                  ),
                ],
              ),
            )));
  }
}

class doc_det1 extends StatefulWidget {
  @override
  doc_det1State createState() => doc_det1State();
}

class doc_det1State extends State<doc_det1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromRGBO(21, 29, 54, 1),
            shadowColor: Colors.transparent,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context); // Navigate back to previous screen
              },
            )),
        body: Container(
            color: Color.fromRGBO(21, 29, 54, 1),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'You are A Doctor',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 50),
                  Image(
                    image: AssetImage(
                        'lib/assets/images/doc.png'), // Specify the image file location here
                    height: 250,
                    //fit: BoxFit.cover,
                  ),
                ],
              ),
            )));
  }
}

class wel_det1 extends StatefulWidget {
  @override
  wel_det1State createState() => wel_det1State();
}

class wel_det1State extends State<wel_det1> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromRGBO(21, 29, 54, 1),
            shadowColor: Colors.transparent,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context); // Navigate back to previous screen
              },
            )),
        body: Container(
            color: Color.fromRGBO(21, 29, 54, 1),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'You are A Well Wisher',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 50),
                  Image(
                    image: AssetImage(
                        'lib/assets/images/wel.png'), // Specify the image file location here
                    height: 200,
                    //fit: BoxFit.cover,
                  ),
                ],
              ),
            )));
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<String> _messages = [];

  void _handleSubmitted(String text) {
    _textController.clear();
    setState(() {
      _messages.insert(0, text);
    });
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).accentColor),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration:
                    InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () => _handleSubmitted(_textController.text)),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (_, int index) => _buildChatBubble(_messages[index]),
            ),
          ),
          Divider(
            height: 1.0,
          ),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }

  Widget _buildChatBubble(String message) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              child: Text("A"),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("User"),
                Container(
                  margin: EdgeInsets.only(top: 5.0),
                  child: Text(message),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
