import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_zone/src/controller/app_cubit.dart';

class TimeZonesList extends StatelessWidget {
  const TimeZonesList({super.key});

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = context.read<AppCubit>();
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height / 3 * 1.7,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Select Time Zone'),
                  const SizedBox(
                    height: 16,
                  ),
                  TextField(
                    onChanged: (searchQuery) {
                      cubit.filterList(searchQuery: searchQuery);
                    },
                    decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Expanded(
                    child: Scrollbar(
                      interactive: true,
                      trackVisibility: true,
                      thumbVisibility: true,
                      thickness: 5,
                      radius: const Radius.circular(8),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                cubit.addTimeZone(
                                    context: context, index: index);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    cubit.filteredTimeZones[index],
                                    style: const TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const Divider(
                              height: 16,
                            );
                          },
                          itemCount: cubit.filteredTimeZones.length,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
