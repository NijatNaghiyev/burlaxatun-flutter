import 'package:flutter/material.dart';

import '../../../../../../widgets/global_text.dart';

class AdviseText extends StatelessWidget {
  const AdviseText({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalText(
      textAlign: TextAlign.left,
      text:
          'Doğuşdan sonra bədənin və zehnin bərpası hər bir qadın üçün fərqli olur və bu dövrdə özünüzə diqqət göstərmək çox vacibdir. Hamiləlikdən sonra düzgün qidalanma, vitamin və minerallarla zəngin qidaların qəbul edilməsi, yüngül fiziki fəaliyyətlər və istirahət bədənin təbii bərpasını dəstəkləyir. Körpənin yuxu rejimi ilə uyğunlaşaraq özünüzə kifayət qədər istirahət etməyə çalışın. Hormonların təsiri ilə emosional dəyişikliklər normaldır, lakin uzunmüddətli narahatlıq və ya depressiya əlamətləri varsa, mütəxəssis yardımı alın. ',
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Color(0xff667085),
    );
  }
}
