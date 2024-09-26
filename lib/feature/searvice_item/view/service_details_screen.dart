import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mt_hancod/feature/searvice_item/data/model/service_detail_model.dart';
import 'package:mt_hancod/feature/searvice_item/data/model/service_subset_model.dart';
import 'package:mt_hancod/feature/searvice_item/view/providers/service_provider.dart';
import '../components/searvice_item_widget.dart';

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
  List<ServiceSubsetModel> _subsets = [];
  List<ServiceDetailModel> _details = [];
  int _selectedSubsetIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadSubsets();
  }

  Future<void> _loadSubsets() async {
    final serviceNotifier = ref.read(serviceNotifierProvider.notifier);
    try {
      final subsets = await serviceNotifier.getSubsets(widget.serviceId);
      setState(() {
        _subsets = subsets;
        _tabController = TabController(
          length: subsets.length,
          vsync: this,
          initialIndex: _selectedSubsetIndex,
        );
      });
      if (subsets.isNotEmpty) {
        _loadServiceDetails(subsets[0].id.toString());
      }
    } catch (e) {
      print('Error loading subsets: $e');
    }
  }

  Future<void> _loadServiceDetails(String subsetId) async {
    final serviceNotifier = ref.read(serviceNotifierProvider.notifier);
    try {
      final details = await serviceNotifier.getServiceDetails(subsetId);
      setState(() {
        _details = details;
      });
    } catch (e) {
      // Handle error
      print('Error loading service details: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Service Details'),
        bottom: _subsets.isEmpty
            ? null
            : TabBar(
                isScrollable: true,
                controller: _tabController,
                tabs: _subsets
                    .map((subset) => Tab(text: subset.subsetTitle))
                    .toList(),
                onTap: (index) {
                  setState(() {
                    _selectedSubsetIndex = index;
                  });
                  _loadServiceDetails(_subsets[index].id.toString());
                },
              ),
      ),
      body: _subsets.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : TabBarView(
              controller: _tabController,
              children: _subsets.map((subset) {
                if (_subsets.indexOf(subset) == _selectedSubsetIndex) {
                  return _buildSubsetDetails();
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }).toList(),
            ),
    );
  }

  Widget _buildSubsetDetails() {
    return _details.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: _details.length,
            itemBuilder: (context, index) {
              final detail = _details[index];
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
