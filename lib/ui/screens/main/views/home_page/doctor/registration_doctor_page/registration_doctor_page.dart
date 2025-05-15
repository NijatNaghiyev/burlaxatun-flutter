import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../cubits/doctors_detail/doctors_detail_cubit.dart';
import '../../../../../../../utils/constants/color_constants.dart';
import '../../../../../../../utils/extensions/num_extensions.dart';
import '../../../../../../../utils/helper/doctor_time_helper.dart';
import '../../../../../../widgets/global_button.dart';
import 'widgets/registration_date_and_time_widget.dart';
import 'widgets/registration_doctor_info.dart';
import 'widgets/registration_price_and_time.dart';

class RegistrationDoctorPage extends StatelessWidget {
  // final String slug;
  const RegistrationDoctorPage({
    super.key,
    // required this.slug,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFCFCFD),
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(top: 10, left: 15),
          child: GestureDetector(
            onTap: () {
              context.pop();
            },
            child: Icon(Icons.arrow_back_ios_new_rounded),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              BlocBuilder<DoctorDetailCubit, DoctorDetailState>(
                builder: (context, state) {
                  if (state.status == DoctorDetailStatus.loading) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (state.status == DoctorDetailStatus.failure ||
                      state.status == DoctorDetailStatus.networkError) {
                    return Center(
                        child: Text('Xəta baş verdi: ${state.errorMessage}'));
                  }

                  final doctor = state.response;

                  if (doctor == null) {
                    return Center(child: Text('Həkim məlumatı tapılmadı.'));
                  }

                  final List<String> timeList = doctor.availableTime != null
                      ? DoctorTimeHelper.generateHourlyTimes(
                          doctor.availableTime!)
                      : [];

                  return Column(
                    children: [
                      RegistrationDoctorInfo(doctor: doctor),
                      32.h,
                      RegistrationPriceAndTime(doctor: doctor),
                      40.h,
                      RegistrationDateAndTimeWidget(
                        timeList: timeList,
                      ),
                      75.h,
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(10),
        child: GlobalButton(
          buttonName: 'Qeydiyyat',
          buttonColor: ColorConstants.primaryRedColor,
          textColor: Colors.white,
          onPressed: () {},
        ),
      ),
    );
  }
}
