part of 'slider_cubit.dart';

@immutable
abstract class SliderState {}

class SliderInitial extends SliderState {}

class SliderLoading extends SliderState {}

class SliderLoaded extends SliderState {
  final List<SliderModel> model;

  SliderLoaded({
    required this.model
  });
}

class SliderError extends SliderState {}