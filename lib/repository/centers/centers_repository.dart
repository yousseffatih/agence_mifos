
import 'package:agence_mifos/model/center_info.model.dart';
import 'package:agence_mifos/model/center_summery_info_center.dart';
import 'package:dartz/dartz.dart';

import '../../data/centers/centers_provider.dart';
import '../../failuer/failuers.dart';
import '../../model/centers.model.dart';

class CentersRepository {
  final CentersProvider centersProvider;

  CentersRepository({required this.centersProvider});

  Future<Either<Failure,Centers>> getAllClients() async {
    try{
      final data = await centersProvider.getAllCenters();
        final centers =  Centers.fromJson(data);
        return Right(centers);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure,CenterInfo>> getDetailInfoCenter(int id) async {
    try{
      final data = await centersProvider.getDetailInfoCenter(id);
        final centerInfo = CenterInfo.fromJson(data);
        return Right(centerInfo);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure,CenterSummeryInfo>> getDetailSummeryInfoCenter(int id) async {
    try{
      final data = await centersProvider.getDetailSummeryInfoCenter(id);
        final centerInfo = CenterSummeryInfo.fromJson(data[0]);
        return Right(centerInfo);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure,dynamic>> activateCenter(int id, String date) async {
    try{
      final data = await centersProvider.activateCenter(id, date);
      return Right(data);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}