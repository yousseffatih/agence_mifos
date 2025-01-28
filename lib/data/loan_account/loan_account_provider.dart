import 'package:agence_mifos/data/api_client.dart';

import '../../model/body/submit_charges.body.dart';

class LoanAccountProvider {
  final ApiClient apiClient;
  LoanAccountProvider({ required this.apiClient});

  Future<dynamic> getLoanAccountById(int id) async {
    final response = await apiClient.get("/loans/$id?associations=all&exclude=guarantors,futureSchedule");
    try{
      if(response.statusCode == 200)
      {
        return response.data;
      }
    } catch (e) {
      rethrow;    
    }
  }

  Future<dynamic> getChargesLoan(int id) async {
    final response = await apiClient.get("/loans/$id/charges");
    try{
      if(response.statusCode == 200)
      {
        return response.data;
      }
    } catch (e) {
      rethrow;    
    }
  }

  Future<dynamic> getChargesTemplate(int id) async {
    final response = await apiClient.get("/loans/$id/charges/template");
    try{
      if(response.statusCode == 200)
      {
        return response.data;
      }
    } catch (e) {
      rethrow;    
    }
  }

  Future<dynamic> postSubmitCharge(int id,SubmitChargesBody body) async {
    final response = await apiClient.post("/loans/$id/charges", body.toJson());
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