import 'dart:developer';

import 'package:mt_hancod/feature/searvice_item/data/model/service_detail_model.dart';
import 'package:mt_hancod/feature/searvice_item/data/model/service_models.dart';
import 'package:mt_hancod/feature/searvice_item/data/model/service_subset_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class ServiceRemoteDataSource {
  Future<List<ServiceModel>> getServices();
  Future<List<ServiceSubsetModel>> getSubset(String id);
  Future<List<ServiceDetailModel>> getSearviceDetail(String id);
}

class ServiceRemoteDataSourceImpl implements ServiceRemoteDataSource {
  final supabase = Supabase.instance.client;
  @override
  Future<List<ServiceModel>> getServices() async {
    log('getServices Class called ');
    try {
      final response = await supabase.from('service').select();
      log(response.toString());
      return response.map((e) => ServiceModel.fromJson(e)).toList();
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
  }

  @override
  Future<List<ServiceSubsetModel>> getSubset(String id) async {
    log('getSubset Class called ');
    try {
      final response =
          await supabase.from('service_subsets').select().eq('service_id', id);
      log(response.toString());
      return response.map((e) => ServiceSubsetModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<ServiceDetailModel>> getSearviceDetail(String id) async {
    try {
      final response = await supabase
          .from('service_details')
          .select('*')
          .eq('subset_id', id);
      return response.map((e) => ServiceDetailModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}
