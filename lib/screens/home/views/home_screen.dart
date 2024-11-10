import 'dart:math';
import 'package:coinlytic/screens/add_expense/views/add_expense.dart';
import 'package:coinlytic/screens/home/views/main_screen.dart';
import 'package:coinlytic/screens/stats/stats.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  late Color selectedItem = Colors.pink;
  Color unselectedItem = Colors.grey;

  // @override
  // void initState() {
  //   Color selectedItem = Theme.of(context).colorScheme.primary;
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appBar: AppBar(),
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
          child: BottomNavigationBar(
            onTap: (value) {
              setState(() {
                index = value;
              });
            },
            //backgroundColor: Colors.white,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 9,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  //color: Colors.grey,
                  //color: index == 0 ? selectedItem : unselectedItem,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.query_stats,
                  //color: index == 1 ? selectedItem : unselectedItem,
                ),
                label: 'Stats',
              )
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const AddExpense(),
                ));
          },
          shape: const CircleBorder(),
          child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.tertiary,
                    Theme.of(context).colorScheme.secondary,
                    Theme.of(context).colorScheme.primary,
                  ],
                  transform: const GradientRotation(pi / 4),
                ),
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              )),
        ),
        body: index == 0 ? MainScreen() : StatScreen());
  }
}
