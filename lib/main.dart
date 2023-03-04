import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher_android/url_launcher_android.dart';
import 'package:url_launcher/url_launcher.dart';
import 'details.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

FirebaseFirestore firestore = FirebaseFirestore.instance;

CollectionReference user = FirebaseFirestore.instance.collection("user");
CollectionReference doctor = FirebaseFirestore.instance.collection("doctor");
CollectionReference wellwisher =
    FirebaseFirestore.instance.collection("wellwisher");

int type = 0;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Details Gathering',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new_old(),
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
                  SizedBox(height: 0),
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
                        wel_phone = _phoneNumberController.text.toString();
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

class det_get extends StatefulWidget {
  @override
  det_getState createState() => det_getState();
}

class det_getState extends State<det_get> {
  final _phoneNumberController = TextEditingController();
  String tempnum = '';
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
                  SizedBox(height: 0),
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
                    onPressed: () async {
                      final tempnum = _phoneNumberController.text;
                      firestore
                          .collection('users')
                          .where('phone', isEqualTo: tempnum)
                          .get()
                          .then((QuerySnapshot querySnapshot) {
                        querySnapshot.docs.forEach((doc) {
                          final data = doc.data() as Map<String, dynamic>;
                          final usr_name = data['name'];
                          print('Name: $usr_name');
                        });
                      });

                      /*final tempnum = _phoneNumberController.text;
                      String number = tempnum.toString();
                      final userSnapshot = await FirebaseFirestore.instance
                          .collection('users')
                          .doc()
                          .get();

                      if (userSnapshot.exists) {
                        final userData = userSnapshot.data();
                        if (userData != null) {
                          usr_name = userData['name'].toString();
                          usr_email = userData['email'].toString();
                          usr_phone = userData['phone'].toString();
                          usr_pmonth = userData['pmonth'].toString();
                          usr_age = userData['age'].toString();
                          usr_height = userData['height'].toString();
                          usr_weight = userData['weight'].toString();
                          print('successfully got');
                        }
                      } else {}*/
                      print('$usr_name');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => usr_home(),
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

class new_old extends StatefulWidget {
  @override
  new_oldState createState() => new_oldState();
}

class new_oldState extends State<new_old> {
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
                  SizedBox(height: 0),
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
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => det_get(),
                        ),
                      );
                    },
                    child: Text('Already Have An Account'),
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
                    child: Text('New Account'),
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
                    keyboardType: TextInputType.name,
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
                    keyboardType: TextInputType.emailAddress,
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
                      hintText: 'Enter your height in M',
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
                      hintText: 'Enter your weight in KG',
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () async {
                      usr_pmonth = _pmcontroller.text;
                      usr_height = _hcontroller.text;
                      usr_weight = _wcontroller.text;

                      await user.add({
                        'phone': '$usr_phone',
                        'name': '$usr_name',
                        'age': '$usr_age',
                        'email': '$usr_email',
                        'pmonth': '$usr_pmonth',
                        'height': '$usr_height',
                        'weight': '$usr_weight'
                      }).then((value) => print('user Added'));

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
  final _namecontroller1 = TextEditingController();
  final _areacontroller1 = TextEditingController();
  final _emailcontroller1 = TextEditingController();

  void dispose_name() {
    _namecontroller1.dispose();
    super.dispose();
  }

  void dispose_area() {
    _areacontroller1.dispose();
    super.dispose();
  }

  void dispose_email() {
    _emailcontroller1.dispose();
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
                    controller: _namecontroller1,
                    keyboardType: TextInputType.name,
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
                    controller: _areacontroller1,
                    keyboardType: TextInputType.name,
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
                    controller: _emailcontroller1,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 109, 109, 109)),
                      hintText: 'Enter your email',
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () async {
                      final doc_name = _namecontroller1.text;
                      final doc_email = _emailcontroller1.text;
                      final doc_area = _areacontroller1.text;
                      await doctor.add({
                        'phone': '$doc_phone',
                        'name': '$doc_name',
                        'email': '$doc_email',
                        'area': '$doc_area'
                      }).then((value) => print('Doctor Added'));

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
                    keyboardType: TextInputType.name,
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
                    keyboardType: TextInputType.name,
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
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 109, 109, 109)),
                      hintText: 'Enter how the patient related to you',
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () async {
                      final wel_name = _namewwcontroller.text;
                      final wel_pname = _namepcontroller.text;
                      final wel_pphone = _numcontroller.text;
                      final wel_relation = _relcontroller.text;

                      await wellwisher.add({
                        'phone': '$wel_phone',
                        'name': '$wel_name',
                        'pname': '$wel_pname',
                        'pphone': '$wel_pphone',
                        'relation': '$wel_relation'
                      }).then((value) => print('wel Added'));

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
  static const String _phoneNumber = 'tel:108';

  Future<void> _launchDialer() async {
    int numDocs = await doctor.get().then((querySnapshot) {
      return querySnapshot.size;
    });

    try {
      if (await canLaunch(_phoneNumber)) {
        await launch(_phoneNumber);
      } else {
        throw 'Could not launch $_phoneNumber';
      }
    } catch (error) {
      print('Error launching phone dialer: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromRGBO(21, 29, 54, 1),
            shadowColor: Colors.transparent,
            title: Text('Maternal Care'),
            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => usr_menu(),
                  ),
                );
                // Add your onPressed code here
              },
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.info),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => about(),
                    ),
                  );
                  // Add your onPressed code here
                },
              ),
            ]),
        body: Stack(children: [
          Center(
            child: Text(
              'Welcome $usr_name !',
              style: TextStyle(fontSize: 32, color: Colors.white),
            ),
          ),
          Container(
            color: Color.fromRGBO(21, 29, 54, 1),
            child: GridView.count(
              crossAxisCount: 2, // 2 columns

              children: [
                Center(
                  child: Text(
                    'Welcome ',
                    style: TextStyle(fontSize: 32, color: Colors.white),
                  ),
                ),
                Center(
                  child: Text(
                    '$usr_name !',
                    style: TextStyle(fontSize: 32, color: Colors.white),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => phy(),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Image.asset(
                        'lib/assets/images/physical_health.png',
                        width: 150,
                        height: 150,
                      ),
                      Text(
                        'Physical Health',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ],
                  ),
                  /*child: Image(
                    image: AssetImage(
                        'lib/assets/images/physical_health.png'), // Specify the image file location here
                    height: 200,
                    //fit: BoxFit.cover,
                  ),*/
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => for_mom(),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Image.asset(
                        'lib/assets/images/for_mom.png',
                        width: 150,
                        height: 150,
                      ),
                      Text(
                        'For mom',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ],
                  ),

                  /*child: Image(
                    image: AssetImage(
                        'lib/assets/images/for_mom.png'), // Specify the image file location here
                    height: 250,
                    //fit: BoxFit.cover,
                  ),*/
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => for_child(),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Image.asset(
                        'lib/assets/images/for_child.png',
                        width: 150,
                        height: 150,
                      ),
                      Text(
                        'For child',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ],
                  ),
                  /*child: Image(
                    image: AssetImage(
                        'lib/assets/images/for_child.png'), // Specify the image file location here
                    height: 300,
                    //fit: BoxFit.cover,
                  ),*/
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => fun_time(),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Image.asset(
                        'lib/assets/images/fun_time.png',
                        width: 150,
                        height: 150,
                      ),
                      Text(
                        'Fun Time',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ],
                  ),
                  /*child: Image(
                    image: AssetImage(
                        'lib/assets/images/fun_time.png'), // Specify the image file location here
                    height: 250,
                    //fit: BoxFit.cover,
                  ),*/
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 60,
            right: 60,
            child: IconButton(
              color: Colors.white,
              icon: Icon(Icons.sos, size: 90, color: Colors.white),
              onPressed: () => _launchDialer(),
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
                    'NAME  :  $usr_name',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'AGE  :  $usr_age',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'EMAIL  :  $usr_email',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text('PREGNANT MONTH  :  $usr_pmonth',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                  Text('HEIGHT  :  $usr_height',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                  Text('WEIGHT  :  $usr_weight',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                ],
              ),
            )));
  }
}

