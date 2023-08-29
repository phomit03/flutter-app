
import 'package:appname/widgets/dimension_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({ super.key});

  //Dinh nghia router cho class
  static const routerName = "/main_page";

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  @override
  Widget build (BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold (
          body: IndexedStack(
            index: _currentIndex,
            // 1 children (screen) se ung voi 1 SalomonBottomBarItem
            children: [
              Stack(  //dat 2 lop tren nhau, bg:Container va noidung: SizedBox
                children: [
                  Container(
                    color: Colors.blue,
                    width: double.infinity, //double.infinity: full size
                    height: double.infinity,
                  ),
                  const SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        Text(
                          "This is home page!",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Container (color: Colors.green),
              Container (color:Colors.pink),
              Container (color: Colors.red),
            ],
          ),

          bottomNavigationBar: SalomonBottomBar(
            currentIndex: _currentIndex,

            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },

            selectedItemColor: Colors.red,
            unselectedItemColor: Colors.black,
            margin: const EdgeInsets.symmetric(
              vertical: kDefaultPadding,
              horizontal: kMinPadding
            ),

            items: [    //bottom bar (icon)
              SalomonBottomBarItem(
                icon: const Icon(
                  FontAwesomeIcons.house,
                  size: kDefaultIconSize
                ),
                title: const Text("Home")
              ),
              SalomonBottomBarItem(
                icon: const Icon(
                    FontAwesomeIcons.search,
                    size: kDefaultIconSize
                ),
                title: const Text("Search")
              ),
              SalomonBottomBarItem(
                icon: const Icon(
                    FontAwesomeIcons.briefcase,
                    size: kDefaultIconSize
                ),
                title: const Text("Booking")
              ),
              SalomonBottomBarItem(
                icon: const Icon(
                    FontAwesomeIcons.solidUser,
                    size: kDefaultIconSize
                ),
                title: const Text("Profile")
              ),
            ],
          ),
        ),
      ),
    );
  }
}

