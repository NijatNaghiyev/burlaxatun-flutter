import 'package:burla_xatun/ui/widgets/global_text.dart';
import 'package:flutter/material.dart';

class DateOrPriceBox extends StatelessWidget {
  const DateOrPriceBox({
    super.key,
    required this.boxName,
    required this.boxInfo,
  });

  final String boxName;
  final String boxInfo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Color(0xffE4E7EC),
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GlobalText(
                text: boxName,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              GlobalText(
                text: boxInfo,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xff667085),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
