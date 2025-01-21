import 'package:agence_mifos/data/api_client.dart';

class SearchProvider {
  final ApiClient apiClient;
  SearchProvider ({required this.apiClient});

  Future<dynamic> getSearchAll(String query , bool exactMatch) async {
    final response = await apiClient.get('/search?query=$query&exactMatch=$exactMatch');
    try{
      if(response.statusCode == 200)
      {
        return response.data;
      }
    } catch (e) {
      rethrow;    
    }
  }

  Future<dynamic> getSearchResources(String query , String resource, bool exactMatch) async {
    final response = await apiClient.get('/search?query=$query&resource=$resource&exactMatch=$exactMatch');
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