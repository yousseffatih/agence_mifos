import 'package:agence_mifos/data/api_client.dart';

class GroupListCenterProvider {
  final ApiClient apiClient;
  GroupListCenterProvider({ required this.apiClient});

  Future<dynamic> getListGroups(int id) async {
    final response = await apiClient.get("/centers/$id?associations=groupMembers");
    try{
      if(response.statusCode == 200)
      {
        return response.data;
      }
    }catch (e) {
      rethrow;
    }
  }
}