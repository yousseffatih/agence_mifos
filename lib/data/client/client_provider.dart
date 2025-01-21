import 'package:agence_mifos/data/api_client.dart';

class ClientProvider {
  ApiClient apiClient;

  ClientProvider(
    {
      required this.apiClient
    }
  );

  Future<dynamic> getAllClient() async {
    final response = await apiClient.get("/clients?paged=true&offset=0&limit=200");
    try{
      if(response.statusCode == 200)
      {
        return response.data;
      }
    } catch (e) {
      rethrow;    
    }
  }

  Future<dynamic> getClientById(int id) async {
    final response = await apiClient.get('/clients/$id');
    try{
      if(response.statusCode == 200)
      {
        return response.data;
      }
    } catch (e) {
      rethrow;    
    }
  }

  Future<dynamic> getLoanAccountForClient(int id) async {
    final response = await apiClient.get('/clients/$id/accounts');
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