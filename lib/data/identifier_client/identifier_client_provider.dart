import 'package:agence_mifos/data/api_client.dart';
import 'package:agence_mifos/model/body/add_identifier.body.dart';

class IdentifierClientProvider {
  final ApiClient apiClient;
  IdentifierClientProvider({ required this.apiClient });

  Future<dynamic> getidentifiersClient(int idClient) async {
    final response = await apiClient.get("/clients/$idClient/identifiers");
    try{
      if(response.statusCode == 200)
      {
        return response.data;
      }
    } catch (e) {
      rethrow;    
    }
  } 

  Future<dynamic> getDocumentTypes(int idClient) async {
    final response = await apiClient.get("/clients/$idClient/identifiers/template");
    try{
      if(response.statusCode == 200)
      {
        return response.data;
      }
    } catch (e) {
      rethrow;    
    }
  }

  Future<dynamic> addIdentifier(int idClient, AddIdentifierBody body) async {
    final response = await apiClient.post("/clients/$idClient/identifiers", body.toJson());
    try{
      if(response.statusCode == 200)
      {
        return response.data;
      }
    } catch (e) {
      rethrow;    
    }
  }

  Future<dynamic> deleteIdentifier(int idClient,int idIdentifier) async {
    final response = await apiClient.delete("/clients/$idClient/identifiers/$idIdentifier");
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