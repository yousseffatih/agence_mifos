import 'package:agence_mifos/data/api_client.dart';

class PinpointProvider {
  final ApiClient apiClient;
  PinpointProvider({ required this.apiClient });

  Future<dynamic> getPinpoinyClient(int idClient) async {
    final response = await apiClient.get("/datatables/client_pinpoint_location/$idClient");
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