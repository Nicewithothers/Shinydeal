import 'package:equatable/equatable.dart';

class BottomNavBarStates extends Equatable {
  const BottomNavBarStates({this.index = 0});
  final int index;

  BottomNavBarStates copyWith({int? index}) => BottomNavBarStates(index: index ?? this.index);

  @override
  List<Object?> get props => throw UnimplementedError();
}