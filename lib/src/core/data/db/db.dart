import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static SharedPreferences? _preferences;

  static const _keyUnits = 'units';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUnits(String units) async =>
      await _preferences?.setString(_keyUnits, units);

  static String getUnits() =>
      _preferences?.getString(_keyUnits) ?? 'Celsius';
}
