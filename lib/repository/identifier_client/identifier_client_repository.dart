
import 'package:agence_mifos/model/body/add_identifier.body.dart';
import 'package:dartz/dartz.dart';

import '../../data/identifier_client/identifier_client_provider.dart';
import '../../failuer/failuers.dart';
import '../../model/document_types.model.dart';
import '../../model/identifier_client.model.dart';

class IdentifierClientRepository {
  final IdentifierClientProvider identifierClientProvider;
  IdentifierClientRepository({ required this.identifierClientProvider});

   Future<Either<Failure,List<IdentifiersClient>>> getidentifiersClient(int idClient) async {
    try{
      final data = await identifierClientProvider.getidentifiersClient(idClient);
        final list =  data.map<IdentifiersClient>((e)=> IdentifiersClient.fromJson(e)).toList();
        return Right(list);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

   Future<Either<Failure,DocumentTypes>> getDocumentTypes(int idClient) async {
    try{
      final data = await identifierClientProvider.getDocumentTypes(idClient);
      final list =  DocumentTypes.fromJson(data);
      return Right(list);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure,dynamic>> addIdentifier(int idClient,AddIdentifierBody body) async {
    try{
      final data = await identifierClientProvider.addIdentifier(idClient, body);
      return Right(data);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure,dynamic>> deleteIdentifier(int idClient,int idIdentifier) async {
    try{
      final data = await identifierClientProvider.deleteIdentifier(idClient, idIdentifier);
      return Right(data);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}