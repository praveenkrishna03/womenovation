import 'dart:async';
import 'details.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:flutter/material.dart';

void main() {
  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  if (det_gather == false) {
    runApp(MyApp());
  } else {
    runApp(MyApp2());
  }
}

int type = 0;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Details Gathering',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: type_of_user(),
    );
  }
}

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Second_use',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: type_of_user(),
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
        appBar: AppBar(
            backgroundColor: Color.fromRGBO(21, 29, 54, 1),
            shadowColor: Colors.transparent,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context); // Navigate back to previous screen
              },
            )),
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
                      if (type == 1) {
                        usr_phone = _phoneNumberController.text;

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => pat_det1(),
                          ),
                        );
                      } else if (type == 2) {
                        doc_phone = _phoneNumberController.text;

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => doc_det1(),
                          ),
                        );
                      } else if (type == 3) {
                        wel_phone = _phoneNumberController.text;

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => wel_det1(),
                          ),
                        );
                      }
                    },
                    child: Text('Enter'),
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
                  SizedBox(height: 16),
                  Text(
                    'Maternal Care',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 228, 222, 137)),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Who Are You?',
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
                        color: Colors.white,
                      ),
                    ),
                    value: 1,
                    groupValue: type,
                    onChanged: (value) {
                      setState(() {
                        type = 1;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text(
                      'Doctor',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    value: 2,
                    groupValue: type,
                    onChanged: (value) {
                      setState(() {
                        type = 2;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text(
                      'Well Wisher',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    value: 3,
                    groupValue: type,
                    onChanged: (value) {
                      setState(() {
                        type = 3;
                      });
                    },
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
                      usr_name = _namecontroller.text;
                      usr_age = _agecontroller.text;
                      usr_email = _emailcontroller.text;
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
                      usr_pmonth = _pmcontroller.text;
                      usr_height = _hcontroller.text;
                      usr_weight = _wcontroller.text;
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
                      det_gather = true;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => usr_home(),
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
  final _namecontroller = TextEditingController();
  final _areacontroller = TextEditingController();
  final _emailcontroller = TextEditingController();

  void dispose_name() {
    _namecontroller.dispose();
    super.dispose();
  }

  void dispose_area() {
    _areacontroller.dispose();
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
                    'Area:',
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
                    controller: _areacontroller,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 109, 109, 109)),
                      hintText: 'Enter your area',
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
                          builder: (context) => doc_det1fi(),
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

class doc_det1fi extends StatefulWidget {
  @override
  doc_det1fiState createState() => doc_det1fiState();
}

class doc_det1fiState extends State<doc_det1fi> {
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
                    'You Are Succesfully Regitered As A Doctor',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
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
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      det_gather = true;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => doc_home(),
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

class wel_det1 extends StatefulWidget {
  @override
  wel_det1State createState() => wel_det1State();
}

class wel_det1State extends State<wel_det1> {
  final _namewwcontroller = TextEditingController();
  final _namepcontroller = TextEditingController();
  final _numcontroller = TextEditingController();
  final _relcontroller = TextEditingController();

  void dispose_name() {
    _namewwcontroller.dispose();
    super.dispose();
  }

  void dispose_age() {
    _namepcontroller.dispose();
    super.dispose();
  }

  void dispose_email() {
    _numcontroller.dispose();
    super.dispose();
  }

  void dispose_rel() {
    _relcontroller.dispose();
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
                    'Your Name:',
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
                    controller: _namewwcontroller,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 109, 109, 109)),
                      hintText: 'Enter your name',
                    ),
                  ),
                  SizedBox(height: 32),
                  Text(
                    'Patient Name:',
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
                    controller: _namepcontroller,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 109, 109, 109)),
                      hintText: 'Enter patients name',
                    ),
                  ),
                  SizedBox(height: 32),
                  Text(
                    "Patient's Number:",
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
                    controller: _numcontroller,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 109, 109, 109)),
                      hintText: "Enter patient's number",
                    ),
                  ),
                  SizedBox(height: 32),
                  Text(
                    'Relation with Patient:',
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
                    controller: _relcontroller,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 109, 109, 109)),
                      hintText: 'Enter how the patient related to you',
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => wel_detfi1(),
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

class wel_detfi1 extends StatefulWidget {
  @override
  wel_detfi1State createState() => wel_detfi1State();
}

