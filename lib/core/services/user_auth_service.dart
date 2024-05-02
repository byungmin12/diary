import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserAuthService extends ChangeNotifier {
  static final _accessTokenStorageKey = 'key_access_token';
  static final _lastPinNumberVerifiedAtStorageKey = 'key_last_pin_number_verified_at';
  static final _lastMyDataUpdatedAtStorageKey = 'key_last_my_data_updated_at_at';

  final _iOSSecureStorageOptions = const IOSOptions(
    accessibility: IOSAccessibility.first_unlock,
  );

  final _secureStorage = const FlutterSecureStorage();

  String _accessToken = '';
  dynamic? _user;
  DateTime? _lastPinNumberVerifiedAt;
  DateTime? _lastMyDataUpdatedAt;

  String get accessToken => _accessToken;

  dynamic? get userMe => _user;

  init() async {
    await _load();
  }

  bool hasAccessToken() {
    return _accessToken.isNotEmpty;
  }

  bool isAuthenticated() {
    return _accessToken.isNotEmpty && _user != null;
  }

  bool isUserStatusActivated() {
    return _user?.isActiveStatus ?? false;
  }

  bool isPinNumberRegistered() {
    return _user?.isPinNumberRegistered ?? false;
  }

  Future<bool> login() async {
    try {
      await _secureStorage.write(
        key: _accessTokenStorageKey,
        value: 'token.accessToken',
        iOptions: _iOSSecureStorageOptions,
      );

      _accessToken = 'token.accessToken';

      return true;
    } catch (e) {
      return false;
    }
  }

  updatedMyData() async {
    await _secureStorage.write(
      key: _lastMyDataUpdatedAtStorageKey,
      value: DateTime.now().toIso8601String(),
      iOptions: _iOSSecureStorageOptions,
    );
    _lastMyDataUpdatedAt = DateTime.now();
  }

  clearLastPinNumberVerifiedAt() {
    _lastPinNumberVerifiedAt = null;
    notifyListeners();
  }

  Future<void> logout() async {
    await _secureStorage.delete(
      key: _accessTokenStorageKey,
      iOptions: _iOSSecureStorageOptions,
    );

    await _secureStorage.delete(
      key: _lastPinNumberVerifiedAtStorageKey,
      iOptions: _iOSSecureStorageOptions,
    );

    await _secureStorage.delete(
      key: _lastMyDataUpdatedAtStorageKey,
      iOptions: _iOSSecureStorageOptions,
    );

    _accessToken = '';
    _user = null;
    _lastPinNumberVerifiedAt = null;
    _lastMyDataUpdatedAt = null;
    notifyListeners();
  }

  _load() async {
    try {
      _accessToken = (await _secureStorage.read(
            key: _accessTokenStorageKey,
            iOptions: _iOSSecureStorageOptions,
          )) ??
          '';

      final lastMyDataUpdatedAt = await _secureStorage.read(
        key: _lastMyDataUpdatedAtStorageKey,
        iOptions: _iOSSecureStorageOptions,
      );
      if (lastMyDataUpdatedAt != null && lastMyDataUpdatedAt.isNotEmpty) {
        _lastMyDataUpdatedAt = DateTime.parse(lastMyDataUpdatedAt);
      }
    } catch (e) {}
  }
}
