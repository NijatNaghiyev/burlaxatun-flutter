import 'package:burla_xatun/cubits/user_data/user_data_cubit.dart';
import 'package:burla_xatun/ui/widgets/custom_circular_progress_indicator.dart';
import 'package:burla_xatun/utils/constants/color_constants.dart';
import 'package:burla_xatun/utils/extensions/num_extensions.dart';
import 'package:burla_xatun/utils/helper/phone_number_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_mobile_field/intl_mobile_field.dart';

class ChangePhoneNumberView extends StatefulWidget {
  const ChangePhoneNumberView({super.key});

  @override
  State<ChangePhoneNumberView> createState() => _ChangePhoneNumberViewState();
}

class _ChangePhoneNumberViewState extends State<ChangePhoneNumberView> {
  final _formKey = GlobalKey<FormState>();

  String? _phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nömrəni dəyişdirin'),
      ),
      body: BlocBuilder<UserDataCubit, UserDataState>(
        builder: (_, state) {
          if (state.status == UserDataStatus.loading) {
            return const Center(
              child: CustomCircularProgressIndicator(),
            );
          }

          if (state.status == UserDataStatus.failure) {
            return const Center(
              child: Text('Xəta'),
            );
          }

          if (state.status == UserDataStatus.networkError) {
            return const Center(
              child: Text('Şəbəkə xətası'),
            );
          }

          if (state.status == UserDataStatus.success) {
            final number = state.response?.phoneNumber ?? '';

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: RefreshIndicator(
                onRefresh: () async {
                  context.read<UserDataCubit>().getUserData();
                  // Gözləmə əlavə etmək üçün:
                  // await Future.delayed(const Duration(seconds: 1));
                },
                child: SingleChildScrollView(
                  physics:
                      const AlwaysScrollableScrollPhysics(), // Refresh üçün vacibdir
                  child: Column(
                    children: [
                      10.h,
                      Text(
                        'Current phone number: $number',
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: ColorConstants.black800,
                        ),
                      ),
                      20.h,
                      Form(
                        key: _formKey,
                        child: IntlMobileField(
                          initialCountryCode: 'AZ',
                          decoration: const InputDecoration(
                            labelText: 'New phone number',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                          ),
                          onChanged: (phone) {
                            _phoneNumber = phone.completeNumber;
                          },
                          onSaved: (phone) {
                            _phoneNumber = phone?.completeNumber;
                          },
                          validator: (phone) {
                            if (phone == null || phone.number.isEmpty) {
                              return 'Please enter phone number';
                            }
                            return null;
                          },
                        ),
                      ),
                      20.h,
                      ElevatedButton(
                        onPressed: () {
                          PhoneNumberHelper.savePhoneNumber(
                            context: context,
                            formKey: _formKey,
                            phoneNumber: _phoneNumber,
                          );
                        },
                        child: const Text('Save'),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
