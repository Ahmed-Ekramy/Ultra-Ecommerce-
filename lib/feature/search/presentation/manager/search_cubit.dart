

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ultra/feature/search/presentation/manager/search_state.dart';

class SearchCubit extends Cubit<SearchState<dynamic>> {
  SearchCubit() : super(const SearchState.initial());
  static SearchCubit get(context) => BlocProvider.of(context);
  bool isGridView = true;
  int searchIndexByName = 0;
  void searchByName(int index) {
    searchIndexByName = index;
    emit( SearchIndexByNameState(index));
  }
  void changeGridViewListView() {
    isGridView = !isGridView;
    emit(ChangeGridViewListViewState( isGridView));
  }
}
