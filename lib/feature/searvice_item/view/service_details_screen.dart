import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mt_hancod/core/consts/color_const.dart';
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
      debugPrint('Error loading subsets: $e');
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
      debugPrint('Error loading service details: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: SvgPicture.asset(
            "assets/svgs/Back-Navs.svg",
            width: 24.w,
            height: 24.h,
          ),
        ),
        title: Text(
          'Service Details',
          style: TextStyle(
            fontSize: 16.sp,
          ),
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          if (_subsets.isNotEmpty)
            Container(
              decoration: const BoxDecoration(
                color: ColorConst.klightGreen,
              ),
              child: TabBar(
                labelStyle: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
                unselectedLabelStyle: TextStyle(
                  color: ColorConst.kBlack,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
                isScrollable: true,
                controller: _tabController,
                indicator: BoxDecoration(
                  gradient: ColorConst.kPrimaryGradient,
                  color: ColorConst.klightGreen,
                  borderRadius: BorderRadius.circular(10),
                ),
                labelColor: Colors.white,
                unselectedLabelColor: ColorConst.kBlack,
                indicatorPadding: EdgeInsets.all(5),
                indicatorSize: TabBarIndicatorSize.tab,
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
          Expanded(
            child: _subsets.isEmpty
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
          ),
        ],
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
