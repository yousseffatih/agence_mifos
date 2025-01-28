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
}