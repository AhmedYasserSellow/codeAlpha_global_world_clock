import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_zone/src/data/time_zones.dart';
part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  List<String> selectedTimeZones = ['Your Zone'];
  List<String> filteredTimeZones = timeZones;

  void addTimeZone({required BuildContext context, required int index}) {
    Navigator.pop(context);
    selectedTimeZones.add(filteredTimeZones[index]);
    emit(AppAddTimeZone());
  }

  void filterList({required String searchQuery}) {
    filteredTimeZones = timeZones;
    filteredTimeZones = filteredTimeZones.where(
      (String zone) {
        return zone.toLowerCase().contains(
              searchQuery.toLowerCase(),
            );
      },
    ).toList();

    emit(AppSearch());
  }
}
