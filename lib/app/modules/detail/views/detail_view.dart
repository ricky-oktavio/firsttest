import 'package:firsttest/app/data/model/UserModel.dart';
import 'package:firsttest/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  final Results userDetail = Get.arguments;
  Widget header(String img, String name, String region) {
    return Container(
      margin: EdgeInsets.only(top: defaultMargin),
      child: Column(
        children: [
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(img), fit: BoxFit.cover)),
          ),
          Text(
            name,
            style: primaryTextStyle.copyWith(fontSize: 18, fontWeight: bold),
          ),
          Text(
            region,
            style: primaryTextStyle.copyWith(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor1,
      appBar: AppBar(
        backgroundColor: bgColor1,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(CupertinoIcons.back),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.ellipsis_vertical,
            ),
          )
        ],
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: header(
                  userDetail.picture!.large!,
                  '${userDetail.name!.title}, ${userDetail.name!.first!}, ${userDetail.name!.last}',
                  '${userDetail.location!.state}, ${userDetail.location!.country}'),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 100, vertical: 30),
              child: TabBar(
                indicatorColor: fourtTextColor,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: fourtTextColor,
                unselectedLabelColor: secondaryTextColor,
                labelStyle: TextStyle(
                  fontWeight: bold,
                  fontSize: 18,
                ),
                tabs: [
                  Tab(
                    text: 'Detail',
                  ),
                  Tab(
                    text: 'Call Log',
                  )
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/phonenonebg.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    userDetail.phone!,
                                    style: primaryTextStyle.copyWith(
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    'Number - ${userDetail.location!.country}',
                                    style: secondaryTextStyle.copyWith(
                                      fontSize: 14,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: fourtTextColor,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                CupertinoIcons.phone,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: fourtTextColor,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                CupertinoIcons.chat_bubble,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 2,
                          color: secondaryTextColor,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/gmailnobg.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      userDetail.email!,
                                      style: primaryTextStyle.copyWith(
                                        fontSize: 16,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      'Email Account',
                                      style: secondaryTextStyle.copyWith(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: fourtTextColor,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                CupertinoIcons.mail,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Center(
                      child: Text(
                        'Don\'t have call Log',
                        style: primaryTextStyle.copyWith(
                          fontSize: 24,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
