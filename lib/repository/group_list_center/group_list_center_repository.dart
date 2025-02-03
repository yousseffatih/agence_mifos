import 'package:agence_mifos/data/group_list_center/group_list_center_provider.dart';
import 'package:agence_mifos/failuer/failuers.dart';
import 'package:agence_mifos/model/group_list_center.model.dart';
import 'package:dartz/dartz.dart';

class GroupListCenterRepository {
  final GroupListCenterProvider groupListCenterProvider;
  GroupListCenterRepository({ required this.groupListCenterProvider});

  Future<Either<Failure, GroupListCenter>> getGroupList(int id) async 
  {
    try{
    final data = await groupListCenterProvider.getListGroups(id);
    final object = GroupListCenter.fromJson(data);
    return Right(object);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}