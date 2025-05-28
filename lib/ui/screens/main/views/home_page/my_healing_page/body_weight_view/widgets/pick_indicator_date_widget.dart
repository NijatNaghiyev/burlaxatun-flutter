import 'dart:developer';

import 'package:burla_xatun/utils/extensions/num_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PickIndicatorDateWidget extends StatelessWidget {
  const PickIndicatorDateWidget({
    super.key,
    this.isTimeSelecting = false,
    this.dateValue,
    this.timeValue,
  });

  final bool isTimeSelecting;
  final ValueNotifier<DateTime>? dateValue;
  final ValueNotifier<DateTime>? timeValue;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Column(
        children: [
          10.h,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {
                  context.pop();
                },
                child: Text('Bağla'),
              ),
              Text(
                isTimeSelecting ? 'Vaxt secin' : 'Tarix secin',
              ),
              TextButton(
                onPressed: () {
                  context.pop();
                },
                child: Text('Seç'),
              ),
            ],
          ),
          10.h,
          SizedBox(
            height: 230,
            child: CupertinoDatePicker(
              initialDateTime:
                  isTimeSelecting ? timeValue!.value : dateValue!.value,
              use24hFormat: isTimeSelecting,
              mode: isTimeSelecting
                  ? CupertinoDatePickerMode.time
                  : CupertinoDatePickerMode.date,
              onDateTimeChanged: (onDateTimeChanged) {
                isTimeSelecting
                    ? timeValue!.value = onDateTimeChanged
                    : dateValue!.value = onDateTimeChanged;
              },
            ),
          ),
        ],
      ),
    );
  }
}
