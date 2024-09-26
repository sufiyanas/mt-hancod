import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mt_hancod/core/utils/debounce.dart';
import 'package:mt_hancod/models/service_detail_model.dart';
import 'package:mt_hancod/models/service_models.dart';
import 'package:mt_hancod/models/service_subset_model.dart';
import '../services/service_api.dart';

final serviceControllerProvider =
    StateNotifierProvider<ServiceController, AsyncValue<ServiceState>>((ref) {
  final serviceApi = ref.watch(serviceApiProvider);
  return ServiceController(serviceApi);
});

class ServiceState {
  final List<ServiceModel> services;
  final List<ServiceSubsetModel> subsets;
  final List<ServiceDetailModel> details;
  final int selectedSubsetIndex;

  ServiceState({
    this.services = const [],
    this.subsets = const [],
    this.details = const [],
    this.selectedSubsetIndex = 0,
  });

  ServiceState copyWith({
    List<ServiceModel>? services,
    List<ServiceSubsetModel>? subsets,
    List<ServiceDetailModel>? details,
    int? selectedSubsetIndex,
  }) {
    return ServiceState(
        services: services ?? this.services,
        subsets: subsets ?? this.subsets,
        details: details ?? this.details,
        selectedSubsetIndex: selectedSubsetIndex ?? this.selectedSubsetIndex);
  }
}

class ServiceController extends StateNotifier<AsyncValue<ServiceState>> {
  final ServiceApi _serviceApi;

  ServiceController(this._serviceApi) : super(const AsyncValue.loading()) {
    getServices();
  }

  final Debounce _debounce = Debounce(const Duration(milliseconds: 500));

  Future<void> getServices() async {
    state = const AsyncValue.loading();
    try {
      final services = await _serviceApi.getServices();
      state = AsyncValue.data(ServiceState(services: services));
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  Future<void> getServiceSubsets(String serviceId) async {
    state = const AsyncValue.loading();
    try {
      final subsets = await _serviceApi.getServiceSubsets(serviceId);
      log('subsets: $subsets');
      if (subsets.isNotEmpty) {
        final details =
            await _serviceApi.getServiceDetails(subsets[0].id.toString());
        state = AsyncValue.data(ServiceState(
          subsets: subsets,
          details: details,
          selectedSubsetIndex: 0,
        ));
      } else {
        state = AsyncValue.data(ServiceState(subsets: subsets));
      }
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  Future<void> getServiceDetails(String subsetId) async {
    try {
      final details = await _serviceApi.getServiceDetails(subsetId);
      log('details: $details');
      final currentState = state.value ?? ServiceState();
      state = AsyncValue.data(currentState.copyWith(details: details));
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  void selectSubset(int index) {
    if (state.value != null && index < state.value!.subsets.length) {
      final currentState = state.value!;
      state = const AsyncValue.loading();
      getServiceDetails(currentState.subsets[index].id.toString()).then((_) {
        state = AsyncValue.data(state.value!.copyWith(
          selectedSubsetIndex: index,
        ));
      });
    }
  }

  @override
  void dispose() {
    _debounce.cancel();
    super.dispose();
  }
}
