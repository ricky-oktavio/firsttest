import 'dart:convert';

import 'package:firsttest/app/data/model/UserModel.dart';
import 'package:firsttest/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DetailController extends GetxController {
  List<Results> dataSearch = [];
  var searchData = ''.obs;
  var recentSeacrh = List<String>.empty().obs;

  final count = 0.obs;
  @override
  void onInit() {
    getRecentQuery();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
  Future<List<Results>?> detailData(String query) async {
    print('searchFunction Working');
    Uri uri = Uri.parse('https://randomuser.me/api/?name=$query');
    var response = await http.get(uri);
    List map = (jsonDecode(response.body) as Map<String, dynamic>)['results'];
    print(map);
    print(map[0]['name']['first']);
    print(map[0]['picture']['large']);
    searchData.value =
        '${map[0]['name']['first']},${map[0]['picture']['medium']}';
    updateRecentSearch();
    if (dataSearch.isNotEmpty) {
      Get.toNamed(Routes.DETAIL, arguments: map[0]['name']['first']);
    }
    dataSearch = map.map((e) => Results.fromJson(e)).toList();
    print(dataSearch);
    return dataSearch;
  }

  updateRecentSearch() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    var query = searchData.value;
    if (recentSeacrh.length == 5) {
      recentSeacrh.removeLast();
    }
    if (recentSeacrh.every((element) => element != query)) {
      recentSeacrh.insert(0, query);
    }
    preferences.setStringList('dataRecent', recentSeacrh);
  }

  getRecentQuery() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    recentSeacrh.value = preferences.getStringList('dataRecent') ?? [];
    print(recentSeacrh);
  }
}
