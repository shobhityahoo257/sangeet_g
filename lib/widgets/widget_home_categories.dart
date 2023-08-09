import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sangeet_g/models/pagination.dart';
import 'package:sangeet_g/models/product_filter.dart';
import 'package:sangeet_g/providers/providers.dart';

import '../models/category.dart';

class HomeCategoryWidget extends ConsumerWidget {
  const HomeCategoryWidget({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Container(
      child: Column(
        children:  [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('All Categories',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold)

          ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _categoriesList(ref),
          )

        ],
      ),
    );
  }

  Widget _categoriesList(WidgetRef ref){
    final categories=ref.watch(
      categoriesProvider(
            PaginationModel(page: 1, pageSize: 10),
        ),
    );
    return categories.when(
      data:(list){
        print('DATE IS RECEIVED');
        return _buildCategoryList(list! as List<Category>,ref);
      },
      error:(_,__)=> const Center(child : Text('ERR Got')),
      loading:() => const Center(child: CircularProgressIndicator(),),
    );
  }


  Widget _buildCategoryList(List<Category> categories,WidgetRef ref){
    return Container(
      height: 150,
      alignment: Alignment.centerLeft,
      child: ListView.builder(itemBuilder: (context,index){
        var data=categories[index];
        return GestureDetector(
          onTap:(){
            ProductFilterModel filterModel=ProductFilterModel(paginationModel: PaginationModel(
              page: 1,pageSize: 10
            ),
              categoryId: data.categoryId,
            );
            ref.read(productFilterProvider.notifier).setProductFilter(filterModel);
            ref.read(productNotifierProvider.notifier).getProducts();
          //Navigating to Product page and also sending two arguments
            Navigator.of(context).pushNamed('/products',arguments: {
             'categoryId':data.categoryId,
              'categoryName':data.categoryName,
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(5),
                  width: 150,
                  height: 100,
                  alignment: Alignment.center,
                  child: Image.network(data.fullImagePath,height: 100,),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      data.categoryName,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold
                      )

                    ),
                    const Icon(Icons.keyboard_arrow_right,size:13 ,)
                  ],
                )
              ],
            ),
          ),
        );
      },
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      ),
    );
  }

}
