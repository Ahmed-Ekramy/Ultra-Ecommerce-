part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
final class ChangeNavState extends HomeState {}
final class ChangeSelectedIndexBrandState extends HomeState {}
final class ChangeSelectedIndexBrandMakeUpState extends HomeState {}
final class ChangeSelectedIndexTypeOfClothesState extends HomeState {}
