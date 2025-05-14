import 'package:burla_xatun/data/models/remote/response/medicine/medicines_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../cubits/medicine_patch/medicine_patch_cubit.dart'; // Import MedicinePatchCubit
import '../../../../../../../../../utils/constants/color_constants.dart';
import '../../../../../../../../../utils/extensions/num_extensions.dart';
import '../../../../../../../../widgets/global_text.dart';
import '../../../body_weight_view/widgets/add_indicator_input.dart';

class EditMedicineDialog extends StatefulWidget {
  final Result data;

  const EditMedicineDialog({
    super.key,
    required this.data,
  });

  @override
  State<EditMedicineDialog> createState() => _EditMedicineDialogState();
}

class _EditMedicineDialogState extends State<EditMedicineDialog> {
  final _nameController = TextEditingController();
  final _doseController = TextEditingController();
  final _frequencyController = TextEditingController();
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _nameController.text = widget.data.name ?? '';
    _doseController.text = widget.data.dose ?? '';
    _frequencyController.text = widget.data.frequency ?? '';

    final dateFormat = DateFormat('dd.MM.yyyy');
    if (widget.data.startDate != null) {
      _startDateController.text = dateFormat.format(widget.data.startDate!);
    }
    if (widget.data.endDate != null) {
      _endDateController.text = dateFormat.format(widget.data.endDate!);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _doseController.dispose();
    _frequencyController.dispose();
    _startDateController.dispose();
    _endDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MedicinePatchCubit, MedicinePatchState>(
      listener: (context, state) {
        if (state.status == MedicinePatchStatus.success) {
          final updated = Result(
            name: _nameController.text,
            dose: _doseController.text,
            frequency: _frequencyController.text,
            startDate:
                DateFormat('dd.MM.yyyy').parse(_startDateController.text),
            endDate: DateFormat('dd.MM.yyyy').parse(_endDateController.text),
            slug: widget.data.slug,
            status: "yes",
          );

          Navigator.pop(context, updated);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text("Dərman məlumatları uğurla yeniləndi")),
          );
        } else if (state.status == MedicinePatchStatus.failure ||
            state.status == MedicinePatchStatus.networkError) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Xəta baş verdi")),
          );
        }
      },
      child: AnimatedPadding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom / 1.4),
        duration: const Duration(milliseconds: 300),
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 521,
            child: Material(
              type: MaterialType.transparency,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 22, right: 32),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            child:
                                SvgPicture.asset('assets/icons/close_icon.svg'),
                            onTap: () => Navigator.pop(context),
                          )
                        ],
                      ),
                    ),
                    const GlobalText(
                      text: 'Düzəliş et',
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    30.h,
                    Padding(
                      padding: const EdgeInsets.only(right: 3),
                      child: SizedBox(
                        height: 340,
                        child: Scrollbar(
                          thumbVisibility: true,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  AddIndicatorInput(
                                    inputName: 'Dərman adı',
                                    hintText: 'Ad',
                                    controller: _nameController,
                                  ),
                                  AddIndicatorInput(
                                    inputName: 'Doza',
                                    hintText: 'Mg',
                                    controller: _doseController,
                                  ),
                                  AddIndicatorInput(
                                    inputName: 'Dərman qəbulun tezliyi',
                                    hintText: '2 dəfə/gün',
                                    controller: _frequencyController,
                                  ),
                                  AddIndicatorInput(
                                    inputName: 'Başlama tarixi',
                                    hintText: '24.06.2024',
                                    controller: _startDateController,
                                  ),
                                  AddIndicatorInput(
                                    inputName: 'Bitmə tarixi',
                                    hintText: '24.07.2025',
                                    controller: _endDateController,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    20.h,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 44,
                          width: 140,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shadowColor: const WidgetStatePropertyAll(
                                  Colors.transparent),
                              backgroundColor:
                                  WidgetStatePropertyAll(Color(0xffECECEC)),
                            ),
                            onPressed: () => Navigator.pop(context),
                            child: const GlobalText(
                              text: 'İmtina Et',
                              fontSize: 14,
                              height: 1.1,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        const SizedBox(width: 22),
                        SizedBox(
                          height: 44,
                          width: 140,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shadowColor: const WidgetStatePropertyAll(
                                  Colors.transparent),
                              backgroundColor:
                                  WidgetStatePropertyAll(Color(0xffFFD3E2)),
                            ),
                            onPressed: () {
                              final name = _nameController.text;
                              final dose = _doseController.text;
                              final frequency = _frequencyController.text;
                              final startDateText = _startDateController.text;
                              final endDateText = _endDateController.text;

                              if (name.isEmpty ||
                                  dose.isEmpty ||
                                  frequency.isEmpty ||
                                  startDateText.isEmpty ||
                                  endDateText.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        "Zəhmət olmasa bütün sahələri doldurun"),
                                  ),
                                );
                                return;
                              }

                              final dateFormat = DateFormat('dd.MM.yyyy');
                              DateTime? startDate;
                              DateTime? endDate;

                              try {
                                startDate =
                                    dateFormat.parseStrict(startDateText);
                                endDate = dateFormat.parseStrict(endDateText);
                              } catch (_) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        "Tarix formatı yanlışdır. Məsələn: 24.07.2024"),
                                  ),
                                );
                                return;
                              }

                              // Use patchMedicine method
                              context.read<MedicinePatchCubit>().patchMedicine(
                                    slug: widget.data.slug ?? '',
                                    name: name,
                                    dose: dose,
                                    frequency: frequency,
                                    startDate: startDate,
                                    endDate: endDate,
                                    status: "yes",
                                  );
                            },
                            child: const GlobalText(
                              text: 'Yadda saxla',
                              fontSize: 14,
                              height: 1.1,
                              fontWeight: FontWeight.w500,
                              color: ColorConstants.primaryRedColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
