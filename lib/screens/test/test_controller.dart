import 'package:get/get.dart';

class TestScreenController extends GetxController {
  TestScreenController();
  
  var surveys = <Survey>[
    Survey(title: 'Sample Survey', description: ''),
    Survey(title: 'asfghjk', description: 'This is a test'),
    Survey(title: 'Checking billings', description: 'This is for the same of testing purposes only'),
    Survey(title: 'qwertghjk,', description: 'This is a demo writing'),
    Survey(title: 'Sample Survey', description: ''),
    Survey(title: 'Sample Survey', description: 'mnhgcvbnhjgfc'),
    Survey(title: 'Sample survey', description: ''),
    Survey(title: 'Test Survey', description: ''),
    Survey(title: 'education', description: '222'),
  ].obs;
}

class Survey {
  final String title;
  final String description;
  
  Survey({required this.title, required this.description});
}