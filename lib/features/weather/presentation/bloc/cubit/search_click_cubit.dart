// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_click_state.dart';

class SearchClickCubit extends Cubit<SearchClickState> {
  SearchClickCubit() : super(const SearchClickInitial(city: false));

  void toggle(state) {
    emit(ToggleClickState(city: !state.city));
  }
}
