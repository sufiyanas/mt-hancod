import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:developer';

class ServiceRemoteDataSource {
  final SupabaseClient _supabaseClient;

  ServiceRemoteDataSource(this._supabaseClient);

  Future<List<Map<String, dynamic>>> getServices() async {
    try {
      final response = await _supabaseClient.from('services');

      log('Supabase response: ${response.data}');

      if (response.error != null) {
        throw Exception(response.error!.message);
      }

      return (response.data as List).cast<Map<String, dynamic>>();
    } catch (e) {
      log('Error in getServices: $e');
      rethrow;
    }
  }
}
