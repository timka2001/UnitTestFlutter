import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rolling_switch/rolling_switch.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

TextEditingController nameReController = TextEditingController(text: 'Timur');
TextEditingController loginReController =
    TextEditingController(text: 'gr.timurik2001@gmail.com');
TextEditingController lastNameReController =
    TextEditingController(text: 'Gruzkov');
TextEditingController phoneREController =
    TextEditingController(text: '89872788468');

TextEditingController loginController =
    TextEditingController(text: 'gr.timurik2001@gmail.com');
TextEditingController phoneController =
    TextEditingController(text: '89872788468');

bool check = false;
bool infoSubmit = false;

class _MyHomePageState extends State<MyHomePage> {
  int counter_ = 70;

  ValidInformation valid_ = ValidInformation();

  String answerLogin = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          height: double.maxFinite,
          child: Image.network(
            "https://images.unsplash.com/photo-1583407733101-223204b57928?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80",
            fit: BoxFit.fitHeight,
          ),
        ),
        SafeArea(
          child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                answerLogin,
                style: TextStyle(
                    color: Colors.pink,
                    fontSize: 30,
                    fontWeight: FontWeight.w500),
              )),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            width: (MediaQuery.of(context).size.width / 100) * 90,
            height: (MediaQuery.of(context).size.height / 100) * counter_,
            decoration: BoxDecoration(
              color: Colors.white54,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: (MediaQuery.of(context).size.height / 100 * 2),
                  ),
                  child: RollingSwitch.icon(
                    width: (MediaQuery.of(context).size.width / 100) * 70,
                    onChanged: (bool state) {
                      print('turned ${(state) ? 'on' : 'off'}');
                      setState(() {
                        check = state;
                        if (check) {
                          counter_ = 50;
                          setState(() {
                            answerLogin = "";
                          });
                        } else {
                          counter_ = 70;
                          answerLogin = "";
                        }
                      });
                    },
                    rollingInfoRight: const RollingIconInfo(
                      icon: Icons.flag,
                      backgroundColor: Color.fromARGB(255, 1, 248, 166),
                      text: Text(
                        "Вход",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    rollingInfoLeft: const RollingIconInfo(
                      icon: Icons.check,
                      backgroundColor: Colors.pink,
                      text: Text(
                        "Регистрация",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                LayoutBuilder(
                  builder: (context, constraints) {
                    if (check) {
                      return Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: (MediaQuery.of(context).size.height /
                                  100 *
                                  4),
                            ),
                            child: SizedBox(
                                width:
                                    (MediaQuery.of(context).size.width / 100) *
                                        80,
                                height:
                                    (MediaQuery.of(context).size.height / 100) *
                                        8,
                                child: TextField(
                                  controller: loginController,
                                  key: Key('loginController'),
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: "Login",
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                          const Radius.circular(15.0)),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 216, 243, 247),
                                          width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
                                      borderSide: BorderSide(
                                          color: Colors.cyan, width: 1),
                                    ),
                                  ),
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: (MediaQuery.of(context).size.height /
                                  100 *
                                  2),
                            ),
                            child: SizedBox(
                                width:
                                    (MediaQuery.of(context).size.width / 100) *
                                        80,
                                height:
                                    (MediaQuery.of(context).size.height / 100) *
                                        8,
                                child: TextFormField(
                                  key: Key('phoneController'),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  controller: phoneController,
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: "Phone",
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                          const Radius.circular(15.0)),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 216, 243, 247),
                                          width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
                                      borderSide: BorderSide(
                                          color: Colors.cyan, width: 1),
                                    ),
                                  ),
                                )),
                          ),
                        ],
                      );
                    } else {
                      return Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: (MediaQuery.of(context).size.height /
                                  100 *
                                  4),
                            ),
                            child: SizedBox(
                                width:
                                    (MediaQuery.of(context).size.width / 100) *
                                        80,
                                height:
                                    (MediaQuery.of(context).size.height / 100) *
                                        8,
                                child: TextField(
                                  controller: nameReController,
                                  key: Key('nameReController'),
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: "Name",
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                          const Radius.circular(15.0)),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 216, 243, 247),
                                          width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
                                      borderSide: BorderSide(
                                          color: Colors.cyan, width: 1),
                                    ),
                                  ),
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: (MediaQuery.of(context).size.height /
                                  100 *
                                  2),
                            ),
                            child: SizedBox(
                                width:
                                    (MediaQuery.of(context).size.width / 100) *
                                        80,
                                height:
                                    (MediaQuery.of(context).size.height / 100) *
                                        8,
                                child: TextField(
                                  key: Key('lastNameReController'),
                                  controller: lastNameReController,
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: "Last Name",
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                          const Radius.circular(15.0)),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 216, 243, 247),
                                          width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
                                      borderSide: BorderSide(
                                          color: Colors.cyan, width: 1),
                                    ),
                                  ),
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: (MediaQuery.of(context).size.height /
                                  100 *
                                  3),
                            ),
                            child: SizedBox(
                                width:
                                    (MediaQuery.of(context).size.width / 100) *
                                        80,
                                height:
                                    (MediaQuery.of(context).size.height / 100) *
                                        8,
                                child: TextField(
                                  controller: loginReController,
                                  key: Key('loginReController'),
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: "Login",
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                          const Radius.circular(15.0)),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 216, 243, 247),
                                          width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
                                      borderSide: BorderSide(
                                          color: Colors.cyan, width: 1),
                                    ),
                                  ),
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: (MediaQuery.of(context).size.height /
                                  100 *
                                  2),
                            ),
                            child: SizedBox(
                                width:
                                    (MediaQuery.of(context).size.width / 100) *
                                        80,
                                height:
                                    (MediaQuery.of(context).size.height / 100) *
                                        8,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  key: Key('phoneREController'),
                                  controller: phoneREController,
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: "Phone",
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                          const Radius.circular(15.0)),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 216, 243, 247),
                                          width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
                                      borderSide: BorderSide(
                                          color: Colors.cyan, width: 1),
                                    ),
                                  ),
                                )),
                          ),
                        ],
                      );
                    }
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: (MediaQuery.of(context).size.height / 100 * 6),
                  ),
                  child: InkWell(
                    child: Container(
                      width: (MediaQuery.of(context).size.width / 100) * 50,
                      height: (MediaQuery.of(context).size.height / 100) * 8,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 103, 178, 240),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Center(
                          child: Text(
                        "Вход",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                    ),
                    onTap: () {
                      print("Вы нажали кнопку");
                      if (check) {
                        print(loginController.text);
                        print(phoneController.text);
                        if (valid_.isValidEmail(loginController.text) &&
                            valid_.isValidPhoneNumber(phoneController.text)) {
                          setState(() {
                            answerLogin = "Добро пожаловать";
                          });
                        } else {
                          setState(() {
                            answerLogin = "Ошибка при заполнении";
                          });
                        }
                      } else {
                        print(loginReController.text);
                        print(phoneREController.text);
                        print(nameReController.text);
                        print(lastNameReController.text);
                        if (valid_.isValidEmail(loginReController.text) &&
                            valid_.isValidPhoneNumber(phoneREController.text) &&
                            valid_.isValidNameAndLastName(
                                nameReController.text) &&
                            valid_.isValidNameAndLastName(
                                lastNameReController.text)) {
                          setState(() {
                            answerLogin = "Добро пожаловать";
                          });
                        } else {
                          setState(() {
                            answerLogin = "Ошибка при заполнении";
                          });
                        }
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

class ValidInformation {
  bool isValidPhoneNumber(String string) {
    // Null or empty string is invalid phone number
    if (string == null || string.isEmpty) {
      return false;
    }

    // You may need to change this pattern to fit your requirement.
    // I just copied the pattern from here: https://regexr.com/3c53v
    const pattern = r'^(?:[+0][1-9])?[0-9]{10,11}$';

    final regExp = RegExp(pattern);

    return regExp.hasMatch(string);
  }

  bool isValidEmail(String em) {
    if (em == null || em.isEmpty) {
      return false;
    }
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(em);
  }

  bool isValidNameAndLastName(String nL) {
    String p = r'^([a-zA-Z]{2,})$';

    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(nL);
  }
}
