import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:starter_app/app/theme/tw_colors.dart';

class Task4 extends StatefulWidget {
  const Task4({Key? key}) : super(key: key);

  @override
  State<Task4> createState() => _Task4State();
}

class _Task4State extends State<Task4> {
  bool _isVisible = false;
  bool _isPasswordHasEightCharacter = false;
  bool _hasPasswordOneDigit = false;
  bool _hasPasswordOneUppercase = false;
  bool _hasPasswordOneLowercase = false;
  bool _hasPasswordStartWithAlpabetCharacter = false;
  bool _hasPasswordOneSpecialCharacter = false;
  TextEditingController passwordController = TextEditingController();

  void _checkPassword(String password) {
    final numericRegex = RegExp(r'[0-9]');
    final upperAlpabetRegex = RegExp(r'[A-Z]');
    final lowerAlpabetRegex = RegExp(r'[a-z]');
    final alphabetRegex = RegExp(r'[a-zA-Z]');
    final specialCharacterRegex = RegExp(r'[#?!@$%^&*-.<^>~!]');

    setState(() {
      _isPasswordHasEightCharacter = false;
      if (password.length >= 8) {
        _isPasswordHasEightCharacter = true;
      }

      _hasPasswordOneDigit = false;
      if (numericRegex.hasMatch(password)) {
        _hasPasswordOneDigit = true;
      }

      _hasPasswordOneUppercase = false;
      if (upperAlpabetRegex.hasMatch(password)) {
        _hasPasswordOneUppercase = true;
      }

      _hasPasswordOneLowercase = false;
      if (lowerAlpabetRegex.hasMatch(password)) {
        _hasPasswordOneLowercase = true;
      }

      _hasPasswordStartWithAlpabetCharacter = false;
      if (password.isNotEmpty &&
          alphabetRegex.hasMatch(password.characters.first)) {
        _hasPasswordStartWithAlpabetCharacter = true;
      }

      _hasPasswordOneSpecialCharacter = false;
      if (specialCharacterRegex.hasMatch(password)) {
        _hasPasswordOneSpecialCharacter = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: TWColors.slate.shade50,
        title: Text(
          'Registration',
          style: TextStyle(fontSize: 22, color: TWColors.slate.shade900),
        ),
      ),
      backgroundColor: TWColors.slate.shade50,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
            // color: TWColors.blue.shade100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'First  Name',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 5),
                          TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: TWColors.black),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 30),
                    Flexible(
                      flex: 3,
                      fit: FlexFit.tight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Last Name',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 5),
                          TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: TWColors.black),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'User name',
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 5),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: TWColors.black),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                IntrinsicHeight(
                  child: Row(
                    children: [
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Password',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 5),
                            TextField(
                              onChanged: (password) => _checkPassword(password),
                              obscureText: !_isVisible,
                              controller: passwordController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: TWColors.black),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        padding: const EdgeInsets.only(
                            top: 5, bottom: 5, left: 5, right: 5),
                        child: IconButton(
                            splashRadius: 0.1,
                            icon: _isVisible
                                ? const Icon(
                                    BootstrapIcons.eye,
                                    size: 20,
                                  )
                                : Icon(BootstrapIcons.eye_slash_fill,
                                    size: 20, color: TWColors.slate.shade400),
                            onPressed: () {
                              setState(() {
                                _isVisible = !_isVisible;
                              });
                            }),
                        decoration: ShapeDecoration(
                          // color: TWColors.blue.shade100,
                          shape: SmoothRectangleBorder(
                            side: BorderSide(
                              color: TWColors.black.withOpacity(0.4),
                            ),
                            borderRadius: SmoothBorderRadius(
                              cornerRadius: 15,
                              cornerSmoothing: 1.0,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                if (passwordController.text.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _isPasswordHasEightCharacter
                                ? const Icon(BootstrapIcons.check_circle_fill,
                                    size: 18, color: TWColors.green)
                                : const Icon(BootstrapIcons.x_circle_fill,
                                    size: 18, color: TWColors.red),
                            const SizedBox(width: 10),
                            const Flexible(
                              fit: FlexFit.tight,
                              child: Text(
                                'Should include at least 8 character.',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _hasPasswordStartWithAlpabetCharacter
                                ? const Icon(BootstrapIcons.check_circle_fill,
                                    size: 18, color: TWColors.green)
                                : const Icon(BootstrapIcons.x_circle_fill,
                                    size: 18, color: TWColors.red),
                            const SizedBox(width: 10),
                            const Flexible(
                              fit: FlexFit.tight,
                              child: Text(
                                'Should start with an alphabet.',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _hasPasswordOneUppercase
                                ? const Icon(BootstrapIcons.check_circle_fill,
                                    size: 18, color: TWColors.green)
                                : const Icon(BootstrapIcons.x_circle_fill,
                                    size: 18, color: TWColors.red),
                            const SizedBox(width: 10),
                            const Flexible(
                              fit: FlexFit.tight,
                              child: Text(
                                'Include at least one Uppercase character.',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _hasPasswordOneLowercase
                                ? const Icon(BootstrapIcons.check_circle_fill,
                                    size: 18, color: TWColors.green)
                                : const Icon(BootstrapIcons.x_circle_fill,
                                    size: 18, color: TWColors.red),
                            const SizedBox(width: 10),
                            const Flexible(
                              fit: FlexFit.tight,
                              child: Text(
                                'Include at least one Lowercase character.',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _hasPasswordOneDigit
                                ? const Icon(BootstrapIcons.check_circle_fill,
                                    size: 18, color: TWColors.green)
                                : const Icon(BootstrapIcons.x_circle_fill,
                                    size: 18, color: TWColors.red),
                            const SizedBox(width: 10),
                            const Flexible(
                              fit: FlexFit.tight,
                              child: Text(
                                'Include at least one Digit.',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _hasPasswordOneSpecialCharacter
                                ? const Icon(BootstrapIcons.check_circle_fill,
                                    size: 18, color: TWColors.green)
                                : const Icon(BootstrapIcons.x_circle_fill,
                                    size: 18, color: TWColors.red),
                            const SizedBox(width: 10),
                            const Flexible(
                              fit: FlexFit.tight,
                              child: Text(
                                'Include at least one special character [\$.,-,_?]',
                                style: TextStyle(fontSize: 16),
                                overflow: TextOverflow.clip,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                const SizedBox(height: 40),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: ShapeDecoration(
                    color: TWColors.blue.shade500,
                    shape: SmoothRectangleBorder(
                      borderRadius: SmoothBorderRadius(
                        cornerRadius: 10,
                        cornerSmoothing: 1.0,
                      ),
                    ),
                  ),
                  child: (_hasPasswordOneDigit &&
                          _hasPasswordOneLowercase &&
                          _hasPasswordOneSpecialCharacter &&
                          _hasPasswordOneUppercase &&
                          _hasPasswordStartWithAlpabetCharacter &&
                          _isPasswordHasEightCharacter)
                      ? TextButton(
                          onPressed: () {},
                          child: const Text(
                            'SUBMIT',
                            style:
                                TextStyle(fontSize: 20, color: TWColors.black),
                          ),
                        )
                      : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
