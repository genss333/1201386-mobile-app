import 'package:flutter/material.dart';
import 'package:gensshop/screens/screen-01/screen01.dart';
import 'package:gensshop/screens/screen-02/screen02.dart';
import 'package:gensshop/screens/screen-03/screen03.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int _selectedIndex = 0;

  _onTabItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
        title: const Text('Gens Shop'),
      ),
      body: widgetOptions.elementAt(_selectedIndex),
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
}
