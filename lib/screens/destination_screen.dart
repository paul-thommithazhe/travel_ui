import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../model/activity_model.dart';
import '../model/destination_model.dart';

class DestinationScreen extends StatefulWidget {
  Destination destination;

  DestinationScreen({required this.destination});

  @override
  State<DestinationScreen> createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  Text _buildRatingStars(int rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐';
    }
    return Text(stars);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 6.0,
                    ),
                  ]),
              child: Hero(
                tag: widget.destination.imageUrl,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image(
                    image: AssetImage(
                      widget.destination.imageUrl,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back),
                    iconSize: 30.0,
                    color: Colors.black,
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(Icons.search),
                        iconSize: 30.0,
                        color: Colors.black,
                      ),
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(FontAwesomeIcons.arrowDownWideShort),
                        iconSize: 30.0,
                        color: Colors.black,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              left: 20.5,
              bottom: 9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.destination.city,
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
                        widget.destination.country,
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                      SizedBox(
                        width: 150,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              right: 20.0,
              bottom: 20.0,
              child: Icon(
                FontAwesomeIcons.route,
                color: Colors.white70,
              ),
            )
          ],
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
            itemCount: widget.destination.activities.length,
            itemBuilder: (_, int index) {
              Activity activity = widget.destination.activities[index];
              return Stack(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    height: 170,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(115, 20, 20, 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 120.0,
                                child: Text(
                                  activity.name,
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    '\$${activity.price.toString()}',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  Text(
                                    'per pax',
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            activity.type,
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          _buildRatingStars(activity.rating),
                          SizedBox(height: 10.0),
                          Row(
                            children: [
                              Container(
                                width: 70.0,
                                decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    borderRadius: BorderRadius.circular(10)),
                                alignment: Alignment.center,
                                child: Text(activity.strtingTimes[0]),
                              ),
                              SizedBox(width: 10),
                              Container(
                                width: 70.0,
                                decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    borderRadius: BorderRadius.circular(10)),
                                alignment: Alignment.center,
                                child: Text(activity.strtingTimes[1]),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 10.0,
                    top: 15.0,
                    bottom: 15.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image(
                        width: 110,
                        image: AssetImage(activity.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ],
    ));
  }
}
