
import 'package:tinderjob/constants/repository_constants/local_storage_constants/settings/app_settings_keys.dart';
import 'package:tinderjob/repository/local_storage/base/local_storage_core.dart';

class PreferenceLocalStorage {
  LocalStorageCore localStorageCore = LocalStorageCore();

  Future<bool> isSetLanguagePreferences() async {
    return await localStorageCore.exist(AppSettingsKeys.languagePreferencesKey);
  }

  Future<String> getLanguagePreferences() async {
    return await localStorageCore.read(AppSettingsKeys.languagePreferencesKey);
  }

  Future<void> setLanguagePreferences(String code) async {
    await localStorageCore.save(AppSettingsKeys.languagePreferencesKey, code);
  }
}
