import 'package:agence_mifos/repository/search/search_repository.dart';
import 'package:agence_mifos/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/search/search_provider.dart';
import '../../model/search.model.dart';

class SearchControle extends GetxController {
  final SearchRepository searchRepository;
  SearchControle({required this.searchRepository});

  RxString selectedFilter = 'All'.obs;
  final searchController = TextEditingController(text: null);
  RxBool isSearchTextEmpty = true.obs;
  RxBool isChecked = false.obs;
  RxBool isLoading = false.obs;
  RxList<Search> items = <Search>[].obs;

  @override
  void onInit() {
    super.onInit();
    searchController.addListener(() {
      if(searchController.text.isEmpty && searchController.text == null)  items.value = [];
      isSearchTextEmpty.value = searchController.text.isEmpty;
    });
  }

  Future<void> getSearchAll () async  {
    isLoading.value = true;
    items.value = [];
    final result = await searchRepository.getSearchAll(searchController.text, isChecked.value);
    result.fold((failure){
      print('this is search failure : $failure');
    },(search){
      items.value = search;
    });
    isLoading.value = false;
  }

  Future<void> getSearchResource () async  {
    isLoading.value = true;
    items.value = [];
    final result = await searchRepository.getSearchResource(searchController.text,selectedFilter.value, isChecked.value);
    result.fold((failure){
      print('this is search failure : $failure');
    },(search){
      items.value = search;
    });
    isLoading.value = false;
  }

  Future<void> searchBtn() async {
    if(selectedFilter.value == "All")
    {
      await getSearchAll();
    } else {
      await getSearchResource();
    }
  }

  void changeFilter(String filter) async {
    selectedFilter.value = filter;
    await searchBtn();
  }

  void clickCardSearch(String entityType,int entityId) {
    switch(entityType)
    {
      case 'CLIENT':
        Get.toNamed(AppRoute.clientByID, arguments: entityId);
        break;
      case 'GROUP':
        break;
      case 'GROUP':
        break;
    }
  }
}