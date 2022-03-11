part of 'slider_cubit.dart';

@immutable
abstract class SliderState {}

class SliderInitial extends SliderState {}

class SliderLoading extends SliderState {
  SliderLoading();
}

class SliderLoaded extends SliderState {
  final List<HotelModel> model;
  final bool completely;

  SliderLoaded({
    required this.model,
    required this.completely,
  });
}

class SliderError extends SliderState {}
