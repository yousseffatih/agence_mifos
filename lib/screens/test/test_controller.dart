import 'package:get/get.dart';

class TestScreenController extends GetxController {
  TestScreenController();
  var identifiers = <Identifier>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchIdentifiers();
  }

  void fetchIdentifiers() {
    identifiers.assignAll([
      Identifier(id: 28, type: "Passport", description: "This is new one"),
      Identifier(id: 29, type: "Passport", description: "this is for trail"),
      Identifier(id: 33, type: "Passport", description: "Document has been verified"),
      Identifier(id: 34, type: "Omang", description: "Document has been verified"),
      Identifier(id: 35, type: "Drivers License", description: "Document has been verified"),
      Identifier(id: 36, type: "Any Other Id Type", description: "Document has been verified"),
    ]);
  }
}

class Identifier {
  final int id;
  final String type;
  final String description;

  Identifier({required this.id, required this.type, required this.description});
}