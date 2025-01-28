import 'package:agence_mifos/data/loan_account/add_loan_provider.dart';
import 'package:agence_mifos/failuer/failuers.dart';
import 'package:agence_mifos/model/body/add_Loan.body.dart';
import 'package:agence_mifos/model/charge_template.model.dart';
import 'package:dartz/dartz.dart';

import '../../model/add_loan_list.dart';

class AddLoanRepository {
  final AddLoanProvider addLoanProvider;
  AddLoanRepository({ required this.addLoanProvider});

  Future<Either<Failure,List<ChargeOption>>> getLoanProduct() async 
  {
    try {
      final data = await addLoanProvider.getListLoanProduct();
      final list = data.map<ChargeOption>((e)=> ChargeOption.fromJsonCheck(e)).toList();
      return Right(list);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure,LoanList>> getListAddLoan(int idClient) async 
  {
    try {
      final data = await addLoanProvider.getListsAddLoan(idClient);
      final list = LoanList.fromJson(data);
      return Right(list);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure,dynamic>> addLoan(AddLoanBody body) async 
  {
    try {
      final data = await addLoanProvider.addLoan(body);
      final list = LoanList.fromJson(data);
      return Right(list);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}