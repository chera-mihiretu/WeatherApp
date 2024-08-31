part of 'search_click_cubit.dart';

sealed class SearchClickState extends Equatable {
  final bool city;
  const SearchClickState({required this.city});

  @override
  List<Object> get props => [];
}

final class SearchClickInitial extends SearchClickState {
  @override
  // ignore: overridden_fields
  final bool city;

  const SearchClickInitial({required this.city}) : super(city: city);
}

final class ToggleClickState extends SearchClickState {
  @override
  // ignore: overridden_fields
  final bool city;

  const ToggleClickState({required this.city}) : super(city: city);
}
