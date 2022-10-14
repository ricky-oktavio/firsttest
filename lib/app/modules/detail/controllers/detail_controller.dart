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
  Future<Results?> detailData(String query) async {
    print('searchFunction Working');
    Uri uri = Uri.parse('https://randomuser.me/api/?name=$query');
    var response = await http.get(uri);
    var json = (jsonDecode(response.body) as Map<String, dynamic>)['results'];
    print(jsonEncode(json[0]));
    var datas = jsonEncode(json[0]);
    updateRecentSearch(datas);
    Results results = Results.fromJson(json[0]);
    if (datas.isNotEmpty) {
      Get.toNamed(Routes.DETAIL, arguments: results);
    }
    return Results.fromJson(json[0]);
  }

  updateRecentSearch(String data) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    var query = data;
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
