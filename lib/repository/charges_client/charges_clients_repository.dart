import 'package:agence_mifos/data/charges_client/charges_client_provider.dart';
import 'package:agence_mifos/model/add_loan_list.dart';
import 'package:agence_mifos/model/body/submit_charges.body.dart';
import 'package:agence_mifos/model/charge_template.model.dart';
import 'package:dartz/dartz.dart';

import '../../failuer/failuers.dart';
import '../../model/charge_client.model.dart';

class ChargesClientsRepository {
  final ChargesClientProvider chargesClientProvider;
  ChargesClientsRepository({ required this.chargesClientProvider});

  Future<Either<Failure,ChargesClient>> getAllCharges(int idClient,int offseet, int limit) async {
    try{
      final data = await chargesClientProvider.getAllCharges(idClient,offseet,limit);
        final convertData =  ChargesClient.fromJson(data);
        return Right(convertData);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure,List<ChargeOption>>> getAllChargesOptionClient(int idClient) async {
    try{
      final data = await chargesClientProvider.getAllChargesOptionClient(idClient);
      print(data.toString());
      final convertData =  data['chargeOptions'].map<ChargeOption>((e) => ChargeOption.fromJsonCheck(e)).toList();
      return Right(convertData);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure,dynamic>> addChargeClient(int idClient , SubmitChargesBody body) async {
    try{
      final data = await chargesClientProvider.addChargeClient(idClient, body);
      return Right(data);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}