import 'package:agence_mifos/repository/notes_client/notes_client_repository.dart';
import 'package:get/get.dart';

class NotesClientController extends GetxController {
  final NotesClientRepository notesClientRepository;
  NotesClientController({ required this.notesClientRepository });
}