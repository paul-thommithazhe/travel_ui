import 'activity_model.dart';

class Destination {
  String imageUrl;
  String city;
  String country;
  String description;
  List<Activity> activities;

  Destination({
    required this.imageUrl,
    required this.city,
    required this.country,
    required this.description,
    required this.activities,
  });
}

List<Activity> activities = [
  Activity(
      imageUrl: 'assets/images/stmarksbasilica.jpg',
      name: 'St.Mark\'s Basilica',
      type: 'Sightseeing Tour',
      strtingTimes: ['9.00 am ', '  11:00 am'],
      rating: 5,
      price: 30),
  Activity(
      imageUrl: 'assets/images/gondola.jpg',
      name: 'Walking Tour gondola ride',
      type: 'Sightseeing Tour',
      strtingTimes: ['7.00 am ', '  8:00 am'],
      rating: 5,
      price: 210),
  Activity(
      imageUrl: 'assets/images/stmarksbasilica.jpg',
      name: 'St.Mark\'s Basilica',
      type: 'Sightseeing Tour',
      strtingTimes: ['9.00 am ', '  11:00 am'],
      rating: 5,
      price: 30),
  Activity(
      imageUrl: 'assets/images/murano.jpg',
      name: 'St.Mark\'s Basilica',
      type: 'Sightseeing Tour',
      strtingTimes: ['9.00 am ', '  11:00 am'],
      rating: 5,
      price: 125),
  Activity(
      imageUrl: 'assets/images/stmarksbasilica.jpg',
      name: 'St.Mark\'s Basilica',
      type: 'Sightseeing Tour',
      strtingTimes: ['9.00 am ', '  11:00 am'],
      rating: 5,
      price: 30)
];

List<Destination> destinations = [
  Destination(
    imageUrl: 'assets/images/venice.jpg',
    city: 'Venice',
    country: 'italy',
    description: 'Visit Venice for an amazing and unfogettable adventure',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/images/paris.jpg',
    city: 'Paris',
    country: 'USA',
    description: 'Visit Venice for an amazing and unfogettable adventure',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/images/newdelhi.jpg',
    city: 'New Delhi',
    country: 'India',
    description: 'Visit Venice for an amazing and unfogettable adventure',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/images/saopaulo.jpg',
    city: 'Sao Paulo',
    country: 'Brazil',
    description: 'Visit Venice for an amazing and unfogettable adventure',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/images/newyork.jpg',
    city: 'New York City',
    country: 'USA',
    description: 'Visit Venice for an amazing and unfogettable adventure',
    activities: activities,
  ),
];
