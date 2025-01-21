
import '../api_client.dart';

class GroupsProvider {
  ApiClient apiClient;

  GroupsProvider(
    {
      required this.apiClient
    }
  );

  Future<dynamic> getAllGroups() async {
    final response = await apiClient.get("/groups?paged=true&offset=0&limit=200");
    try{
      if(response.statusCode == 200)
      {
        return response.data;
      }
    } catch (e) {
      rethrow;    
    }
  } 

  Future<dynamic> getDetailGroup(int id) async {
    final response = await apiClient.get("/groups/$id");
    try{
      if(response.statusCode == 200)
      {
        return response.data;
      }
    } catch (e) {
      rethrow;    
    }
  } 

  Future<dynamic> getLoanAccountForGroup(int id) async {
    final response = await apiClient.get('/groups/$id/accounts');
    try{
      if(response.statusCode == 200)
      {
        return response.data;
      }
    } catch (e) {
      rethrow;    
    }
  }

}