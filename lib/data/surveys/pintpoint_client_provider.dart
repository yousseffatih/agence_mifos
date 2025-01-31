import 'package:agence_mifos/data/api_client.dart';

class SurveysClientProvider {
  final ApiClient apiClient;

  SurveysClientProvider({ required this.apiClient});

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