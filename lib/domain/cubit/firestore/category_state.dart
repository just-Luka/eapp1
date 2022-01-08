part of 'category_cubit.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  List<CategoryModel> model;

  CategoryLoaded({
    required this.model
  });
}

class CategoryError extends CategoryState {}