import 'package:equatable/equatable.dart';

class HomeEntity extends Equatable {
  final String title;
  final String subtitle;

  const HomeEntity({required this.title, required this.subtitle});

  @override
  List<Object?> get props => [title, subtitle];
}
