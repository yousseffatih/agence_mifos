import 'package:agence_mifos/data/pintpoint_client/pintpoint_client_provider.dart';
import 'package:agence_mifos/model/surveys_client.model.dart';
import 'package:dartz/dartz.dart';

import '../../failuer/failuers.dart';

class PintpointClientRepository {
  final PintpointClientProvider pintpointClientProvider;
  PintpointClientRepository({ required this.pintpointClientProvider});

  Future<Either<Failure,List<SurveysClient>>> getAllSurveys() async {
    try{
      final data = await pintpointClientProvider.getAllSurveys();
      print(data);
      final list = data.map<SurveysClient>((e)=> SurveysClient.fromJson(e)).toList();
      return Right(list);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}