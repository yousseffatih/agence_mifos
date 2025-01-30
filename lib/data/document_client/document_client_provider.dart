import 'package:agence_mifos/data/api_client.dart';

class DocumentClientProvider {
  final ApiClient apiClient;
  DocumentClientProvider({ required this.apiClient});

  Future<dynamic> getAllDocumentsLoan (int idLoan) async {
    final response = await apiClient.get('/clients/$idLoan/documents');
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