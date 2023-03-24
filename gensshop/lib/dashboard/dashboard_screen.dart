import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gensshop/screens/screen-01/screen01.dart';
import 'package:gensshop/screens/screen-02/screen02.dart';
import 'package:gensshop/screens/screen-03/screen03.dart';
import 'package:gensshop/screens/verify/employee.dart';
import 'package:passcode_screen/circle.dart';
import 'package:passcode_screen/keyboard.dart';
import 'package:passcode_screen/passcode_screen.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int _selectedIndex = 0;

  final StreamController<bool> _verificationNotifier =
      StreamController<bool>.broadcast();
  final storedPasscode = '123456';

  bool isAuthenticated = false;

  _onTabItem(int index) {
    showPassCode();
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _verificationNotifier.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const List<Widget> widgetOptions = <Widget>[
      Screen01(),
      Screen02(),
      Screen03(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(isAuthenticated ? 'Gens Shop' : 'บริการอื่นๆ'),
        actions: [
          if (isAuthenticated)
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                setState(() {
                  isAuthenticated = false;
                });
              },
            )
        ],
      ),
      body: isAuthenticated
          ? widgetOptions.elementAt(_selectedIndex)
          : const Employee(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank),
            label: 'อาหาร',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_drink),
            label: 'เครื่องดื่ม',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'รายการสั่งซื้อ',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onTabItem,
      ),
    );
  }

  Future<void> showPassCode() {
    if (isAuthenticated == false) {
      return _showLockScreen(
        context,
        opaque: false,
        cancelButton: const Text(
          'Cancel',
          style: TextStyle(fontSize: 16, color: Colors.white),
          semanticsLabel: 'Cancel',
        ),
      );
    }
    return Future.value();
  }

  _showLockScreen(
    BuildContext context, {
    required bool opaque,
    CircleUIConfig? circleUIConfig,
    KeyboardUIConfig? keyboardUIConfig,
    required Widget cancelButton,
    List<String>? digits,
  }) {
    Navigator.push(
        context,
        PageRouteBuilder(
          opaque: opaque,
          pageBuilder: (context, animation, secondaryAnimation) =>
              PasscodeScreen(
            title: const Text(
              'Enter App Passcode',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 28),
            ),
            circleUIConfig: circleUIConfig,
            keyboardUIConfig: keyboardUIConfig,
            passwordEnteredCallback: _onPasscodeEntered,
            cancelButton: cancelButton,
            deleteButton: const Text(
              'Delete',
              style: TextStyle(fontSize: 16, color: Colors.white),
              semanticsLabel: 'Delete',
            ),
            shouldTriggerVerification: _verificationNotifier.stream,
            backgroundColor: Colors.black.withOpacity(0.8),
            cancelCallback: _onPasscodeCancelled,
            digits: digits,
            passwordDigits: 6,
            bottomWidget: _buildPasscodeRestoreButton(),
          ),
        ));
  }

  _onPasscodeEntered(String enteredPasscode) {
    bool isValid = storedPasscode == enteredPasscode;
    _verificationNotifier.add(isValid);
    if (isValid) {
      setState(() {
        isAuthenticated = isValid;
      });
    }
  }

  _onPasscodeCancelled() {
    Navigator.maybePop(context);
  }

  _buildPasscodeRestoreButton() => Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: const EdgeInsets.only(bottom: 10.0, top: 20.0),
          child: TextButton(
            onPressed: _resetAppPassword,
            child: const Text(
              "Reset passcode",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w300),
            ),
          ),
        ),
      );

  _resetAppPassword() {
    Navigator.maybePop(context).then((result) {
      if (!result) {
        return;
      }
      _showRestoreDialog(() {
        Navigator.maybePop(context);
      });
    });
  }

  _showRestoreDialog(VoidCallback onAccepted) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Reset passcode",
            style: TextStyle(color: Colors.black87),
          ),
          content: const Text(
            "Passcode reset is a non-secure operation!\n\nConsider removing all user data if this action performed.",
            style: TextStyle(color: Colors.black87),
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            TextButton(
              child: const Text(
                "Cancel",
                style: TextStyle(fontSize: 18),
              ),
              onPressed: () {
                Navigator.maybePop(context);
              },
            ),
            TextButton(
              onPressed: onAccepted,
              child: const Text(
                "I understand",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        );
      },
    );
  }
}
