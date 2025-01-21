import 'package:agence_mifos/data/api_client.dart';

class RepayementSchLoanProvider {
  final ApiClient apiClient;
  RepayementSchLoanProvider({ required this.apiClient});

  Future<dynamic> getRepaementSchLoan(int id) async {
    final response = await apiClient.get("/loans/$id?associations=repaymentSchedule");
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