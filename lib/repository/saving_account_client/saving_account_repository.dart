import 'package:dartz/dartz.dart';

import '../../data/saving_account/saving_account_provider.dart';
import '../../failuer/failuers.dart';
import '../../model/saving_account_client.model.dart';

class SavingAccountRepository {
  final SavingAccountProvider savingAccountProvider;
  SavingAccountRepository({ required this.savingAccountProvider});

  Future<Either<Failure,SavingAccountClient>> getSearchAll(int idSaving) async {
    try {
      final data = await savingAccountProvider.getSavingAccount(idSaving);
      final list =  SavingAccountClient.fromJson(data);
      return Right(list);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}