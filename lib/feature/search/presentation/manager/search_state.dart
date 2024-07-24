import 'package:freezed_annotation/freezed_annotation.dart';
 part 'search_state.freezed.dart';
@freezed
class SearchState<T> with _$SearchState <T>{
  const factory SearchState.initial( ) = Initial;
  const factory SearchState.searchIndexByNameState(T data) = SearchIndexByNameState <T>;
  const factory SearchState.changeGridViewListViewState( T data) =
  ChangeGridViewListViewState<T>;
}
