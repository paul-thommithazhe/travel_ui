import 'package:flutter/material.dart';

import '../model/destination_model.dart';
import '../model/hotel_model.dart';

class HotelCarousel extends StatelessWidget {
  const HotelCarousel({Key? key}) : super(key: key);

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
                'Exclusive Hotels',
                style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.2),
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
              ),
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
            itemCount: hotels.length,
            itemBuilder: (BuildContext context, int index) {
              Hotel hotel = hotels[index];
              return Container(
                margin: EdgeInsets.all(10.0),
                width: 240.0,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Positioned(
                      bottom: 15.0,
                      height: 120.0,
                      width: 240.0,
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
                            
                            children: [
                              Text(
                                hotel.name,
                                style: TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.4),
                              ),
                              Text(
                                hotel.address,
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(height: 2.0),
                              Text(
                                '\$${hotel.price} /night',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
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
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image(
                          height: 180.0,
                          width: 220.0,
                          image: AssetImage(hotel.imageUrl),
                          fit: BoxFit.cover,
                        ),
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