class phy_hlt extends StatefulWidget {
  @override
  phy_hltState createState() => phy_hltState();
}

class phy_hltState extends State<phy_hlt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Physical Health'),
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
        body: Stack(children: [
          Container(
            color: Color.fromRGBO(21, 29, 54, 1),
            child: GridView.count(
              crossAxisCount: 1, // 2 columns

              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => phy_hlt(),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Image.asset(
                        'lib/assets/images/physical_health.png',
                        width: 150,
                        height: 150,
                      ),
                      Text(
                        'Physical Health',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ],
                  ),
                  /*child: Image(
                    image: AssetImage(
                        'lib/assets/images/physical_health.png'), // Specify the image file location here
                    height: 200,
                    //fit: BoxFit.cover,
                  ),*/
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
                  child: Column(
                    children: [
                      Image.asset(
                        'lib/assets/images/for_mom.png',
                        width: 150,
                        height: 150,
                      ),
                      Text(
                        'For mom',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ],
                  ),

                  /*child: Image(
                    image: AssetImage(
                        'lib/assets/images/for_mom.png'), // Specify the image file location here
                    height: 250,
                    //fit: BoxFit.cover,
                  ),*/
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
                  child: Column(
                    children: [
                      Image.asset(
                        'lib/assets/images/for_child.png',
                        width: 150,
                        height: 150,
                      ),
                      Text(
                        'For child',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ],
                  ),
                  /*child: Image(
                    image: AssetImage(
                        'lib/assets/images/for_child.png'), // Specify the image file location here
                    height: 300,
                    //fit: BoxFit.cover,
                  ),*/
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
                  child: Column(
                    children: [
                      Image.asset(
                        'lib/assets/images/fun_time.png',
                        width: 150,
                        height: 150,
                      ),
                      Text(
                        'Fun Time',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ],
                  ),
                  /*child: Image(
                    image: AssetImage(
                        'lib/assets/images/fun_time.png'), // Specify the image file location here
                    height: 250,
                    //fit: BoxFit.cover,
                  ),*/
                ),
              ],
            ),
          ),
        ]));
  }
}

