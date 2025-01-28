import 'package:agence_mifos/data/api_client.dart';

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
}