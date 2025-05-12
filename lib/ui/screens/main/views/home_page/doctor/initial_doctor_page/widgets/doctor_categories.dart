// import 'package:flutter/material.dart';
//
// import '../../../../../../../../data/models/remote/response/doctors_list_model.dart';
// import 'category_box.dart';
//
// class DoctorCategories extends StatelessWidget {
//   final List<Profession> professions;
//
//   const DoctorCategories({super.key, required this.professions});
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 40,
//       child: ListView.separated(
//         scrollDirection: Axis.horizontal,
//         itemCount: professions.length,
//         itemBuilder: (_, i) {
//           return Row(
//             children: [
//               i == 0 ? SizedBox(width: 15) : SizedBox.shrink(),
//               CategoryBox(doctorCategory: professions[i].name ?? 'Unknown'),
//             ],
//           );
//         },
//         separatorBuilder: (BuildContext context, int index) {
//           return SizedBox(width: 10);
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

import '../../../../../../../../data/models/remote/response/doctors_list_model.dart';
import 'category_box.dart';

class DoctorCategories extends StatelessWidget {
  final List<Position> positions;
  final Position? selected;
  final Function(Position) onSelect;

  const DoctorCategories({
    super.key,
    required this.positions,
    required this.selected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: positions.length,
        itemBuilder: (_, i) {
          final position = positions[i];
          final isSelected = selected?.id == position.id;

          return Row(
            children: [
              if (i == 0) const SizedBox(width: 15),
              GestureDetector(
                onTap: () => onSelect(position),
                child: CategoryBox(
                  doctorCategory: position.name ?? 'Unknown',
                  isSelected: isSelected,
                ),
              ),
            ],
          );
        },
        separatorBuilder: (_, __) => const SizedBox(width: 10),
      ),
    );
  }
}
