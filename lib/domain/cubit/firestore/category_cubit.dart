import 'package:bloc/bloc.dart';
import 'package:eapp1/data/models/firestore/category_model.dart';
import 'package:eapp1/data/repository/firestore/category_repository.dart';
import 'package:meta/meta.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  Future<void> fetchCategory() async {
    emit(CategoryLoading());
    List<CategoryModel> data = await CategoryRepository().byDefault();

    data.isNotEmpty ? emit(CategoryLoaded(model: data)) : emit(CategoryError());
  }
}
