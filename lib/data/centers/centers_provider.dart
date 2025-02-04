import '../api_client.dart';

class CentersProvider {
  ApiClient apiClient;

  CentersProvider(
    {
      required this.apiClient
    }
  );

  Future<dynamic> getAllCenters() async {
    final response = await apiClient.get("/centers?paged=true&offset=0&limit=100");
    try{
      if(response.statusCode == 200)
      {
        return response.data;
      }
    } catch (e) {
      rethrow;    
    }
  }

  Future<dynamic> getDetailInfoCenter(int id) async  {
    final response = await apiClient.get("/centers/$id?associations=groupMembers,collectionMeetingCalendar");
    try{
      if(response.statusCode == 200)
      {
        return response.data;
      }
    } catch (e) {
      rethrow;    
    } 
  }

  Future<dynamic> getDetailSummeryInfoCenter(int id) async  {
    final response = await apiClient.get("/runreports/GroupSummaryCounts?R_groupId=$id&genericResultSet=false");
    try{
      if(response.statusCode == 200)
      {
        return response.data;
      }
    } catch (e) {
      rethrow;    
    } 
  }

  Future<dynamic> activateCenter(int id , String date) async {
    final body = {
      "locale": "en",
      "dateFormat": "dd MMMM yyyy",
      "activationDate": date
    };

    final response = await apiClient.post("/centers/$id?command=activate", body);
    try{
      if(response.statusCode==200)
      {
        return response.data;
      }
    } catch(e) {
      rethrow;
    }
  }

}