class for_mom extends StatefulWidget {
  @override
  for_momState createState() => for_momState();
}

class for_momState extends State<for_mom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('For Mom'),
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
        body: Stack(children: [
          Container(
            color: Color.fromRGBO(21, 29, 54, 1),
            child: GridView.count(
              crossAxisCount: 1, // 2 columns

              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => m_inst(),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Image.asset(
                        'lib/assets/images/instructions.png',
                        width: 250,
                        height: 250,
                      ),
                      Text(
                        'Instructions & Checkups',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ],
                  ),
                  /*child: Image(
                    image: AssetImage(
                        'lib/assets/images/physical_health.png'), // Specify the image file location here
                    height: 200,
                    //fit: BoxFit.cover,
                  ),*/
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DoctorListPage(),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Image.asset(
                        'lib/assets/images/consult.png',
                        width: 250,
                        height: 250,
                      ),
                      Text(
                        'Consult with Doctor',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ],
                  ),

                  /*child: Image(
                    image: AssetImage(
                        'lib/assets/images/for_mom.png'), // Specify the image file location here
                    height: 250,
                    //fit: BoxFit.cover,
                  ),*/
                ),
              ],
            ),
          ),
        ]));
  }
}

class for_child extends StatefulWidget {
  @override
  for_childState createState() => for_childState();
}

class for_childState extends State<for_child> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('For Child'),
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
        body: Stack(children: [
          Container(
            color: Color.fromRGBO(21, 29, 54, 1),
            child: GridView.count(
              crossAxisCount: 1, // 2 columns

              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => c_inst(),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Image.asset(
                        'lib/assets/images/instructions.png',
                        width: 250,
                        height: 250,
                      ),
                      Text(
                        'Instructions',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ],
                  ),
                  /*child: Image(
                    image: AssetImage(
                        'lib/assets/images/physical_health.png'), // Specify the image file location here
                    height: 200,
                    //fit: BoxFit.cover,
                  ),*/
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DoctorListPage(),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Image.asset(
                        'lib/assets/images/consult.png',
                        width: 250,
                        height: 250,
                      ),
                      Text(
                        'Consult with Doctor',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ],
                  ),

                  /*child: Image(
                    image: AssetImage(
                        'lib/assets/images/for_mom.png'), // Specify the image file location here
                    height: 250,
                    //fit: BoxFit.cover,
                  ),*/
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => c_vac(),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Image.asset(
                        'lib/assets/images/vaccines.png',
                        width: 250,
                        height: 250,
                      ),
                      Text(
                        'Vaccines',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ],
                  ),
                  /*child: Image(
                    image: AssetImage(
                        'lib/assets/images/for_child.png'), // Specify the image file location here
                    height: 300,
                    //fit: BoxFit.cover,
                  ),*/
                ),
              ],
            ),
          ),
        ]));
  }
}

