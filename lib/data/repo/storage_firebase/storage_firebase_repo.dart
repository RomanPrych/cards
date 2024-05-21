import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class StorageFirebaseRepo {
  late firebase_storage.Reference _ref;

  firebase_storage.Reference get storageReference => _ref;
}

class PhotosStorage extends StorageFirebaseRepo {
  PhotosStorage() {
    _ref = firebase_storage.FirebaseStorage.instance.ref().child('PHOTOS_CARDS');
  }
}
