
import 'package:dartz/dartz.dart'; // search 
import '../../data/auth/Authentification_provider.dart';
import '../../failuer/failuers.dart';
import '../../model/user.model.dart';

class AuthRepository{
  final AuthProvider authProvider;

  AuthRepository({required this.authProvider});

  Future<Either<Failure,User>> login(String email, String password) async {
    try {
      final user = await authProvider.login(email, password);
      return Right(user);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, void>> logout() async {
    try {
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}