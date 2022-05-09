import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'model/destination_model.dart';
import 'screens/destination_screen.dart';

class DestionationCarousel extends StatelessWidget {
  const DestionationCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Top Destinations',
                style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5),
              ),
              GestureDetector(
                onTap: () {
                  print('see all');
                },
                child: Text('See All',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.6)),
              )
            ],
          ),
        ),
        Container(
          height: 300,
          child: ListView.builder(
            physics: BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            scrollDirection: Axis.horizontal,
            itemCount: destinations.length,
            itemBuilder: (BuildContext context, int index) {
              Destination destination = destinations[index];
              return Container(
                margin: EdgeInsets.all(10.0),
                width: 210.0,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Positioned(
                      bottom: 15.0,
                      height: 120.0,
                      width: 200.0,
                      child: Container(
                        height: 120.0,
                        width: 200.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${destination.activities.length.toString()} activities',
                                style: TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.4),
                              ),
                              Text(
                                destination.description,
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DestinationScreen(
                              destination: destination,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black,
                                offset: Offset(
                                  0.0,
                                  2.0,
                                ),
                                blurRadius: 6.0)
                          ],
                        ),
                        child: Stack(children: [
                          Hero(
                            tag: destination.imageUrl,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image(
                                height: 180.0,
                                width: 180.0,
                                image: AssetImage(destination.imageUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 10.0,
                            bottom: 10.0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  destination.city,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.0,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.locationArrow,
                                      size: 10.0,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 5.5),
                                    Text(
                                      destination.country,
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ]),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
