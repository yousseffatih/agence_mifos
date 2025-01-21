import 'package:agence_mifos/data/repayement_sch_loan/repayement_sch_loan_provider.dart';
import 'package:dartz/dartz.dart';

import '../../failuer/failuers.dart';
import '../../model/loan_account.model.dart';

class RepayementSchLoanRepository {
  final RepayementSchLoanProvider repayementSchLoanProvider;
  RepayementSchLoanRepository({required this.repayementSchLoanProvider});

  Future<Either<Failure,LoanAccount>> getSearchAll(int idLoan) async {
    try {
      final data = await repayementSchLoanProvider.getRepaementSchLoan(idLoan);
      final list =  LoanAccount.fromJson(data);
      return Right(list);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}