class wel_detfi1State extends State<wel_detfi1> {
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
                    'You Are Succesfully Regitered As A Well Wisher',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 50),
                  Image(
                    image: AssetImage(
                        'lib/assets/images/wel.png'), // Specify the image file location here
                    height: 250,
                    //fit: BoxFit.cover,
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      det_gather = true;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => wel_home(),
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

class usr_home extends StatefulWidget {
  @override
  usr_homeState createState() => usr_homeState();
}

class usr_homeState extends State<usr_home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Maternal Care'),
            backgroundColor: Color.fromRGBO(21, 29, 54, 1),
            shadowColor: Colors.transparent,
            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => usr_menu(),
                  ),
                ); // Navigate back to previous screen
              },
            )),
        body: Stack(children: [
          Container(
            color: Color.fromRGBO(21, 29, 54, 1),
            child: GridView.count(
              crossAxisCount: 2, // 2 columns
              children: [
                SizedBox(height: 10),
                Text(
                  'Hello,$usr_name!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => usr_menu(),
                      ),
                    );
                  },
                  child: Image(
                    image: AssetImage(
                        'lib/assets/images/physical_health.png'), // Specify the image file location here
                    height: 200,
                    //fit: BoxFit.cover,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => usr_menu(),
                      ),
                    );
                  },
                  child: Image(
                    image: AssetImage(
                        'lib/assets/images/for_mom.png'), // Specify the image file location here
                    height: 250,
                    //fit: BoxFit.cover,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => usr_menu(),
                      ),
                    );
                  },
                  child: Image(
                    image: AssetImage(
                        'lib/assets/images/for_child.png'), // Specify the image file location here
                    height: 300,
                    //fit: BoxFit.cover,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => usr_menu(),
                      ),
                    );
                  },
                  child: Image(
                    image: AssetImage(
                        'lib/assets/images/fun_time.png'), // Specify the image file location here
                    height: 250,
                    //fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 60,
            right: 60,
            child: IconButton(
              icon: Icon(Icons.warning_rounded, size: 90, color: Colors.white),
              onPressed: () {
                // add your SOS action here
              },
            ),
          )
        ]));
  }
}

class usr_menu extends StatefulWidget {
  @override
  usr_menuState createState() => usr_menuState();
}

class usr_menuState extends State<usr_menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Account Details'),
            backgroundColor: Color.fromRGBO(21, 29, 54, 1),
            shadowColor: Colors.transparent,
            actions: [
              Row(children: [
                /*IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context); // Navigate back to previous screen
                  },
                ),*/
                IconButton(
                  icon: Icon(Icons.info),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => about(),
                      ),
                    );
                    // do something
                  },
                ),
              ])
            ]),
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
                        'lib/assets/images/account.png'), // Specify the image file location here
                    width: 25,
                    //fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Name  :  $usr_name',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Age  :  $usr_age',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Email  :  $usr_email',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text('Pregnant Month  :  $usr_pmonth',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                  Text('Height  :  $usr_height',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                  Text('Weight  :  $usr_weight',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      det_gather = true;
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

class about extends StatefulWidget {
  @override
  aboutState createState() => aboutState();
}

class aboutState extends State<about> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('About'),
          backgroundColor: Color.fromRGBO(21, 29, 54, 1),
          shadowColor: Colors.transparent,
          actions: [
            Row(children: [
              /*IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context); // Navigate back to previous screen
                  },
                ),*/
              IconButton(
                icon: Icon(Icons.info),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => about(),
                    ),
                  );
                  // do something
                },
              ),
            ])
          ]),
    );
  }
}

class doc_home extends StatefulWidget {
  @override
  doc_homeState createState() => doc_homeState();
}

class doc_homeState extends State<doc_home> {
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
                    'You Are Succesfully Regitered As A Well Wisher',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 50),
                  Image(
                    image: AssetImage(
                        'lib/assets/images/wel.png'), // Specify the image file location here
                    height: 250,
                    //fit: BoxFit.cover,
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      det_gather = true;
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

class wel_home extends StatefulWidget {
  @override
  wel_homeState createState() => wel_homeState();
}

class wel_homeState extends State<wel_home> {
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
                    'You Are Succesfully Regitered As A Well Wisher',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 50),
                  Image(
                    image: AssetImage(
                        'lib/assets/images/wel.png'), // Specify the image file location here
                    height: 250,
                    //fit: BoxFit.cover,
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      det_gather = true;
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
