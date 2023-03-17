import 'dart:async';
import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:gensshop/app_constants.dart';
import 'package:gensshop/model/order_model.dart';
import 'package:http/http.dart' as http;
import 'package:passcode_screen/circle.dart';
import 'package:passcode_screen/keyboard.dart';
import 'package:passcode_screen/passcode_screen.dart';

class Screen03 extends StatefulWidget {
  const Screen03({super.key});

  @override
  State<Screen03> createState() => _Screen03State();
}

class _Screen03State extends State<Screen03> {
  final StreamController<bool> _verificationNotifier =
      StreamController<bool>.broadcast();
  final storedPasscode = '123456';

  bool isAuthenticated = false;

  late List<Data>? listOrder = [];

  void getAPI() async {
    try {
      var url = Uri.http(HOST, '/orderwherecust_id', {'cust_id': '13622'});

      var response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });

      if (response.statusCode == 200) {
        OrderModel gorder =
            OrderModel.fromJson(convert.jsonDecode(response.body));

        setState(() {
          listOrder = gorder.data;
        });
      } else {
        throw Exception('Failed to load Data');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  } //getAPI

  @override
  void initState() {
    getAPI();
    Future.delayed(const Duration(seconds: 1)).then((value) => showPassCode());
    super.initState();
  }

  @override
  void dispose() {
    _verificationNotifier.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isAuthenticated) {
      return ListView.builder(
        itemCount: listOrder!.length,
        itemBuilder: (context, index) {
          Data? order = listOrder![index];
          return Card(
            child: ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: Text(order.productName.toString()),
              subtitle: Text("${order.orderNum} ชิ้น"),
            ),
          );
        },
      );
    } else {
      return const Center(
        child: Text("Please enter passcode"),
      );
    }
  }

  Future<void> showPassCode() {
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
