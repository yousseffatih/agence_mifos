import 'package:agence_mifos/data/api_client.dart';
import 'package:agence_mifos/model/body/add_Loan.body.dart';

class AddLoanProvider {
  final ApiClient apiClient;
  AddLoanProvider({ required this.apiClient});
  
  Future<dynamic> getListLoanProduct() async {
    final response = await apiClient.get("/loanproducts");
    try{
      if(response.statusCode == 200)
      {
        return response.data;
      }
    } catch (e) {
      rethrow;    
    }
  }

  Future<dynamic> getListsAddLoan(int idCLient) async {
    final response = await apiClient.get("/loans/template?templateType=individual&clientId=$idCLient&productId=21");
    try{
      if(response.statusCode == 200)
      {
        return response.data;
      }
    } catch (e) {
      rethrow;    
    }
  }

  Future<dynamic> addLoan(AddLoanBody addLoanBody) async {
    final response = await apiClient.post("/loans",addLoanBody.toJson());
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