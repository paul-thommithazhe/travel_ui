import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_ui2/widgets/hotel_carousel.dart';

import '../destination_carousel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _currentTab = 0;
  List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.personWalking,
    FontAwesomeIcons.personBiking,
  ];

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
        print(_selectedIndex);
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          color: _selectedIndex == index
              ? Theme.of(context).colorScheme.secondary
              : Color(0xFFE7bEE),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(
          _icons[index],
          size: 25.0,
          color: _selectedIndex == index
              ? Theme.of(context).primaryColor
              : Color(0xFFB4C1C4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          child: ListView(
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                ),
                child: Text(
                  'What you would like to find?',
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: _icons
                    .asMap()
                    .entries
                    .map((map) => _buildIcon(map.key))
                    .toList(),
              ),
              SizedBox(height: 20.0),
              DestionationCarousel(),
              HotelCarousel(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xFF3EBACE),
        onTap: (int value) {
          setState(() {
            _currentTab = value;
          });
        },
        currentIndex: _currentTab,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 30,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.local_pizza,
                size: 30,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: CircleAvatar(
                radius: 15.0,
                backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfyypkLr4fD31-1QQ19WgRP7UEtbkP6jCV0A&usqp=CAU'),
              ),
              label: ''),
        ],
      ),
    );
  }
}
