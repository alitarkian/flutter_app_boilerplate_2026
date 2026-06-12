import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/auth_me_model.dart';

@lazySingleton
class AuthSessionCubit extends Cubit<AuthMeModel?> {
  AuthSessionCubit() : super(null);

  void setUser(AuthMeModel user) {
    emit(user);
  }

  void clear() {
    emit(null);
  }
}
