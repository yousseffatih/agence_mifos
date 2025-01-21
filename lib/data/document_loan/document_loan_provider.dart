import 'package:agence_mifos/data/api_client.dart';

class DocumentLoanProvider {
  final ApiClient apiClient;
  DocumentLoanProvider({required this.apiClient});

  Future<dynamic> getAllDocumentsLoan (int idLoan) async {
    final response = await apiClient.get('/loans/$idLoan/documents');
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