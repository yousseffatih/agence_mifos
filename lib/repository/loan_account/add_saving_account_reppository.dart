import 'package:agence_mifos/model/body/add_saving_account.body.dart';
import 'package:agence_mifos/model/saving_prod_template.dart';
import 'package:dartz/dartz.dart';

import '../../data/loan_account/add_saving_account_provider.dart';
import '../../failuer/failuers.dart';
import '../../model/saving_account.model.dart';

class AddSavingAccountReppository {
  final AddSavingAccountProvider addSavingAccountProvider;
  AddSavingAccountReppository({ required this.addSavingAccountProvider});

  Future<Either<Failure,List<SavingsProduct>>> getLoanProduct() async 
  {
    try {
      final data = await addSavingAccountProvider.getListSavingProducts();
      final list = data.map<SavingsProduct>((e)=> SavingsProduct.fromJson(e)).toList();
      return Right(list);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure,SavingProdTemplate>> getLoanProductTemplate() async 
  {
    try {
      final data = await addSavingAccountProvider.getListSavingProductsTemplate();
      final list = SavingProdTemplate.fromJson(data);
      return Right(list);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure,dynamic>> addSavingAccount(AddSavingAccounBody body) async 
  {
    try {
      final data = await addSavingAccountProvider.addSavingAccount(body);
      return Right(data);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}