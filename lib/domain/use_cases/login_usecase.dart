import 'package:hrms/data/models/user/user_models.dart';
import 'package:hrms/data/repositories/auth/auth_repository.dart';

class LoginUseCase {
  final AuthRepository authRepository;

  LoginUseCase(this.authRepository);

  Future<UserModel?> call(String email, String password) {
    return authRepository.login(email, password);
  }
}