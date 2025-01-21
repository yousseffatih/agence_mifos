import 'package:agence_mifos/model/group_detail.model.dart';
import 'package:dartz/dartz.dart';

import '../../data/groups/groups_provider.dart';
import '../../failuer/failuers.dart';
import '../../model/groups.model.dart';
import '../../model/loanAccountClient.model.dart';

class GroupsRepository {
  final GroupsProvider clientProvider;

  GroupsRepository({required this.clientProvider});

  Future<Either<Failure,Groups>> getallGroups() async {
    try{
      final data = await clientProvider.getAllGroups();
        final listClients =  Groups.fromJson(data);
        return Right(listClients);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure,GroupDetail>> getDetailGroup(int id) async {
    try{
      final data = await clientProvider.getDetailGroup(id);
        final groupDetail =  GroupDetail.fromJson(data);
        return Right(groupDetail);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure,LoanAccountClient>> getLoanAccountForGroup(int id) async {
    try{
      final data = await clientProvider.getLoanAccountForGroup(id);
        final listLoanAccount =  LoanAccountClient.fromJson(data);
        return Right(listLoanAccount);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}