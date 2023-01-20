import 'package:flutter/material.dart';
import 'package:flutter_app/components/popup_menu.dart';
import 'package:flutter_app/constants/app_constants.dart';
import 'package:flutter_app/screen1/screen01.dart';
import 'package:flutter_app/screen2/screen02.dart';
import 'package:flutter_app/screen4/screen4.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.macOS: FadeUpwardsPageTransitionsBuilder(),
          },
        ),
      ),
      home: const MyHomeScreen(),
      // routes: routesApp,
    );
  }
}

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  String menuName = '';

  int element = 0;

  //list widget
  final List<Widget> _widgetOptions = <Widget>[
    const Screen04(
      imgUrl:
          'https://media.comicbook.com/2021/08/one-piece-kaido-defeat-1278743.jpeg?auto=webp',
      characterName: 'Kaido',
      gender: 'F',
    ),
    const Screen04(
      imgUrl:
          'https://static.wikia.nocookie.net/onepiece/images/d/d8/Charlotte_Linlin_Anime_Infobox.png/revision/latest?cb=20180423150804',
      characterName: 'Big Mom',
      gender: 'F',
    ),
    const Screen04(
      imgUrl:
          'https://static.wikia.nocookie.net/p__/images/8/81/Hancock_and_Salome_render.png/revision/latest?cb=20200419093511&path-prefix=protagonist',
      characterName: 'Hancock',
      gender: 'F',
    ),
    const Screen04(
      imgUrl:
          'https://preview.redd.it/nsridjetgcx61.jpg?auto=webp&s=3ee8a0da8263a1cb2bf6de9ec25518af8a77ca81',
      characterName: 'Trafalgar',
      gender: 'M',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            setState(() {
              menuName = '';
            });
          },
          child: const Icon(Icons.home),
        ),
        title: const Text(
          APP_TITLE,
          style: TextStyle(
            color: Colors.white,
            fontSize: 35,
            fontFamily: 'Rowdies',
            letterSpacing: 1.5,
            shadows: [
              Shadow(
                color: Colors.redAccent,
                offset: Offset(1.0, 3.0),
              )
            ],
          ),
        ),
        actions: [
          PopUpMenuButtonComponent(onSelected: _onSelected),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: _widgetOptions.elementAt(element),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.cyan,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                element = 0;
              },
              icon: const Icon(Icons.home),
            ),
            IconButton(
              onPressed: () {
                element = 1;
              },
              icon: const Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {
                element = 2;
              },
              icon: const Icon(Icons.favorite),
            ),
            IconButton(
              onPressed: () {
                element = 3;
              },
              icon: const Icon(Icons.man),
            ),
          ],
        ),
      ),
    );
  }

  void _onSelected(int value) {
    setState(() {
      //menuName = 'screen ${value + 1}';
      // Navigator.pushNamed(context, 'screen ${value + 1}');
      if (value == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Screen01()),
        );
      } else if (value == 2) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Screen02()),
        );
      } else if (value == 3) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Screen04(
              imgUrl:
                  'https://static.wikia.nocookie.net/p__/images/8/81/Hancock_and_Salome_render.png/revision/latest?cb=20200419093511&path-prefix=protagonist',
              characterName: 'Hancock',
              gender: 'F',
            ),
          ),
        );
      } else if (value == 4) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Screen04(
              imgUrl:
                  'https://preview.redd.it/nsridjetgcx61.jpg?auto=webp&s=3ee8a0da8263a1cb2bf6de9ec25518af8a77ca81',
              characterName: 'Trafalgar',
              gender: 'M',
            ),
          ),
        );
      }
    });
  }
}
