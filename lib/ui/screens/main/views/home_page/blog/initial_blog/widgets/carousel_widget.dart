import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../../../../cubits/main/main_state.dart';
import '../../../../../../../../cubits/main/mainn_cubit.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final mainCubit = context.read<MainnCubit>();
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width ,
          child: BlocBuilder<MainnCubit, MainInitial>(
            builder: (context, state) {
              return CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 1,
                  initialPage: state.carouselIndex,
                  viewportFraction: 1,
                  height: 172,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  onPageChanged: (index, reason) {
                    mainCubit.updateCarouselIndex(index);
                  },
                ),
                items: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Image.asset(
                      'assets/png/banner.png',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Image.asset(
                      'assets/png/banner.png',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Image.asset(
                      'assets/png/banner.png',
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        BlocBuilder<MainnCubit, MainInitial>(
          buildWhen: (previous, current) {
            return previous.carouselIndex != current.carouselIndex;
          },
          builder: (context, state) {
            return Positioned(
              bottom: 13,
              child: AnimatedSmoothIndicator(
                activeIndex: state.carouselIndex,
                count: 3,
                effect: CustomizableEffect(
                  spacing: 6,
                  dotDecoration: DotDecoration(
                    width: 8,
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(19)),
                  ),
                  activeDotDecoration: DotDecoration(
                    width: 16,
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(19)),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
