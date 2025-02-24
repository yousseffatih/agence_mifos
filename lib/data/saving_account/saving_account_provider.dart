import 'package:agence_mifos/data/api_client.dart';

class SavingAccountProvider {
  final ApiClient apiClient;
  SavingAccountProvider({ required this.apiClient});

  Future<dynamic> getSavingAccount(int id) async {
    print(id);
    final response = await apiClient.get("/savingsaccounts/$id?associations=transactions");
    try{
      if(response.statusCode == 200)
      {
        return response.data;
      }
    } catch (e) {
      rethrow ;
    }
  }
}