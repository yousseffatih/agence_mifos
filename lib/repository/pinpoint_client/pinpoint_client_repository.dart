import 'package:agence_mifos/failuer/failuers.dart';
import 'package:dartz/dartz.dart';

import '../../data/pinppoint_client/pinpoint_provider.dart';

class PinpointClientRepository {
  final PinpointProvider pinpointProvider;
  PinpointClientRepository({ required this.pinpointProvider});

  Future<Either<Failure,dynamic>> getPinPointClient (int id) async {
    try{
      final data = await pinpointProvider.getPinpoinyClient(id);
      return Right(data);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}