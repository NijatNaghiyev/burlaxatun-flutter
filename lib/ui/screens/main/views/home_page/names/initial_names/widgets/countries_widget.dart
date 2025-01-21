import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class CountriesWidget extends StatelessWidget {
  const CountriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: 20,
        itemBuilder: (_, i) {
          return ListTile(
            leading: Image.asset(
              'assets/png/flag.png',
              width: 46,
              height: 46,
            ),
            title: Text('Country name'),
            trailing: SvgPicture.asset('assets/icons/arrow_right.svg'),
            onTap: () {
              context.push('/gender_names');
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: Color(0xffDADADA),
          );
        },
      ),
    );
  }
}