class fun_time extends StatefulWidget {
  @override
  fun_timeState createState() => fun_timeState();
}

class fun_timeState extends State<fun_time> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Fun Time'),
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
        body: Stack(children: [
          Container(
            color: Color.fromRGBO(21, 29, 54, 1),
            child: GridView.count(
              crossAxisCount: 1, // 2 columns

              children: [
                GestureDetector(
                  onTap: () async {
                    const url1 =
                        'https://play.google.com/store/apps/details?id=com.andregal.android.billard';
                    if (await canLaunch(url1)) {
                      await launch(url1);
                    } else {
                      throw 'Could not launch $url1';
                    }
                  },
                  child: Column(
                    children: [
                      Image(
                        image: AssetImage('lib/assets/images/game_1.png'),
                        width: 350,
                        height: 350,
                        // other properties like width, height, etc.
                      ),
                      /*Image.asset(
                        'lib/assets/images/game_1.png',
                        width: 350,
                        height: 350,
                      ),*/
                      Text(
                        'Roll The Ball',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ],
                  ),
                  /*child: Image(
                    image: AssetImage(
                        'lib/assets/images/physical_health.png'), // Specify the image file location here
                    height: 200,
                    //fit: BoxFit.cover,
                  ),*/
                ),
                GestureDetector(
                  onTap: () async {
                    const url2 =
                        'https://play.google.com/store/apps/details?id=com.LoopGames.game2048';
                    if (await canLaunch(url2)) {
                      await launch(url2);
                    } else {
                      throw 'Could not launch $url2';
                    }
                  },
                  child: Column(
                    children: [
                      Image.asset(
                        'lib/assets/images/game_2.png',
                        width: 350,
                        height: 350,
                      ),
                      Text(
                        '2048',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ],
                  ),

                  /*child: Image(
                    image: AssetImage(
                        'lib/assets/images/for_mom.png'), // Specify the image file location here
                    height: 250,
                    //fit: BoxFit.cover,
                  ),*/
                ),
                GestureDetector(
                  onTap: () async {
                    const url3 =
                        'https://play.google.com/store/apps/details?id=com.cg.antistress.mind.relaxing.games';
                    if (await canLaunch(url3)) {
                      await launch(url3);
                    } else {
                      throw 'Could not launch $url3';
                    }
                  },
                  child: Column(
                    children: [
                      Image.asset(
                        'lib/assets/images/game_3.png',
                        width: 350,
                        height: 350,
                      ),
                      Text(
                        'Antistress Games',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ],
                  ),
                  /*child: Image(
                    image: AssetImage(
                        'lib/assets/images/for_child.png'), // Specify the image file location here
                    height: 300,
                    //fit: BoxFit.cover,
                  ),*/
                ),
              ],
            ),
          ),
        ]));
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

class m_inst extends StatefulWidget {
  @override
  m_instState createState() => m_instState();
}

class m_instState extends State<m_inst> {
  List<bool> _isCheckedList = [false, false, false, false, false];

  bool newValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(21, 29, 54, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(21, 29, 54, 1),
        shadowColor: Colors.transparent,
        title: Text('Instructions & Checkups'),
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Text(
            'First type:',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          CheckboxListTile(
            checkColor: Colors.white,
            tileColor: Colors.white,
            title: Text('Checkbox 1'),
            value: _isCheckedList[0],
            onChanged: (newValue) {
              setState(() {
                _isCheckedList[0] = true;
              });
            },
          ),
          CheckboxListTile(
            checkColor: Colors.white,
            tileColor: Colors.white,
            title: Text('Checkbox 2'),
            value: _isCheckedList[1],
            onChanged: (newValue) {
              setState(() {
                _isCheckedList[1] = true;
              });
            },
          ),
          CheckboxListTile(
            checkColor: Colors.white,
            tileColor: Colors.white,
            title: Text('Checkbox 3'),
            value: _isCheckedList[2],
            onChanged: (newValue) {
              setState(() {
                _isCheckedList[2] = true;
              });
            },
          ),
          SizedBox(height: 10),
          Text(
            'Second type:',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          CheckboxListTile(
            checkColor: Colors.white,
            tileColor: Colors.white,
            title: Text('Checkbox 4'),
            value: _isCheckedList[3],
            onChanged: (newValue) {
              setState(() {
                _isCheckedList[3] = true;
              });
            },
          ),
          CheckboxListTile(
            checkColor: Colors.white,
            tileColor: Colors.white,
            title: Text('Checkbox 5'),
            value: _isCheckedList[4],
            onChanged: (newValue) {
              setState(() {
                _isCheckedList[4] = true;
              });
            },
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              // Add code to perform an action when the "Add" button is pressed
            },
            child: Icon(Icons.add),
          ),
          SizedBox(height: 10),
          ElevatedButton(
              onPressed: () {
                // Add code to perform an action when the "Update" button is pressed
              },
              child: Text("Update")),
        ],
      ),
    );
  }
}

