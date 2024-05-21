import 'package:firebase_remote_config/firebase_remote_config.dart' as config;

class Config {
  config.FirebaseRemoteConfig get remoteConfig =>
      config.FirebaseRemoteConfig.instance;

  Future<void> init() async {
    await remoteConfig.setConfigSettings(
      config.RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: const Duration(hours: 5),
      ),
    );
  }
}
