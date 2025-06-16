import 'dart:developer';

import 'package:burla_xatun/cubits/doctor_reservation/doctor_reservation_cubit.dart';
import 'package:burla_xatun/ui/widgets/custom_circular_progress_indicator.dart';
import 'package:burla_xatun/utils/app/app_snackbars.dart';
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
    final DoctorReservationCubit doctorReservationCubit =
        context.read<DoctorReservationCubit>();
    late int doctorId;
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
                  doctorId = doctor?.id ?? -1;

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
        child: BlocConsumer<DoctorReservationCubit, DoctorReservationState>(
          buildWhen: (previous, current) {
            return previous.doctorReservStatus != current.doctorReservStatus;
          },
          listenWhen: (previous, current) {
            return previous.doctorReservStatus != current.doctorReservStatus;
          },
          listener: (context, state) {
            if (state.doctorReservStatus == DoctorReservStatus.error) {
              AppSnackbars.error(
                  context, state.errorMessage ?? 'error occured');
            } else if (state.doctorReservStatus == DoctorReservStatus.success) {
              context.go('/home');
              // ScaffoldMessenger.of(context).showSnackBar(
              //   SnackBar(content: Text('success')),
              // );
            }
          },
          builder: (context, state) {
            if (state.doctorReservStatus == DoctorReservStatus.loading) {
              return CircularProgressIndicator.adaptive();
            }
            return GlobalButton(
              buttonName: 'Qeydiyyat',
              buttonColor: ColorConstants.primaryRedColor,
              textColor: Colors.white,
              onPressed: () {
                doctorReservationCubit.reservDoctor(doctorId);
              },
            );
          },
        ),
      ),
    );
  }
}
