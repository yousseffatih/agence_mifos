import 'package:agence_mifos/data/loan_account/loan_account_provider.dart';
import 'package:agence_mifos/model/charge_loan.model.dart';
import 'package:agence_mifos/model/charge_template.model.dart';
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

  Future<Either<Failure,List<ChanrgesLoan>>> getChargesLoan(int id) async {
    try{
      final data = await loanAccountProvider.getChargesLoan(id);
        final list = data.map<ChanrgesLoan>((e)=> ChanrgesLoan.fromJson(e)).toList();
        return Right(list);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure,ChargesTemplate>> getChargesTemplate(int id) async {
    try{
      final data = await loanAccountProvider.getChargesTemplate(id);
        final list = ChargesTemplate.fromJson(data);
        return Right(list);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}