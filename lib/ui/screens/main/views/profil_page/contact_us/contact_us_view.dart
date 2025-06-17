import 'package:burla_xatun/cubits/contact/contact_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../utils/constants/color_constants.dart';
import '../../../../../../utils/helper/url_launcher_helper.dart';
import '../../../../../widgets/custom_circular_progress_indicator.dart';
import '../../../../../widgets/global_appbar.dart';
import 'widgets/contact_us_box.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstants.scaffoldColor,
        appBar: GlobalAppbar(
          title: 'Bizimle elaqe saxla',
          onLeadingTap: () {
            context.pop();
          },
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(15, 24, 15, 0),
          child: BlocBuilder<ContactCubit, ContactState>(
            builder: (_, state) {
              if (state.status == ContactStatus.loading) {
                return Center(
                  child: CustomCircularProgressIndicator(
                    isWhite: false,
                  ),
                );
              }

              if (state.status == ContactStatus.failure) {
                return Center(
                  child: Text('Error'),
                );
              }

              if (state.status == ContactStatus.networkError) {
                return Center(
                  child: Text('Network error'),
                );
              }
              if (state.status == ContactStatus.success) {
                final data = state.response?.results ?? [];
                final result = data.isNotEmpty ? data[0] : null;
                return Column(
                  children: [
                    ContactUsBox(
                      contactTitle: result?.callTop ?? '',
                      contactDescription: result?.callBottom ?? '',
                      icon: result?.callIcon,
                      onTap: () =>
                          UrlLauncherHelper.launchPhoneCall('+994552516420'),
                      // icon: 'assets/icons/contact_us_call_icon.svg',
                      // iconColor: Color(0xffEC407A),
                    ),
                    SizedBox(height: 24),
                    ContactUsBox(
                      contactTitle: result?.whatsappTop ?? '',
                      contactDescription: result?.whatsappBottom ?? '',
                      icon: result?.whatsappIcon,
                      onTap: () => UrlLauncherHelper.launchWhatsApp(
                        '994552516420',
                        message: 'Salam Anayam komandası!',
                      ),
                    ),
                    SizedBox(height: 24),
                    ContactUsBox(
                      contactTitle: result?.emailTop ?? '',
                      contactDescription: result?.emailBottom ?? '',
                      icon: result?.emailIcon ?? '',
                      onTap: () => UrlLauncherHelper.launchEmail(
                        toEmail: 'uzeyir.nev@gmail.com',
                        subject: 'Anayam Əlaqə',
                        body: 'Salam!',
                      ),
                    ),
                  ],
                );
              }

              return SizedBox.shrink();
            },
          ),
        ));
  }
}
