import 'package:burla_xatun/utils/extensions/num_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Ultrasound extends StatelessWidget {
  const Ultrasound({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (_) {
                return SizedBox(
                  height: 250,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: CupertinoPicker(
                      itemExtent: 40,
                      onSelectedItemChanged: (v) {},
                      children: [
                        for (int i = 0; i < 10; i++)
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('$i'),
                            ],
                          ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          child: Text('Hefte sayi'),
        ),
        ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (_) {
                return SizedBox(
                  height: 300,
                  child: Column(
                    children: [
                      Text('gun sayi'),
                      30.h,
                      SizedBox(
                        height: 230,
                        child: CupertinoPicker(
                          itemExtent: 40,
                          onSelectedItemChanged: (v) {},
                          children: [
                            for (int i = 0; i < 10; i++)
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('$i'),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          child: Text('Gun sayi'),
        ),
      ],
    );
  }
}
