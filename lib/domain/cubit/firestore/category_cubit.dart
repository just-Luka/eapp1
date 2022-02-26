import 'package:bloc/bloc.dart';
import 'package:eapp1/config/sp_keyword.dart';
import 'package:eapp1/data/models/firestore/category_model.dart';
import 'package:eapp1/data/repository/firestore/firestore_repository.dart';
import 'package:eapp1/data/repository/firestore/list/category_repository.dart';
import 'package:meta/meta.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  Future<void> fetchCategory() async {
    emit(CategoryLoading());

    List<CategoryModel> data = await FirestoreRepository<CategoryModel>(keyword: SPKeyword.category).firestoreList(CategoryRepository());

    data.isNotEmpty ? emit(CategoryLoaded(model: data)) : emit(CategoryError());
  }
}
