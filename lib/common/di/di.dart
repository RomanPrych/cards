import 'package:cards_english/data/repo/config/remote_config.dart';
import 'package:cards_english/data/repo/get_cards_data/get_cards_data_repo.dart';
import 'package:cards_english/data/repo/get_cards_data/get_cards_data_repo_impl.dart';
import 'package:cards_english/data/repo/get_photo_by_name/get_photo_by_name_repo.dart';
import 'package:cards_english/data/repo/get_photo_by_name/get_photo_by_name_repo_impl.dart';
import 'package:cards_english/data/repo/storage_firebase/storage_firebase_repo.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future setupLocator() async {
  //final prefs = await SharedPreferences.getInstance();

  locator.registerLazySingleton<PhotosStorage>(() => PhotosStorage());
  locator.registerLazySingleton<Config>(() => Config()..init());
  locator.registerLazySingleton<GetPhotoByNameRepo>(() => GetPhotoByNameRepoImpl());
  locator.registerLazySingleton<GetCardsDataRepo>(() => GetCardsDataRepoImpl());


}
