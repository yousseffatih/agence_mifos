import 'package:agence_mifos/data/api_client.dart';
import 'package:agence_mifos/model/body/submit_charges.body.dart';

class ChargesClientProvider {
  final ApiClient apiClient;
  ChargesClientProvider({ required this.apiClient});

  Future<dynamic> getAllCharges(int id , int offset , int limit) async {
    final response = await apiClient.get("/clients/1/charges?offset=0&limit=10");
    try{
      if(response.statusCode == 200)
      {
        return response.data;
      }
    } catch (e) {
      rethrow;    
    }
  }

  Future<dynamic> getAllChargesOptionClient(int id) async {
    final response = await apiClient.get("/clients/$id/charges/template");
    try{
      if(response.statusCode == 200)
      {
        return response.data;
      }
    } catch (e) {
      rethrow;    
    }
  }

  Future<dynamic> addChargeClient(int id , SubmitChargesBody body) async {
    final response = await apiClient.post("/clients/$id/charges", body.toJson());
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