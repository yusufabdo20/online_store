import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../settings/presentation/settings_screen.dart';
import 'home_view_body.dart';

class LayoutView extends StatefulWidget {
  LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  int sellectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> items = [
      const BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          ),
          label: "Home"),
      const BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite,
          ),
          label: "favorite"),
      BottomNavigationBarItem(
        icon: SvgPicture.asset("assets/images/Bag.svg"),
        label: "Bag",
      ),
      const BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite,
          ),
          label: "favorite"),
      const BottomNavigationBarItem(
          icon: Icon(
            Icons.settings,
          ),
          label: "settings"),
    ];
    final List<Widget> screens = [
      const HomeViewBody(),
      const Text(
        "2",
        style: TextStyle(
          color: Colors.red,
          fontSize: 50,
        ),
      ),
      const Text(
        "3",
        style: TextStyle(
          color: Colors.red,
          fontSize: 50,
        ),
      ),
      const Text(
        "4",
        style: TextStyle(
          color: Colors.red,
          fontSize: 50,
        ),
      ),
       SettingsScreen(),
    ];

    return Scaffold(
        appBar: AppBar(
          actions: [
            Stack(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_border,
                      color: Colors.red,
                      size: 40,
                    )),
                Positioned(
                  top: 3,
                  left: 5,
                  child: CircleAvatar(
                    backgroundColor: Colors.deepPurple,
                    radius: 15,
                    child: Text(
                      "5",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.notifications_outlined,
                      color: Colors.purpleAccent,
                      size: 40,
                    )),
                Positioned(
                  top: 3,
                  left: 5,
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.deepPurple,
                  ),
                ),
              ],
            ),
          ],
          leading: SvgPicture.asset("assets/images/Diamond.svg"),
          title: const Text("Online Store"),
        ),
        body: Center(
          child: screens[sellectedPageIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          // iconSize: 2,
          type: BottomNavigationBarType.shifting,

          unselectedItemColor: Colors.black,

          items: items,
          elevation: 0,
          currentIndex: sellectedPageIndex,
          onTap: (value) {
            setState(() {
              sellectedPageIndex = value;
            });
            print("sellectedPageIndex $sellectedPageIndex");
            print("Value $value");
            print("OnTap");
          },

          selectedIconTheme: const IconThemeData(
            color: Colors.red,
          ),
          // backgroundColor: Colors.,
        ));
  }
}
