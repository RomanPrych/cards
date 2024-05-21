import 'package:flutter/services.dart';

abstract interface class GetPhotoByNameRepo {
  Future <Uint8List?> getPhoto(String? name);
}