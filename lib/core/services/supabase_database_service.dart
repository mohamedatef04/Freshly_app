import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseDatabaseService {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<void> storeUserData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    await supabase.from(path).insert(data);
  }
}
