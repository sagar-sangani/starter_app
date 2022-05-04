import 'package:flutter/material.dart';
import 'package:starter_app/app/theme/tw_colors.dart';
import 'package:starter_app/app/views/tasks/login/numpad_widget.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Map<String, int?> passwordDigits = {
    'digit1': null,
    'digit2': null,
    'digit3': null,
    'digit4': null,
  };

  int getCurrentIndex() {
    int index = 0;
    passwordDigits.forEach((key, value) {
      if (value != null) {
        index++;
      }
    });
    return index;
  }

  void setEnteredDigit(int digit) {
    var currentIndex = getCurrentIndex();
    if (currentIndex == passwordDigits.length) {
      return;
    }
    var passwordDigitsKey = 'digit${currentIndex + 1}';

    setState(() {
      passwordDigits[passwordDigitsKey] = digit;
    });
  }

  void deleteNumber() {
    if (getCurrentIndex() > 0) {
      setState(() {
        passwordDigits['digit${getCurrentIndex()}'] = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var fullHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: TWColors.white.withRed(29).withGreen(42).withBlue(71),
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          'Login',
          style: TextStyle(
            color: TWColors.slate[300],
          ),
        ),
        backgroundColor: TWColors.white.withRed(29).withGreen(42).withBlue(71),
      ),
      body: Container(
        width: double.infinity,
        height: fullHeight - kToolbarHeight,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20),
          ),
          color: Color(0xFFF6F5FC),
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 90),
              child: Center(
                child: Text(
                  'Jhon Doe',
                  style: TextStyle(
                    color: TWColors.slate[800],
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: Center(
                child: Text(
                  'jhon@doe.com',
                  style: TextStyle(
                    color: TWColors.slate[800],
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...passwordDigits.entries
                      .map(
                        (entry) => AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.only(left: 10),
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: TWColors.white,
                              border: getCurrentIndex() ==
                                      passwordDigits.entries
                                          .map((e) => e.key)
                                          .toList()
                                          .indexOf(entry.key)
                                  ? Border.all(
                                      color: Colors.blue,
                                      width: 2,
                                    )
                                  : null,
                              boxShadow: [
                                if (getCurrentIndex() ==
                                    passwordDigits.entries
                                        .map((e) => e.key)
                                        .toList()
                                        .indexOf(entry.key))
                                  BoxShadow(
                                    color: Colors.blue.withOpacity(0.2),
                                    blurRadius: 5,
                                    offset: const Offset(0, 2),
                                    spreadRadius: 2.0,
                                  )
                              ],
                            ),
                            child: passwordDigits[entry.key] != null
                                ? Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      passwordDigits[entry.key].toString(),
                                      style: TextStyle(
                                        color: TWColors.slate[800],
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  )
                                : null),
                      )
                      .toList()
                  // Container(
                  //   height: 50,
                  //   width: 50,
                  //   decoration: BoxDecoration(
                  //     shape: BoxShape.circle,
                  //     color: TWColors.white,
                  //     border: Border.all(color: TWColors.blue),
                  //     boxShadow: const [
                  //       BoxShadow(
                  //         blurRadius: 4,
                  //         color: TWColors.blue,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
            const SizedBox(height: 35),
            SizedBox(
              width: double.infinity,
              child: Center(
                child: Text(
                  'Forgot your password?',
                  style: TextStyle(
                    color: TWColors.slate[600],
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            const Spacer(),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(),
              color: TWColors.white,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      NumPad(
                        digit: 1,
                        onTap: setEnteredDigit,
                      ),
                      NumPad(
                        digit: 2,
                        onTap: setEnteredDigit,
                      ),
                      NumPad(
                        digit: 3,
                        onTap: setEnteredDigit,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      NumPad(
                        digit: 4,
                        onTap: setEnteredDigit,
                      ),
                      NumPad(
                        digit: 5,
                        onTap: setEnteredDigit,
                      ),
                      NumPad(
                        digit: 6,
                        onTap: setEnteredDigit,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      NumPad(
                        digit: 7,
                        onTap: setEnteredDigit,
                      ),
                      NumPad(
                        digit: 8,
                        onTap: setEnteredDigit,
                      ),
                      NumPad(
                        digit: 9,
                        onTap: setEnteredDigit,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: IconButton(
                          onPressed: deleteNumber,
                          icon: Icon(
                            Icons.backspace_outlined,
                            size: 30,
                            color: TWColors.slate[800],
                          ),
                        ),
                      ),
                      NumPad(
                        digit: 0,
                        onTap: setEnteredDigit,
                      ),
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.fingerprint,
                            size: 35,
                            color: TWColors.slate[800],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
