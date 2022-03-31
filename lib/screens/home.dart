import 'package:com_test/tabs/inbox.dart';
import 'package:com_test/tabs/profile.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

const List<Widget> icons = [
  Icon(Iconsax.home5),
  Icon(Iconsax.send_2),
  Icon(Iconsax.document_upload),
  Icon(Iconsax.direct),
  Icon(Iconsax.user_tag),
];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    Center(
      child: Text('Home'),
    ),
    Center(
      child: Text('Mesages'),
    ),
    Center(
      child: Text('Upload'),
    ),
    Inbox(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages.elementAt(_selectedIndex), //New
      ),
      bottomNavigationBar: DotNavigationBar(
        onTap: (int val) {
          setState(() {
            _selectedIndex = val;
          });
        },
        margin: const EdgeInsets.all(0),
        marginR: const EdgeInsets.symmetric(horizontal: 0, vertical: 2),
        itemPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        currentIndex: _selectedIndex,
        borderRadius: 30,
        dotIndicatorColor: Colors.transparent,
        backgroundColor: const Color(0xFF333333),
        selectedItemColor: const Color(0xFF333333),
        unselectedItemColor: const Color(0xFFFFFFFF),
        items: icons
            .map((e) => DotNavigationBarItem(
                selectedColor: const Color(0xFF333333),
                icon: icons.indexOf(e) == _selectedIndex
                    ? FloatingActionButton(
                        onPressed: null,
                        child: e,
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                      )
                    : e))
            .toList(),
      ),
    );
  }
}
