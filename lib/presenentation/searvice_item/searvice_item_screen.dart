import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../controllers/service_controller.dart';
import 'widget/searvice_item_widget.dart';

class ServiceItemScreen extends ConsumerWidget {
  const ServiceItemScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final servicesAsyncValue = ref.watch(serviceControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Services')),
      body: servicesAsyncValue.when(
        data: (services) {
          log('Services: $services');
          return ListView.builder(
            itemCount: services.length,
            itemBuilder: (context, index) {
              return SearviceItemWidget(service: services[index]);
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) {
          log('Error in ServiceItemScreen: $error\n$stack');
          return Center(child: Text('Error: ${error.toString()}'));
        },
      ),
    );
  }
}
