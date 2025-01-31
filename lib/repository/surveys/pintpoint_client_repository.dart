import 'package:dartz/dartz.dart';

import '../../data/surveys/pintpoint_client_provider.dart';
import '../../failuer/failuers.dart';
import '../../model/surveys_client.model.dart';

class SurveysClientRepository {
  final SurveysClientProvider surveysClientProvider;
  SurveysClientRepository({ required this.surveysClientProvider});

  Future<Either<Failure,List<SurveysClient>>> getAllSurveys() async {
    try{
      final data = await surveysClientProvider.getAllSurveys();
      final list = data.map<SurveysClient>((e)=> SurveysClient.fromJson(e)).toList();
      return Right(list);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}