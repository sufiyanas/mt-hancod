import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mt_hancod/models/service_detail_model.dart';
import 'package:mt_hancod/models/service_models.dart';
import 'package:mt_hancod/models/service_subset_model.dart';
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
      final response = await _supabaseClient.from('service');
      log('response: $response');
      final List<dynamic> data = response as List<dynamic>;
      return data.map((json) => ServiceModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch services: $e');
    }
  }

  Future<List<ServiceSubsetModel>> getServiceSubsets(String serviceId) async {
    log('getServiceSubsets Function Called with serviceId: $serviceId');
    try {
      final response = await _supabaseClient
          .from('service_subsets')
          .select()
          .eq('service_id', serviceId);
      log('response: $response');

      final List<dynamic> data = response as List<dynamic>;
      return data.map((json) => ServiceSubsetModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch service subsets: $e');
    }
  }

  Future<List<ServiceDetailModel>> getServiceDetails(String subsetId) async {
    log('getServiceDetails Function Called with subsetId: $subsetId');
    try {
      final response = await _supabaseClient
          .from('service_details')
          .select()
          .eq('subset_id', subsetId);

      final List<dynamic> data = response as List<dynamic>;
      return data.map((json) => ServiceDetailModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch service details: $e');
    }
  }

  // Future<void> addServiceToCart(String serviceId) async {
  //   log('addServiceToCart: $serviceId');
  //   try {
  //     // Assuming you have a 'cart' table in your Supabase database
  //     await _supabaseClient.from('cart').insert({
  //       'user_id': _supabaseClient.auth.currentUser!.id,
  //       'service_id': serviceId,
  //       'created_at': DateTime.now().toIso8601String(),
  //     });
  //   } catch (e) {
  //     log('Failed to add service to cart: $e');
  //     throw Exception('Failed to add service to cart: $e');
  //   }
  // }
}
