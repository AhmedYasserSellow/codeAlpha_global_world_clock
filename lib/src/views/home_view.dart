import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_zone/src/controller/app_cubit.dart';
import 'package:time_zone/src/data/time_zones.dart';
import 'package:time_zone/src/widgets/selected_time_zones_list.dart';
import 'package:time_zone/src/widgets/time_zones_list.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final AppCubit cubit = context.read<AppCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Global World Clock'),
        actions: [
          IconButton(
            onPressed: () {
              cubit.filteredTimeZones = timeZones;
              showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    return const TimeZonesList();
                  });
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: const SelectedTimeZonesList(),
    );
  }
}
