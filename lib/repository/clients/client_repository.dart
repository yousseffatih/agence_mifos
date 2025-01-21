import 'package:agence_mifos/data/client/client_provider.dart';
import 'package:agence_mifos/model/client.model.dart';
import 'package:agence_mifos/model/clients.model.dart';
import 'package:agence_mifos/model/loanAccountClient.model.dart';
import 'package:dartz/dartz.dart';

import '../../failuer/failuers.dart';

class ClientRepository {
  final ClientProvider clientProvider;

  ClientRepository({required this.clientProvider});

  Future<Either<Failure,Clients>> getAllClients() async {
    try{
      final data = await clientProvider.getAllClient();
        final listClients =  Clients.fromJson(data);
        return Right(listClients);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure,Client>> getClientById(int id) async {
    try{
      final data = await clientProvider.getClientById(id);
        final listClients =  Client.fromJson(data);
        return Right(listClients);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure,LoanAccountClient>> getLoanAccountForClient(int id) async {
    try{
      final data = await clientProvider.getLoanAccountForClient(id);
        final listLoanAccount =  LoanAccountClient.fromJson(data);
        return Right(listLoanAccount);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}