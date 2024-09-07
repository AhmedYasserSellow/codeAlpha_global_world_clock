import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_zone/src/api/api_service.dart';
import 'package:time_zone/src/controller/app_cubit.dart';
import 'package:time_zone/src/widgets/time_zone_card.dart';

class SelectedTimeZonesList extends StatelessWidget {
  const SelectedTimeZonesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AppCubit cubit = context.read<AppCubit>();
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView.separated(
            itemCount: cubit.selectedTimeZones.length,
            itemBuilder: (context, index) {
              return TimeZoneCard(
                  deleteFunc: (context) {},
                  stream: index == 0
                      ? Stream.periodic(const Duration(seconds: 1))
                          .asyncMap((_) {
                          return ApiService().getTimebyIP();
                        })
                      : Stream.periodic(const Duration(seconds: 1))
                          .asyncMap((_) {
                          return ApiService()
                              .getTime(cubit.selectedTimeZones[index]);
                        }));
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 16,
              );
            },
          ),
        );
      },
    );
  }
}
