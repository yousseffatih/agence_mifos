import 'package:agence_mifos/data/api_client.dart';
import 'package:agence_mifos/model/body/add_saving_account.body.dart';

class AddSavingAccountProvider {
  final ApiClient apiClient;
  AddSavingAccountProvider({ required this.apiClient});

  Future<dynamic> getListSavingProducts() async {
    final response = await apiClient.get("/savingsproducts");
    try{
      if(response.statusCode == 200)
      {
        return response.data;
      }
    } catch (e) {
      rethrow;    
    }
  }

  Future<dynamic> getListSavingProductsTemplate() async {
    final response = await apiClient.get("/savingsproducts/template");
    try{
      if(response.statusCode == 200)
      {
        return response.data;
      }
    } catch (e) {
      rethrow;    
    }
  }

  Future<dynamic> addSavingAccount(AddSavingAccounBody body) async {
    final response = await apiClient.post("/savingsproducts", body.toJson());
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