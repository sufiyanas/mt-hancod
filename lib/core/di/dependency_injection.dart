import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../data/datasources/service_remote_datasource.dart';
import '../../data/repositories/service_repository_impl.dart';
import '../../domain/repositories/service_repository.dart';
import '../../domain/usecases/get_services.dart';

final supabaseClientProvider = Provider<SupabaseClient>((ref) {
  return Supabase.instance.client;
});

final serviceRemoteDataSourceProvider =
    Provider<ServiceRemoteDataSource>((ref) {
  final supabaseClient = ref.watch(supabaseClientProvider);
  return ServiceRemoteDataSource(supabaseClient);
});

final serviceRepositoryProvider = Provider<ServiceRepository>((ref) {
  final remoteDataSource = ref.watch(serviceRemoteDataSourceProvider);
  return ServiceRepositoryImpl(remoteDataSource);
});

final getServicesProvider = Provider<GetServices>((ref) {
  final repository = ref.watch(serviceRepositoryProvider);
  return GetServices(repository);
});
