import 'package:agence_mifos/data/api_client.dart';

class PintpointClientProvider {
  final ApiClient apiClient;

  PintpointClientProvider({ required this.apiClient});

  Future<dynamic> getAllSurveys() async 
  {
    final response = await apiClient.get("/surveys");
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