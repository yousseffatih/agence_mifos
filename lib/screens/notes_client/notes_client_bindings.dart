import 'package:agence_mifos/data/api_client.dart';
import 'package:agence_mifos/data/notes_client/notes_client_provider.dart';
import 'package:agence_mifos/repository/notes_client/notes_client_repository.dart';
import 'package:agence_mifos/screens/notes_client/notes_client_controller.dart';
import 'package:get/get.dart';

class NotesClientBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiClient());
    Get.lazyPut(() => NotesClientProvider(apiClient: Get.find<ApiClient>()));
    Get.lazyPut(() => NotesClientRepository(notesClientProvider: Get.find<NotesClientProvider>()));
    Get.lazyPut(() => NotesClientController(notesClientRepository: Get.find<NotesClientRepository>()));
  }
  
}