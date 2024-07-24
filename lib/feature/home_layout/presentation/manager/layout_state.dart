import 'package:freezed_annotation/freezed_annotation.dart';
part '../../../home/presentation/manager/layout_state.freezed.dart';

@freezed
class LayoutState<T> with _$LayoutState<T> {
  const factory LayoutState.initial() = Initial;
  const factory LayoutState.changeNavState(T value ) = ChangeNavState<T>;
}
