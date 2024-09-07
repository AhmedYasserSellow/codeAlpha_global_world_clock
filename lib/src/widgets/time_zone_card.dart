import 'package:flutter/material.dart';
import 'package:time_zone/src/models/time_zone_card_model.dart';
import 'package:time_zone/src/widgets/loading_indicator.dart';

class TimeZoneCard extends StatelessWidget {
  const TimeZoneCard({
    super.key,
    required this.stream,
    required this.deleteFunc,
  });

  final Stream<TimeZoneCardModel> stream;
  final void Function(BuildContext)? deleteFunc;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          TimeZoneCardModel timeZoneCardModel = snapshot.data!;
          Color textColor;
          String image;
          if (timeZoneCardModel.hour >= 6 && timeZoneCardModel.hour < 18) {
            textColor = Colors.black;
            image = 'assets/day.jpg';
          } else {
            textColor = Colors.white;
            image = 'assets/night.jpg';
          }
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    image,
                  ),
                )),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      timeZoneCardModel.timeZone,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${timeZoneCardModel.dayName}  ${timeZoneCardModel.date}',
                      style: TextStyle(
                        color: textColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  timeZoneCardModel.time,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        } else {
          return const AppLoadingIndicator();
        }
      },
    );
  }
}
