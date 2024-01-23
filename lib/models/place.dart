import 'dart:io';

import 'package:uuid/uuid.dart';

class PlaceLocation {
  final double latitude;
  final double longitude;
  final String address;
  const PlaceLocation({
    required this.latitude,
    required this.longitude,
    required this.address,
  });
}

class Place {
  final String id;
  final String title;
  final File image;
  final PlaceLocation location;
  Place({
    required this.title,
    required this.image,
    required this.location,
    String? id,
  }) : id = id ?? const Uuid().v4();
}
