import '../api_client.dart';

class TransactionLoanProvider {
  final ApiClient apiClient;
  TransactionLoanProvider ({required this.apiClient});


   Future<dynamic> getTransactionLoan(int idLoan) async {
    final response = await apiClient.get('/loans/$idLoan?associations=transactions');
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