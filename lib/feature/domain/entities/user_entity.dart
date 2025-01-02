import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String email;
  final String? name;
  final String? avatarImage;

  const UserEntity({
    required this.id,
    required this.email,
    this.name,
    this.avatarImage,
  });

  static const UserEntity empty = UserEntity(
    id: '',
    email: '',
    name: '',
    avatarImage: '',
  );

  @override
  List<Object?> get props => [id, email, name, avatarImage];
}
