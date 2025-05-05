import 'package:burla_xatun/cubits/contact/contact_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../utils/constants/color_constants.dart';
import '../../../../../widgets/custom_circular_progress_indicator.dart';
import '../../../../../widgets/global_appbar.dart';
import 'widgets/contact_us_box.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstants.profileScaffoldColor,
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
                      contactTitle: result?.callTop ?? 'Bizə zəng edin',
                      contactDescription:
                          result?.callBottom ?? 'Sual və təklifiniz var ?',
                      icon: result?.callIcon,
                      // icon: 'assets/icons/contact_us_call_icon.svg',
                      // iconColor: Color(0xffEC407A),
                    ),
                    SizedBox(height: 24),
                    ContactUsBox(
                      contactTitle: result?.whatsappTop ?? 'Whatsapp',
                      contactDescription:
                          result?.whatsappBottom ?? 'Bizə onlayn yazın',
                      icon: result?.whatsappIcon,
                      //iconColor: Color(0xff00D95F),
                    ),
                    SizedBox(height: 24),
                    ContactUsBox(
                      contactTitle: result?.emailTop ?? '',
                      contactDescription: result?.emailBottom ?? '',
                      icon: result?.emailIcon ?? '',
                      //iconColor: Color(0xff0BA5EC),
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
