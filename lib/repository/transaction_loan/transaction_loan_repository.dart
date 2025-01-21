import 'package:agence_mifos/data/transaction_loan/transaction_loan_provider.dart';
import 'package:agence_mifos/model/loan_account.model.dart';
import 'package:dartz/dartz.dart';

import '../../failuer/failuers.dart';

class TransactionLoanRepository {
  final TransactionLoanProvider transactionLoanProvider;
  TransactionLoanRepository({required this.transactionLoanProvider});

  Future<Either<Failure,LoanAccount>> getSearchAll(int idLoan) async {
    try {
      final data = await transactionLoanProvider.getTransactionLoan(idLoan);
      final list =  LoanAccount.fromJson(data);
      return Right(list);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}