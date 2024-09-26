import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mt_hancod/models/service_detail_model.dart';
import '../../controllers/service_controller.dart';
import 'widget/searvice_item_widget.dart';

class ServiceDetailsScreen extends ConsumerStatefulWidget {
  final String serviceId;

  const ServiceDetailsScreen({super.key, required this.serviceId});

  @override
  ConsumerState<ServiceDetailsScreen> createState() =>
      _ServiceDetailsScreenState();
}

class _ServiceDetailsScreenState extends ConsumerState<ServiceDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(serviceControllerProvider.notifier)
          .getServiceSubsets(widget.serviceId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final serviceState = ref.watch(serviceControllerProvider);

    return serviceState.when(
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (error, stack) => Scaffold(
        body: Center(child: Text('Error: $error')),
      ),
      data: (state) {
        if (state.subsets.isEmpty) {
          return const Scaffold(
            body: Center(child: Text('No subsets available')),
          );
        }

        _tabController = TabController(
          length: state.subsets.length,
          vsync: this,
          initialIndex: state.selectedSubsetIndex,
        );

        return Scaffold(
          appBar: AppBar(
            title: const Text('Service Details'),
            bottom: TabBar(
              isScrollable: true,
              controller: _tabController,
              tabs: state.subsets
                  .map((subset) => Tab(text: subset.subsetTitle))
                  .toList(),
              onTap: (index) {
                ref
                    .read(serviceControllerProvider.notifier)
                    .selectSubset(index);
              },
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: state.subsets.map((subset) {
              if (state.subsets.indexOf(subset) == state.selectedSubsetIndex) {
                return _buildSubsetDetails(state.details);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }).toList(),
          ),
        );
      },
    );
  }

  Widget _buildSubsetDetails(List<ServiceDetailModel> details) {
    return ListView.builder(
      itemCount: details.length,
      itemBuilder: (context, index) {
        final detail = details[index];
        return SearviceItemWidget(service: detail);
      },
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
