import 'package:agence_mifos/data/api_client.dart';

class DocumentSavingaccountProvider {
  final ApiClient apiClient;
  DocumentSavingaccountProvider({required this.apiClient});

  Future<dynamic> getAllDocumentsSavingAccount (int id) async {
    final response = await apiClient.get('/savings/$id/documents');
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