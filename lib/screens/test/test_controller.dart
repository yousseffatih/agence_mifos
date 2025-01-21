import 'package:get/get.dart';

class TestScreenController extends GetxController {
  // List to track the open/close state of each ExpansionTile
  final RxList<bool> isOpen = <bool>[].obs;

  void toggleExpansion(int index, bool isExpanded) {
    isOpen[index] = isExpanded;
  }

  @override
  void initializeState(int itemCount) {
    if (isOpen.isEmpty) {
      isOpen.addAll(List.generate(itemCount, (_) => false));
    }
  }
}