import 'package:burla_xatun/ui/widgets/global_text.dart';
import 'package:burla_xatun/utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BabyText extends StatelessWidget {
  const BabyText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 350,
          child: GlobalText(
            height: 1.5,
            textAlign: TextAlign.left,
            text: 'Hamiləliyin 6 həftəsində nə baş verir?',
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        28.h,
        SvgPicture.asset('assets/svgs/baby_size.svg'),
        28.h,
        SizedBox(
          width: 350,
          child: GlobalText(
            height: 1.5,
            textAlign: TextAlign.left,
            text: 'İndi körpə alma ölçüsündədir',
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xff656565),
          ),
        ),
        5.h,
        SizedBox(
          width: 350,
          child: GlobalText(
            height: 1.2,
            textAlign: TextAlign.left,
            text:
                'Ölçü və Forma: Embrion təxminən 4-6 mm ölçüdədir, kiçik "C" hərfinə bənzəyir. Ürək: strukturu hələ də primitiv olsa da, döyünməyə və qan vurmağa başlayır.Orqanlar: Beyin, qaraciyər, ağciyərlər və bağırsaqlar da daxil olmaqla mühüm orqanların əsasları formalaşır.',
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Color(0xff656565),
          ),
        ),
        10.h,
        SizedBox(
          width: 350,
          child: GlobalText(
            height: 1.2,
            textAlign: TextAlign.left,
            text:
                'Əzalar: Qolların və ayaqların əsas hissələri kiçik "qönçələr" şəklində görünür',
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Color(0xff656565),
          ),
        ),
        10.h,
        SizedBox(
          width: 350,
          child: GlobalText(
            height: 1.2,
            textAlign: TextAlign.left,
            text:
                'Baş və Üz: Gözlər, burun çuxurları və ağız da daxil olmaqla üz formalaşmağa başlayır. Baş və Üz: Gözlər, burun çuxurları və ağız da daxil olmaqla üz formalaşmağa başlayır.',
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Color(0xff656565),
          ),
        ),
      ],
    );
  }
}
