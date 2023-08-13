

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:sangeet_g/models/pagination.dart';
import 'package:sangeet_g/providers/providers.dart';

import '../models/slider.dart';

class HomeSliderWidget extends ConsumerWidget{
  const HomeSliderWidget({Key?key}):super(key:key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
     return Container(
       color: Colors.white,
       child: _slideList(ref),
     );
    throw UnimplementedError();
  }
  
  Widget _slideList(WidgetRef ref)
  {
    final slider=ref.watch(sliderProvider
      (
      PaginationModel(page: 1, pageSize: 10)
    ),
    );
    return slider.when(data: (list){
      return imageCarouse(list!);
    },
        error: (_, __)=>  const Center(
          child: Text('error'),
        ), loading: ()=> const Center(
          child: CircularProgressIndicator(),
        )
    );
  }

  Widget imageCarouse( List<SliderModel> sliderList,)
  {
    return CarouselSlider(items: sliderList.map(
        (model){
          return Container(
            decoration: BoxDecoration(
                image: DecorationImage(
               image: NetworkImage(
                   model.sliderImage),
                   fit: BoxFit.contain,
                ),

            ),
          );
        }).toList()
    ,options:CarouselOptions(
          enlargeCenterPage: true,
          autoPlay: true,
          aspectRatio: 15/5,
          autoPlayCurve: Curves.decelerate,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: const Duration(microseconds: 2000000),
          viewportFraction: 0.9

        ));
  }
}