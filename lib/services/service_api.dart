import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mt_hancod/models/service_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceApiProvider = Provider<ServiceApi>((ref) {
  final supabaseClient = Supabase.instance.client;
  return ServiceApi(supabaseClient);
});

class ServiceApi {
  final SupabaseClient _supabaseClient;

  ServiceApi(this._supabaseClient);

  Future<List<ServiceModel>> getServices() async {
    log('getServices');
    try {
      final response = await _supabaseClient.from('services').select();
      log('response: $response');
      final List<dynamic> data = response as List<dynamic>;
      return data.map((json) => ServiceModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch services: $e');
    }
  }
}
