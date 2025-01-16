import 'package:burla_xatun/ui/widgets/global_text.dart';
import 'package:flutter/material.dart';

class CategoryBox extends StatelessWidget {
  const CategoryBox({
    super.key,
    required this.doctorCategory,
  });

  final String doctorCategory;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Color(0xffE8E8E8),
          borderRadius: BorderRadius.all(Radius.circular(100)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: GlobalText(
              text: doctorCategory,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xff98A2B3),
            ),
          ),
        ),
      ),
    );
  }
}
