import 'package:besta/feature/home/presentation/views/widgets/this_week_card_data.dart';
import 'package:flutter/material.dart';


class ThisWeekListView extends StatelessWidget {
  const ThisWeekListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 250,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const ThisWeekCardData();
        },
      ),
    );
  }
}

