import 'dart:async';


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sangeet_g/api/api_service.dart';
import 'package:sangeet_g/models/pagination.dart';

import '../models/category.dart';

final categoriesProvider=
    FutureProvider.family<List<Category>?,PaginationModel >(
        (ref,paginationModel) {
          print('IN Data Provider');
          final apiRepository=ref.watch(apiService);
          return apiRepository.getCategories(
             paginationModel.page,
            paginationModel.pageSize
          );
        }
    );