import 'package:agence_mifos/data/loan_account/loan_account_provider.dart';
import 'package:agence_mifos/model/loan_account.model.dart';
import 'package:dartz/dartz.dart';

import '../../failuer/failuers.dart';

class LoanAccountRepository {
  final LoanAccountProvider loanAccountProvider;
  LoanAccountRepository({ required this.loanAccountProvider});

  Future<Either<Failure,LoanAccount>> getLoanAccountById(int id) async {
    try{
      final data = await loanAccountProvider.getLoanAccountById(id);
        final groupDetail =  LoanAccount.fromJson(data);
        return Right(groupDetail);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}