class c_inst extends StatefulWidget {
  @override
  c_instState createState() => c_instState();
}

class c_instState extends State<c_inst> {
  List<bool> _isCheckedList = [false, false, false, false, false];

  bool newValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(21, 29, 54, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(21, 29, 54, 1),
        title: Text('My Page'),
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Text(
            'First type:',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          CheckboxListTile(
            tileColor: Colors.white,
            title: Text('Checkbox 1'),
            value: _isCheckedList[0],
            onChanged: (newValue) {
              setState(() {
                _isCheckedList[0] = true;
              });
            },
          ),
          CheckboxListTile(
            tileColor: Colors.white,
            title: Text('Checkbox 2'),
            value: _isCheckedList[1],
            onChanged: (newValue) {
              setState(() {
                _isCheckedList[1] = true;
              });
            },
          ),
          CheckboxListTile(
            tileColor: Colors.white,
            title: Text('Checkbox 3'),
            value: _isCheckedList[2],
            onChanged: (newValue) {
              setState(() {
                _isCheckedList[2] = true;
              });
            },
          ),
          SizedBox(height: 10),
          Text(
            'Second type:',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          CheckboxListTile(
            tileColor: Colors.white,
            title: Text('Checkbox 4'),
            value: _isCheckedList[3],
            onChanged: (newValue) {
              setState(() {
                _isCheckedList[3] = true;
              });
            },
          ),
          CheckboxListTile(
            tileColor: Colors.white,
            title: Text('Checkbox 5'),
            value: _isCheckedList[4],
            onChanged: (newValue) {
              setState(() {
                _isCheckedList[4] = true;
              });
            },
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              // Add code to perform an action when the "Add" button is pressed
            },
            child: Icon(Icons.add),
          ),
          SizedBox(height: 10),
          ElevatedButton(
              onPressed: () {
                // Add code to perform an action when the "Update" button is pressed
              },
              child: Text("Update")),
        ],
      ),
    );
  }
}

class c_vac extends StatefulWidget {
  @override
  c_vacState createState() => c_vacState();
}

class c_vacState extends State<c_vac> {
  List<bool> _isCheckedList = [false, false, false, false, false];

  bool newValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(21, 29, 54, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(21, 29, 54, 1),
        title: Text('My Page'),
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Text(
            'First type:',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          CheckboxListTile(
            tileColor: Colors.white,
            title: Text('Checkbox 1'),
            value: _isCheckedList[0],
            onChanged: (newValue) {
              setState(() {
                _isCheckedList[0] = true;
              });
            },
          ),
          CheckboxListTile(
            tileColor: Colors.white,
            title: Text('Checkbox 2'),
            value: _isCheckedList[1],
            onChanged: (newValue) {
              setState(() {
                _isCheckedList[1] = true;
              });
            },
          ),
          CheckboxListTile(
            tileColor: Colors.white,
            title: Text('Checkbox 3'),
            value: _isCheckedList[2],
            onChanged: (newValue) {
              setState(() {
                _isCheckedList[2] = true;
              });
            },
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              // Add code to perform an action when the "Add" button is pressed
            },
            child: Icon(Icons.add),
          ),
          SizedBox(height: 10),
          ElevatedButton(
              onPressed: () {
                // Add code to perform an action when the "Update" button is pressed
              },
              child: Text("Update")),
        ],
      ),
    );
  }
}

class DoctorListPage extends StatefulWidget {
  @override
  _DoctorListPageState createState() => _DoctorListPageState();
}

