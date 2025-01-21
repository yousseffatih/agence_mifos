import 'package:agence_mifos/data/search/search_provider.dart';
import 'package:agence_mifos/failuer/failuers.dart';
import 'package:dartz/dartz.dart';

import '../../model/search.model.dart';

class SearchRepository {
  final SearchProvider searchProvider;
  SearchRepository({required this.searchProvider});

  Future<Either<Failure,List<Search>>> getSearchAll(String query , bool exactMatch) async {
    try {
      final data = await searchProvider.getSearchAll(query, exactMatch);
      final listSearch = data.map<Search>((e) => Search.fromJson(e)).toList();
      return Right(listSearch);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure,List<Search>>> getSearchResource(String query , String resource , bool exactMatch) async {
    try {
      final data = await searchProvider.getSearchResources(query, resource,exactMatch);
      final listSearch = data.map<Search>((e) => Search.fromJson(e)).toList();
      return Right(listSearch);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}