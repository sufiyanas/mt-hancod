import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/service_model.dart';
import '../services/service_api.dart';

final serviceControllerProvider =
    StateNotifierProvider<ServiceController, AsyncValue<List<ServiceModel>>>(
        (ref) {
  final serviceApi = ref.watch(serviceApiProvider);
  return ServiceController(serviceApi);
});

class ServiceController extends StateNotifier<AsyncValue<List<ServiceModel>>> {
  final ServiceApi _serviceApi;

  ServiceController(this._serviceApi) : super(const AsyncValue.loading()) {
    getServices();
  }

  Future<void> getServices() async {
    state = const AsyncValue.loading();
    try {
      final services = await _serviceApi.getServices();
      state = AsyncValue.data(services);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}