class _DoctorListPageState extends State<DoctorListPage> {
  int docnum = 0;

  @override
  void initState() {
    super.initState();
    getDoctorCount();
  }

  void getDoctorCount() async {
    // Get a reference to the "doctor" collection
    CollectionReference doctorsRef =
        FirebaseFirestore.instance.collection('doctor');

    // Get the number of documents in the "doctor" collection
    int numDocuments = await doctorsRef.get().then((querySnapshot) {
      return querySnapshot.size;
    });

    setState(() {
      docnum = numDocuments;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(21, 29, 54, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(21, 29, 54, 1),
        title: Text('Doctor List'),
      ),
      body: docnum == 0
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: docnum,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatScreen(),
                      ),
                    );
                    // Handle gesture detector onTap event here
                    print('Tapped on doctor $index');
                  },
                  child: ListTile(
                    tileColor: Colors.white,
                    title: Text('Doctor ${index + 1}'),
                  ),
                );
              },
            ),
    );
  }
}

class phy extends StatefulWidget {
  @override
  phyState createState() => phyState();
}

class phyState extends State<phy> {
  List<String> tabletNames = ['Tablet 1', 'Tablet 2', 'Tablet 3', 'Tablet 4'];
  List<int> tabletsRemaining = [10, 20, 30, 40];
  List<bool> remainders = [false, true, false, true];
  TextEditingController box1Controller = TextEditingController();
  TextEditingController box2Controller = TextEditingController();
  TextEditingController box3Controller = TextEditingController();
  TextEditingController box4Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(21, 29, 54, 1),
          title: Text('Physical Health'),
        ),
        body: Container(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(height: 1.0),
                Text('Age'),
                TextFormField(
                  controller: box1Controller,
                  decoration: InputDecoration(
                    labelText: '$usr_age',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton.icon(
                  onPressed: () {
                    usr_age = box1Controller.text;
                  },
                  icon: Icon(Icons.update),
                  label: Text('Update'),
                ),
                Text('Pregnant Month'),
                SizedBox(height: 1.0),
                TextFormField(
                  controller: box2Controller,
                  decoration: InputDecoration(
                    labelText: '$usr_pmonth',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton.icon(
                  onPressed: () {
                    usr_pmonth = box2Controller.text;
                  },
                  icon: Icon(Icons.update),
                  label: Text('Update'),
                ),
                SizedBox(height: 1.0),
                Text('Height'),
                TextFormField(
                  controller: box3Controller,
                  decoration: InputDecoration(
                    labelText: '$usr_height',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton.icon(
                  onPressed: () {
                    usr_height = box3Controller.text;
                  },
                  icon: Icon(Icons.update),
                  label: Text('Update'),
                ),
                SizedBox(height: 1.0),
                Text('Weight'),
                TextFormField(
                  controller: box4Controller,
                  decoration: InputDecoration(
                    labelText: '$usr_weight',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton.icon(
                  onPressed: () {
                    usr_weight = box4Controller.text;
                  },
                  icon: Icon(Icons.update),
                  label: Text('Update'),
                ),
                SizedBox(height: 32.0),
                Table(
                  border: TableBorder.all(),
                  columnWidths: {
                    0: FlexColumnWidth(3),
                    1: FlexColumnWidth(2),
                    2: FlexColumnWidth(2),
                  },
                  children: [
                    TableRow(
                      children: [
                        TableCell(
                          child: Text('Tablet Name'),
                        ),
                        TableCell(
                          child: Text('Tablets Remaining'),
                        ),
                        TableCell(
                          child: Text('Remainder'),
                        ),
                      ],
                    ),
                    for (int i = 0; i < tabletNames.length; i++)
                      TableRow(
                        children: [
                          TableCell(
                            child: Text(tabletNames[i]),
                          ),
                          TableCell(
                            child: TextFormField(
                              initialValue: tabletsRemaining[i].toString(),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          TableCell(
                            child: Checkbox(
                              value: remainders[i],
                              onChanged: (value) {
                                setState(() {
                                  remainders[i] = value!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
                SizedBox(height: 16.0),
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      tabletNames.add('New Tablet');
                      tabletsRemaining.add(0);
                      remainders.add(false);
                    });
                  },
                  icon: Icon(Icons.add),
                  label: Text('Add Row'),
                ),
              ],
            ),
          ),
        ));
  }
}
