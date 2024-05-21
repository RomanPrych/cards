import 'dart:typed_data';

import 'package:cards_english/common/di/di.dart';
import 'package:cards_english/data/repo/get_photo_by_name/get_photo_by_name_repo.dart';
import 'package:cards_english/data/repo/storage_firebase/storage_firebase_repo.dart';

class GetPhotoByNameRepoImpl implements GetPhotoByNameRepo {
  PhotosStorage photosStorage = locator.get<PhotosStorage>();

  @override
  Future<Uint8List?> getPhoto(String? name) async {
    if (name == null || name.isEmpty) {
      return null;
    }
    try {
      return await photosStorage.storageReference.child('$name.png').getData();
    } catch (e) {
      print('ERROR GetPhotoByNameRepoImpl = $e');
      return null;
    }
  }
}
