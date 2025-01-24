import 'package:burla_xatun/ui/widgets/global_text.dart';
import 'package:burla_xatun/utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

class ArticleDetail extends StatelessWidget {
  const ArticleDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.68,
      width: MediaQuery.of(context).size.width,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                26.h,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.84,
                  child: GlobalText(
                    height: 1.2,
                    textAlign: TextAlign.left,
                    text: 'Postnatal sağlamlıq',
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff1D2939),
                  ),
                ),
                29.h,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.84,
                  child: GlobalText(
                    height: 1.4,
                    textAlign: TextAlign.left,
                    text:
                        'Doğuşdan sonra bədənin və zehnin bərpası hər bir qadın üçün fərqli olur və bu dövrdə özünüzə diqqət göstərmək çox vacibdir. Hamiləlikdən sonra düzgün qidalanma, vitamin və minerallarla zəngin qidaların qəbul edilməsi, yüngül fiziki fəaliyyətlər və istirahət bədənin təbii bərpasını dəstəkləyir. Körpənin yuxu rejimi ilə uyğunlaşaraq özünüzə kifayət qədər istirahət etməyə çalışın. Hormonların təsiri ilə emosional dəyişikliklər normaldır, lakin uzunmüddətli narahatlıq və ya depressiya əlamətləri varsa, mütəxəssis yardımı alın. Ətrafınızdakı insanlardan dəstək istəməkdən çəkinməyin və özünüzə vaxt ayırmaq üçün kiçik anlar yaradın. Sağlam və xoşbəxt bir ana olmaq üçün bədəninizin ehtiyaclarına qulaq asmaq və zəruri hallarda həkimə müraciət etmək, həm sizin, həm də körpənizin rifahını təmin edəcək.',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff667085),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
