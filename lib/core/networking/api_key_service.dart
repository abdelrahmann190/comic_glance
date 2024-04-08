import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comic_glance/core/networking/app_auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiKeyService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final _storage = const FlutterSecureStorage();
  Future<void> storeApiKey() async {
    User? user = AppAuthServices().currentUser;
    try {
      if (user != null) {
        DocumentSnapshot apiKeyDoc =
            await _db.collection('secure_value').doc('apiKey').get();
        String? apiKey = apiKeyDoc['apiKey'];
        if (apiKey != null) {
          await _storage.write(key: 'api_key', value: apiKey);
        }
      } else {
        await _storage.write(key: 'api_key', value: '');
      }
    } catch (e) {
      throw Exception([e]);
    }
  }

  Future<String?> getApiKey() async {
    return await _storage.read(key: 'api_key');
  }
}
