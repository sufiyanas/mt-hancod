import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/di/dependency_injection.dart';
import '../../domain/entities/service.dart';
import 'widget/searvice_item_widget.dart';

final serviceProvider = FutureProvider<List<Service>>((ref) async {
  final getServices = ref.read(getServicesProvider);
  final result = await getServices();
  return result.fold(
    (failure) => throw Exception(failure.toString()),
    (services) => services,
  );
});

class ServiceItemScreen extends ConsumerWidget {
  const ServiceItemScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final servicesAsyncValue = ref.watch(serviceProvider);

    return Scaffold(
      // appBar: const PreferredSize(
      //   preferredSize: Size.fromHeight(kToolbarHeight),
      //   child: CommonAppBar(title: 'Cleaning Services'),
      // ),
      body: servicesAsyncValue.when(
        data: (services) {
          log(services.toString());
          return ListView.builder(
            itemCount: services.length,
            itemBuilder: (context, index) {
              return SearviceItemWidget(service: services[index]);
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Errorrrr: $error')),
      ),
    );
  }
}
