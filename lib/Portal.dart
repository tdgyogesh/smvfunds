import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:responsive_framework/responsive_row_column.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:url_launcher/url_launcher.dart';

import 'FetchPortalTeam.dart';
import 'FetchPortalTeamModel.dart';

class Portal extends StatefulWidget {
  const Portal({Key? key}) : super(key: key);

  @override
  _PortalState createState() => _PortalState();
}

class _PortalState extends State<Portal> {
  Map<String, String> footerMap1 = {'country': ' ', 'state': ' ', 'city': ' ', 'area': ' ', 'address1': ' ,', 'address2': ' ', 'addressType': ' '};
  Map<String, String> footerMap2 = {'country': ' ', 'state': '  ', 'city': '  ', 'area': ' ', 'address1': '  ', 'address2': ' ', 'addressType': ' '};

  var buttonStyleSelected = const TextStyle(
    color: Color.fromRGBO(0, 118, 190, 1),
    fontSize: 16,
    fontFamily: "RobotoRegular",
    //fontWeight: FontWeight.bold,
  );

  var buttonStyleUnselected = const TextStyle(
    color: Color.fromRGBO(112, 112, 112, 1),
    fontSize: 16,
    fontFamily: "RobotoRegular",
    //fontWeight: FontWeight.bold,
  );

  bool onPress = false;
  bool buttonShow = false;
  List<String> imgList = [];
  //List<String> highlights = [];
  List<List<String>> highlights = [];
  bool sortAndFilterStatus = false;
  List<Widget> _tiles = [];
  List<String> reorderList = [];
  bool followingContainer = true;
  List<bool> isLikedValue = [];
  bool filterStatus = false;
  int validateButton = 0;
  String sortingValue = 'asc';
  List<int> globalKey = [];
  List<int> dragValue = [];
  List<String> valueOfDrag = [];

  List<GroupByModel3> buttonsGroupBy = [
    GroupByModel3(buttonLable: 'About Us', isOnTp: true, value: 'About Us'),
    // GroupByModel3(buttonLable: 'Mission & Vision', isOnTp: false, value: 'Mission & Vision'),
    GroupByModel3(buttonLable: 'Explore Campaigns', isOnTp: false, value: 'Explore Campaigns'),
  ];

  String? tabs = "About Us";
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  FetchPorttalTeamModel? inputTeamData;

  @override
  void initState() {
    super.initState();
    getTeam();
  }

  void getTeam() async {
    final data = await FetchPortalTeam.fetchPortalTeam();
    if (data != null) {
      setState(() {
        inputTeamData = data;
      });
    }

    print(inputTeamData!.getPortaTeamData.length.toString());
  }

  bool onMorePressed = false;
  List<String> localImage = [
    "assets/Selvan Rajan.png",
    "assets/Leticia-Garcia.png",
    "assets/Venkat Alagarsamy.jpg",
    "assets/Varsha.png",
    "assets/Paul Vezolles.png",
    "assets/Ola Johnson.png",
    "assets/Manan_rawal.png",
    "assets/Angelo Noronha.png",
    "assets/Susan Berman.png",
    "assets/Clare Hammond.png",
    "assets/Jason LaMacchia.png",
    "assets/Bryson Keeton.jpg",
    "assets/Royston King.jpg",
    "assets/Blessing.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
          child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          toolbarHeight: 100,
          leadingWidth: 0,
          backgroundColor: Colors.white,
          actions: <Widget>[
            new Container(),
          ],
          title: Column(
            children: [
              Container(
                height: 100,
                color: Colors.white,
                child: Row(
                  children: [
                    Expanded(flex: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? 1 : 4, child: SizedBox()),
                    Expanded(
                        flex: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? 40 : 20,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? 150 : 240,
                                  // child: Image(image: networkImage("https://storage.googleapis.com/smco-web-static-assets/smv/smvLogoTitle.png")),
                                  child: Image(image: AssetImage("assets/SMVLogoTitle.png")),
                                ),
                              ],
                            ),
                            ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                                ? Container(
                                    height: 30,
                                    width: 30,
                                    child: IconButton(
                                        color: Color.fromRGBO(7, 118, 190, 1), iconSize: 30, onPressed: () => _scaffoldKey.currentState!.openEndDrawer(), icon: Icon(Icons.menu)),
                                  )
                                : Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        fit: FlexFit.loose,
                                        child: Container(
                                          width: 350,
                                          // padding: EdgeInsets.only(left: 280.w, right: 280.w),
                                          alignment: Alignment.centerRight,
                                          height: 40.h,
                                          color: Color.fromRGBO(255, 255, 255, 1),
                                          child: buttonsGroupBy.length > 0
                                              ? ListView.separated(
                                                  physics: NeverScrollableScrollPhysics(),
                                                  scrollDirection: Axis.horizontal,
                                                  separatorBuilder: (BuildContext context, int index) {
                                                    return SizedBox(width: 38.w);
                                                  },
                                                  itemCount: buttonsGroupBy.length,
                                                  itemBuilder: (BuildContext context, int index) {
                                                    return Container(
                                                      padding: buttonsGroupBy[index].isOnTp!
                                                          ? const EdgeInsets.only(
                                                              bottom: 2, // This can be the space you need between text and underline
                                                            )
                                                          : null,
                                                      decoration: buttonsGroupBy[index].isOnTp!
                                                          ? const BoxDecoration(
                                                              border: Border(
                                                                  bottom: BorderSide(
                                                                color: Color.fromRGBO(0, 118, 190, 1),
                                                                width: 2.5, // This would be the width of the underline
                                                              )),
                                                            )
                                                          : null,
                                                      child: TextButton(
                                                          onPressed: () {},
                                                          child: Text(buttonsGroupBy[index].buttonLable!,
                                                              //'$index',
                                                              style: buttonsGroupBy[index].isOnTp! ? buttonStyleSelected : buttonStyleUnselected)),
                                                    );
                                                  })
                                              : Container(),
                                        ),
                                      ),
                                      Container(
                                        height: 40,
                                        width: 95,
                                        decoration: BoxDecoration(
                                          color: const Color.fromRGBO(0, 118, 190, 1.0),
                                          border: Border.all(color: const Color.fromRGBO(0, 118, 190, 1.0)),
                                          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                                        ),
                                        child: TextButton(
                                          onPressed: () {
                                            setState(() {
                                              //Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginAndRegistration(true)));
                                            });
                                          },
                                          child: Text(
                                            "Login",
                                            style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1.0), fontSize: 16, fontWeight: FontWeight.normal),
                                          ),
                                        ),
                                      ),
                                      Container(width: 38),
                                      Container(
                                          height: 40,
                                          width: 95,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(color: const Color.fromRGBO(0, 118, 190, 1.0)),
                                            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                                          ),
                                          child: TextButton(
                                            onPressed: () {
                                              setState(() {
                                                //Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginAndRegistration(false)));
                                              });
                                            },
                                            child: Text('Register', style: TextStyle(color: Color.fromRGBO(0, 118, 190, 1.0), fontSize: 16, fontWeight: FontWeight.normal)),
                                          ))
                                    ],
                                  ),
                          ],
                        )),
                    Expanded(
                      flex: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? 1 : 4,
                      child: SizedBox(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    Wrap(
                      children: [
                        Container(
                          /* height: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                    ? 1130
                    : 700,*/
                          color: Color.fromRGBO(0, 118, 190, 1),
                          child: Row(
                            children: [
                              Expanded(flex: 4, child: SizedBox()),
                              Expanded(
                                  flex: 20,
                                  child: Container(
                                      child: ResponsiveRowColumn(
                                    layout: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? ResponsiveRowColumnType.COLUMN : ResponsiveRowColumnType.ROW,
                                    children: [
                                      ResponsiveRowColumnItem(
                                        child: Container(
                                          width: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? double.infinity : 681.w,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                  width: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? double.infinity : 516.w,
                                                  child: Text(
                                                    "SmartMoney Ventures, LLC - The Company",
                                                    style: TextStyle(color: Colors.white, fontSize: 40, fontFamily: "RobotoBold", fontWeight: FontWeight.bold),
                                                  )),
                                              SizedBox(height: 30),
                                              Container(
                                                  width: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? double.infinity : 681,
                                                  child: Text(
                                                    "We are the bridge between the entrepreneur raising funds for their projects and Investors investing in startups.!",
                                                    style: TextStyle(
                                                      height: 2,
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontFamily: "Roboto",
                                                      fontWeight: FontWeight.normal,
                                                    ),
                                                  )),
                                              Container(
                                                  width: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? double.infinity : 681.w,
                                                  child: Text(
                                                    "We started the company in 2017 with one goal in mind: to bring as many people as possible into an investment platform with tons of opportunities at no fee or low fee. The platform should grow with the customer, not the other way around.!!",
                                                    style: TextStyle(height: 2, color: Colors.white, fontSize: 18, fontFamily: "Roboto", fontWeight: FontWeight.normal),
                                                  )),
                                              SizedBox(height: 30),
                                              Container(
                                                height: 50,
                                                width: 188,
                                                decoration: BoxDecoration(
                                                  color: const Color.fromRGBO(210, 238, 255, 1),
                                                  border: Border.all(color: const Color.fromRGBO(210, 238, 255, 1)),
                                                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                                                ),
                                                child: TextButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      // Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginAndRegistration(true)));
                                                    });
                                                  },
                                                  child: Text(
                                                    "Try Now",
                                                    style: TextStyle(color: Color.fromRGBO(0, 118, 190, 1), fontSize: 18, fontWeight: FontWeight.normal),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      ResponsiveRowColumnItem(child: SizedBox(width: 47)),
                                      ResponsiveRowColumnItem(
                                        child: Container(
                                            height: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? 634 : 634.h,
                                            width: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? 608 : 608.w,
                                            child: Image(
                                                height: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? 634 : 634.h,
                                                width: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? 608 : 608.w,
                                                //fit: BoxFit.cover,
                                                //image: networkImage("https://storage.googleapis.com/smco-web-static-assets/smv/smvPortalEntrepreneurMeetsInvestor.png"),
                                                image: AssetImage("assets/SMVLandingImage.png"))),
                                      )
                                    ],
                                  ))),
                              Expanded(flex: 4, child: SizedBox()),
                            ],
                          ),
                        ),
                      ],
                    ), //Section 1
                    Container(
                      color: Colors.white,
                      child: Row(
                        children: [
                          Expanded(flex: 4, child: SizedBox()),
                          Expanded(
                            flex: 20,
                            child: Container(
                                child: Column(
                              children: [
                                SizedBox(height: 50),
                                Container(
                                    width: double.infinity,
                                    child: Text(
                                      "Mission and Vision",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Color.fromRGBO(0, 118, 190, 1), fontSize: 35, fontFamily: "RobotoBold", fontWeight: FontWeight.bold),
                                    )),
                                SizedBox(height: 30),
                                Container(
                                    child: ResponsiveRowColumn(
                                  layout: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? ResponsiveRowColumnType.COLUMN : ResponsiveRowColumnType.ROW,
                                  rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  columnMainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    ResponsiveRowColumnItem(
                                      child: Wrap(
                                        children: [
                                          Container(
                                              width: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? double.infinity : 610.w,
                                              /*height: 340.h,*/
                                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                                              decoration: BoxDecoration(
                                                color: const Color.fromRGBO(224, 246, 233, 1),
                                                border: Border.all(color: const Color.fromRGBO(224, 246, 233, 1)),
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(50),
                                                  bottomRight: Radius.circular(50),
                                                ),
                                              ),
                                              child: Column(
                                                //mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(height: 24),
                                                  Container(
                                                      child: Text(
                                                    "Mission",
                                                    style: TextStyle(color: Color.fromRGBO(96, 131, 103, 1), fontSize: 30, fontFamily: "RobotoBold", fontWeight: FontWeight.bold),
                                                  )),
                                                  SizedBox(height: 19),
                                                  Container(
                                                      width: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? 520 : 520.w,
                                                      child: Text(
                                                        "To build a compelling investment platform to cater to people with different limitations and people who look for broader investment opportunities. No amount is small when it comes to investment. Provide that opportunities to build a strong financial foundation for everyone of them within their power. The investment platform will provide the tools necessary to achieve it.",
                                                        style: TextStyle(
                                                            height: 1.5,
                                                            color: Color.fromRGBO(112, 112, 112, 1),
                                                            fontSize: 18,
                                                            fontFamily: "Roboto",
                                                            fontWeight: FontWeight.normal),
                                                      )),
                                                  SizedBox(height: 24),
                                                ],
                                              )),
                                        ],
                                      ),
                                    ),
                                    ResponsiveRowColumnItem(child: SizedBox(height: 20)),
                                    ResponsiveRowColumnItem(
                                      child: Wrap(
                                        children: [
                                          Container(
                                              width: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? double.infinity : 610.w,
                                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                                              decoration: BoxDecoration(
                                                color: const Color.fromRGBO(210, 238, 255, 1),
                                                border: Border.all(color: const Color.fromRGBO(210, 238, 255, 1)),
                                                borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(50),
                                                  bottomLeft: Radius.circular(50),
                                                ),
                                              ),
                                              child: Column(
                                                //mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(height: 24),
                                                  Container(
                                                      child: Text(
                                                    "Vision",
                                                    style: TextStyle(color: Color.fromRGBO(0, 118, 190, 1), fontSize: 30, fontFamily: "RobotoBold", fontWeight: FontWeight.bold),
                                                  )),
                                                  SizedBox(height: 19),
                                                  Container(
                                                      width: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? 520 : 520.w,
                                                      child: Text(
                                                        "We hope to build better financial and investment products that would bring many opportunites to our customers. As each one of our products will be built around and customized to each one of our customers using artificial initelligence, we would be able to provide better and more accurate tools at their disposal. Most importantly, we want to become a ‘B Corp’, which will be the epitome of greatest achivement especially in the financial industry.",
                                                        style: TextStyle(
                                                            height: 1.5,
                                                            color: Color.fromRGBO(112, 112, 112, 1),
                                                            fontSize: 18,
                                                            fontFamily: "Roboto",
                                                            fontWeight: FontWeight.normal),
                                                      )),
                                                  SizedBox(height: 24),
                                                ],
                                              )),
                                        ],
                                      ),
                                    )
                                  ],
                                )),
                                SizedBox(height: 30),
                                Container(
                                  height: 50,
                                  width: 188,
                                  decoration: BoxDecoration(
                                    color: const Color.fromRGBO(0, 118, 190, 1),
                                    border: Border.all(color: const Color.fromRGBO(0, 118, 190, 1)),
                                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      setState(() {
                                        // Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginAndRegistration(true)));
                                      });
                                    },
                                    child: Text(
                                      "Try Now",
                                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                          ),
                          Expanded(flex: 4, child: SizedBox()),
                        ],
                      ),
                    ),
                    //Container(color: Colors.white, height: 45),
                    Wrap(children: [
                      Container(
                        //height: 100,
                        color: Colors.white,
                        child: Row(
                          children: [
                            Expanded(flex: 4, child: SizedBox()),
                            Expanded(
                              flex: 20,
                              child: Container(
                                  child: Column(
                                children: [
                                  SizedBox(height: 45),
                                  Container(
                                      width: double.infinity,
                                      child: Text(
                                        "The Team",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Color.fromRGBO(0, 118, 190, 1), fontSize: 35, fontFamily: "RobotoBold", fontWeight: FontWeight.bold),
                                      )),
                                  SizedBox(height: 30),
                                  Container(
                                    child: ResponsiveGridList(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      desiredItemWidth: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? 461 : 321,
                                      children: List.generate(
                                          onMorePressed ? inputTeamData!.getPortaTeamData.length : 8,
                                          (index) => Row(
                                                children: [
                                                  Container(
                                                    width: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? 1363.w : 322,
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          //padding: EdgeInsets.only(left: 35, right: 35),
                                                          height: 441,
                                                          width: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? double.infinity : 316,
                                                          decoration: BoxDecoration(
                                                            boxShadow: const [
                                                              BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.15), blurRadius: 4, spreadRadius: 3),
                                                            ],
                                                            color: Color.fromRGBO(242, 255, 247, 1),
                                                            borderRadius: BorderRadius.only(
                                                              topLeft: Radius.circular(50),
                                                              bottomRight: Radius.circular(50),
                                                            ),
                                                          ),
                                                          child: Column(
                                                            children: [
                                                              SizedBox(
                                                                height: 25.h,
                                                              ),
                                                              Container(
                                                                child: Center(
                                                                  child: Container(
                                                                    height: 250,
                                                                    width: 250,
                                                                    child: CircleAvatar(
                                                                      //backgroundImage: networkImage(inputTeamData!.getPortaTeamData[index].memberImageFileName.toString()),
                                                                      backgroundImage: AssetImage(localImage[index].toString()),
                                                                      radius: 15,
                                                                      backgroundColor: Colors.white,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 22.h,
                                                              ),
                                                              Text(
                                                                inputTeamData!.getPortaTeamData[index].memberName.toString(),
                                                                style: TextStyle(
                                                                  color: Color.fromRGBO(44, 44, 44, 1),
                                                                  fontSize: 22,
                                                                  fontWeight: FontWeight.bold,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 8.h,
                                                              ),
                                                              Text(
                                                                inputTeamData!.getPortaTeamData[index].memberDesignation.toString(),
                                                                style: TextStyle(
                                                                  color: Color.fromRGBO(112, 112, 112, 1),
                                                                  fontSize: 18,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 20.h,
                                                              ),
                                                              Container(
                                                                  padding: EdgeInsets.only(left: 35, right: 35),
                                                                  child: Row(
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    children: [
                                                                      inputTeamData!.getPortaTeamData[index].blogUrl.toString().trim() != "" &&
                                                                              inputTeamData!.getPortaTeamData[index].blogUrl.toString().trim() != "null"
                                                                          ? MouseRegion(
                                                                              cursor: SystemMouseCursors.click,
                                                                              child: GestureDetector(
                                                                                onTap: () {
                                                                                  launchURL(inputTeamData!.getPortaTeamData[index].blogUrl.toString());
                                                                                },
                                                                                child: Container(
                                                                                    height: 30,
                                                                                    width: 30,
                                                                                    child: Image(
                                                                                      //fit: BoxFit.cover,
                                                                                      // image: networkImage("https://storage.googleapis.com/smco-web-static-assets/smv/smvPortalBlog.png"),
                                                                                      image: AssetImage("assets/TeamBlog.png"),
                                                                                    )),
                                                                              ),
                                                                            )
                                                                          : Container(),
                                                                      inputTeamData!.getPortaTeamData[index].blogUrl.toString().trim() != "" &&
                                                                              inputTeamData!.getPortaTeamData[index].blogUrl.toString().trim() != "null"
                                                                          ? Container(width: 10)
                                                                          : Container(),
                                                                      inputTeamData!.getPortaTeamData[index].linkedinUrl.toString() != "null" &&
                                                                              inputTeamData!.getPortaTeamData[index].linkedinUrl.toString().trim() != ""
                                                                          ? MouseRegion(
                                                                              cursor: SystemMouseCursors.click,
                                                                              child: GestureDetector(
                                                                                onTap: () {
                                                                                  launchURL(inputTeamData!.getPortaTeamData[index].linkedinUrl.toString());
                                                                                },
                                                                                child: Container(
                                                                                    height: 30,
                                                                                    width: 30,
                                                                                    child: Image(
                                                                                      //fit: BoxFit.cover,
                                                                                      //image: networkImage("https://storage.googleapis.com/smco-web-static-assets/smv/smvPortalLinkedIn.png"),
                                                                                      image: AssetImage("assets/TeamLinkedIn.png"),
                                                                                    )),
                                                                              ),
                                                                            )
                                                                          : Container(),
                                                                      inputTeamData!.getPortaTeamData[index].linkedinUrl.toString().trim() != "" &&
                                                                              inputTeamData!.getPortaTeamData[index].linkedinUrl.toString().trim() != "null"
                                                                          ? Container(width: 10)
                                                                          : Container(),
                                                                      inputTeamData!.getPortaTeamData[index].twitterUrl.toString() != "null" &&
                                                                              inputTeamData!.getPortaTeamData[index].twitterUrl.toString().trim() != ""
                                                                          ? MouseRegion(
                                                                              cursor: SystemMouseCursors.click,
                                                                              child: GestureDetector(
                                                                                onTap: () {
                                                                                  launchURL(inputTeamData!.getPortaTeamData[index].twitterUrl.toString());
                                                                                },
                                                                                child: Container(
                                                                                    height: 30,
                                                                                    width: 30,
                                                                                    child: Image(
                                                                                      //fit: BoxFit.cover,
                                                                                      //image: networkImage("https://storage.googleapis.com/smco-web-static-assets/smv/smvPortalTwitter.png"),
                                                                                      image: AssetImage("assets/TeamTwitter.png"),
                                                                                    )),
                                                                              ),
                                                                            )
                                                                          : Container(),
                                                                      inputTeamData!.getPortaTeamData[index].twitterUrl.toString().trim() != "" &&
                                                                              inputTeamData!.getPortaTeamData[index].twitterUrl.toString().trim() != "null"
                                                                          ? Container(width: 10)
                                                                          : Container(),
                                                                      inputTeamData!.getPortaTeamData[index].facebookUrl.toString() != "null" &&
                                                                              inputTeamData!.getPortaTeamData[index].facebookUrl.toString().trim() != ""
                                                                          ? MouseRegion(
                                                                              cursor: SystemMouseCursors.click,
                                                                              child: GestureDetector(
                                                                                onTap: () {
                                                                                  launchURL(inputTeamData!.getPortaTeamData[index].facebookUrl.toString());
                                                                                },
                                                                                child: Container(
                                                                                    height: 30,
                                                                                    width: 30,
                                                                                    child: Image(
                                                                                      //fit: BoxFit.cover,
                                                                                      //image: networkImage("https://storage.googleapis.com/smco-web-static-assets/smv/smvPortalFacebook.png"),
                                                                                      image: AssetImage("assets/TeamFacebook.png"),
                                                                                    )),
                                                                              ),
                                                                            )
                                                                          : Container(),
                                                                      inputTeamData!.getPortaTeamData[index].facebookUrl.toString().trim() != "" &&
                                                                              inputTeamData!.getPortaTeamData[index].facebookUrl.toString().trim() != "null"
                                                                          ? Container(width: 10)
                                                                          : Container(),
                                                                      Container(
                                                                        height: 30,
                                                                        width: 85,
                                                                        decoration: BoxDecoration(
                                                                          color: Colors.transparent,
                                                                          border: Border.all(color: const Color.fromRGBO(0, 118, 190, 1.0)),
                                                                          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                                                                        ),
                                                                        child: TextButton(
                                                                          onPressed: () {
                                                                            /*popUpDetail(
                                                                      inputTeamData!.getPortaTeamData[index].memberImageFileName.toString(),
                                                                      context,
                                                                      inputTeamData!.getPortaTeamData[index].memberName.toString(),
                                                                      inputTeamData!.getPortaTeamData[index].memberDesignation.toString(),
                                                                      inputTeamData!.getPortaTeamData[index].aboutMemberText.toString(),
                                                                      inputTeamData!.getPortaTeamData[index].facebookUrl.toString(),
                                                                      inputTeamData!.getPortaTeamData[index].blogUrl.toString(),
                                                                      inputTeamData!.getPortaTeamData[index].linkedinUrl.toString(),
                                                                      inputTeamData!.getPortaTeamData[index].twitterUrl.toString());*/

                                                                            /* popUpDetail(
                                                                                localImage[index].toString(),
                                                                                context,
                                                                                inputTeamData!.getPortaTeamData[index].memberName.toString(),
                                                                                inputTeamData!.getPortaTeamData[index].memberDesignation.toString(),
                                                                                inputTeamData!.getPortaTeamData[index].aboutMemberText.toString(),
                                                                                inputTeamData!.getPortaTeamData[index].facebookUrl.toString(),
                                                                                inputTeamData!.getPortaTeamData[index].blogUrl.toString(),
                                                                                inputTeamData!.getPortaTeamData[index].linkedinUrl.toString(),
                                                                                inputTeamData!.getPortaTeamData[index].twitterUrl.toString());*/
                                                                          },
                                                                          child: Text(
                                                                            "View Bio",
                                                                            style: TextStyle(color: Color.fromRGBO(0, 118, 190, 1.0), fontSize: 16, fontWeight: FontWeight.normal),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  )),
                                                              SizedBox(
                                                                height: 25.h,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(height: 25.h)
                                                      ],
                                                    ),
                                                    // height: 750.h,
                                                  ),
                                                ],
                                              )),
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 206,
                                    decoration: BoxDecoration(
                                      color: const Color.fromRGBO(0, 118, 190, 1),
                                      border: Border.all(color: const Color.fromRGBO(0, 118, 190, 1)),
                                      borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                                    ),
                                    child: TextButton(
                                      onPressed: () {
                                        setState(() {
                                          onMorePressed = !onMorePressed;
                                        });
                                      },
                                      child: Text(
                                        onMorePressed ? "Less" : "See more",
                                        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                            ),
                            Expanded(flex: 4, child: SizedBox()),
                          ],
                        ),
                      )
                    ]),
                    Container(color: Colors.white, height: 30),
                    Container(
                      color: Color.fromRGBO(235, 248, 255, 1),
                      child: Column(
                        children: [
                          Wrap(
                            children: [
                              Container(
                                //height: 450.h,
                                child: Row(
                                  children: [
                                    Expanded(flex: 4, child: SizedBox()),
                                    Expanded(
                                      flex: 20,
                                      child: Container(
                                          //height: 435.h,
                                          child: ResponsiveRowColumn(
                                        layout: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? ResponsiveRowColumnType.COLUMN : ResponsiveRowColumnType.ROW,
                                        rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          ResponsiveRowColumnItem(
                                            child: Container(
                                                height: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? 435 : 435.h,
                                                width: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? 701 : 701.w,
                                                child: Image(
                                                  height: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? 435 : 435.h,
                                                  width: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? 701 : 701.w,
                                                  //fit: BoxFit.cover,
                                                  //image: networkImage("https://storage.googleapis.com/smco-web-static-assets/smv/smvPortalInvesterTree.png"),
                                                  image: AssetImage("assets/SMVStartInvestment.png"),
                                                )),
                                          ),
                                          ResponsiveRowColumnItem(
                                              child: Container(
                                                  height: 435.h,
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                          width: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? double.infinity : 378.w,
                                                          child: Text("How SmartMoney Ventures help Investors",
                                                              style: TextStyle(fontSize: 30, color: Color.fromRGBO(0, 118, 190, 1), fontWeight: FontWeight.bold))),
                                                      SizedBox(height: 30),
                                                      Container(
                                                          width: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? double.infinity : 582.w,
                                                          child: Column(
                                                            //mainAxisAlignment: MainAxisAlignment.center,
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Container(
                                                                  //height: 26,
                                                                  child: Row(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Container(
                                                                    //color: Colors.white,
                                                                    child: Text(
                                                                      "•",
                                                                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color.fromRGBO(0, 118, 190, 1)),
                                                                    ),
                                                                  ),
                                                                  SizedBox(width: 12),
                                                                  Container(
                                                                      padding: EdgeInsets.only(top: 8),
                                                                      child: Text("Register with us.", style: TextStyle(fontSize: 20, color: Color.fromRGBO(44, 44, 44, 1))))
                                                                ],
                                                              )),
                                                              Container(
                                                                  //height: 26,
                                                                  child: Row(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                    "•",
                                                                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color.fromRGBO(0, 118, 190, 1)),
                                                                  ),
                                                                  SizedBox(width: 12),
                                                                  Container(
                                                                      padding: EdgeInsets.only(top: 8),
                                                                      child: Text("Start Investing in your favorite campaigns.",
                                                                          style: TextStyle(fontSize: 20, color: Color.fromRGBO(44, 44, 44, 1))))
                                                                ],
                                                              )),
                                                              Container(
                                                                  //height: 26,
                                                                  child: Row(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                    "•",
                                                                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color.fromRGBO(0, 118, 190, 1)),
                                                                  ),
                                                                  SizedBox(width: 12),
                                                                  Container(
                                                                      padding: EdgeInsets.only(top: 8),
                                                                      child: Text("Be a shareholder of a startup company.",
                                                                          style: TextStyle(fontSize: 20, color: Color.fromRGBO(44, 44, 44, 1))))
                                                                ],
                                                              )),
                                                              Container(
                                                                  //height: 26,
                                                                  child: Row(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                    "•",
                                                                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color.fromRGBO(0, 118, 190, 1)),
                                                                  ),
                                                                  SizedBox(width: 12),
                                                                  Container(
                                                                      padding: EdgeInsets.only(top: 8),
                                                                      child: Text("Receive higher returns.", style: TextStyle(fontSize: 20, color: Color.fromRGBO(44, 44, 44, 1))))
                                                                ],
                                                              )),
                                                            ],
                                                          )),
                                                      SizedBox(height: 30),
                                                      Container(
                                                        height: 50,
                                                        width: 206,
                                                        decoration: BoxDecoration(
                                                          color: const Color.fromRGBO(0, 118, 190, 1),
                                                          border: Border.all(color: const Color.fromRGBO(0, 118, 190, 1)),
                                                          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                                                        ),
                                                        child: TextButton(
                                                          onPressed: () {
                                                            setState(() {
                                                              //Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginAndRegistration(true)));
                                                            });
                                                          },
                                                          child: Text(
                                                            "Invest",
                                                            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.normal),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ))),
                                        ],
                                      )),
                                    ),
                                    Expanded(flex: 4, child: SizedBox()),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(height: 16),
                          Container(
                            //height: 390.h,
                            child: Row(
                              children: [
                                Expanded(flex: 4, child: SizedBox()),
                                Expanded(
                                    flex: 20,
                                    child: Container(
                                        child: ResponsiveRowColumn(
                                      layout: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? ResponsiveRowColumnType.COLUMN : ResponsiveRowColumnType.ROW,
                                      rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        ResponsiveRowColumnItem(
                                          child: Container(
                                              child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? double.infinity : 378.w,
                                                child: Text(
                                                  "How SmartMoney Ventures help Fundraisers",
                                                  style: TextStyle(fontSize: 30, color: Color.fromRGBO(0, 118, 190, 1), fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                              SizedBox(height: 30),
                                              Container(
                                                  width: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? double.infinity : 582.w,
                                                  child: Column(
                                                    //mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                          //height: 26,
                                                          child: Row(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Container(
                                                            //color: Colors.white,
                                                            child: Text(
                                                              "•",
                                                              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color.fromRGBO(0, 118, 190, 1)),
                                                            ),
                                                          ),
                                                          SizedBox(width: 12),
                                                          Container(
                                                              padding: EdgeInsets.only(top: 8),
                                                              child: Text("Register with us.", style: TextStyle(fontSize: 20, color: Color.fromRGBO(44, 44, 44, 1))))
                                                        ],
                                                      )),
                                                      Container(
                                                          //height: 26,
                                                          child: Row(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            "•",
                                                            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color.fromRGBO(0, 118, 190, 1)),
                                                          ),
                                                          SizedBox(width: 12),
                                                          Container(
                                                              padding: EdgeInsets.only(top: 8),
                                                              child: Text("Start your campaign with your project idea.",
                                                                  style: TextStyle(fontSize: 20, color: Color.fromRGBO(44, 44, 44, 1))))
                                                        ],
                                                      )),
                                                      Container(
                                                          //height: 26,
                                                          child: Row(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            "•",
                                                            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color.fromRGBO(0, 118, 190, 1)),
                                                          ),
                                                          SizedBox(width: 12),
                                                          Container(
                                                              padding: EdgeInsets.only(top: 8),
                                                              child: Text("Get funded by our community investors.",
                                                                  style: TextStyle(fontSize: 20, color: Color.fromRGBO(44, 44, 44, 1))))
                                                        ],
                                                      )),
                                                      Container(
                                                          //height: 26,
                                                          child: Row(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            "•",
                                                            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color.fromRGBO(0, 118, 190, 1)),
                                                          ),
                                                          SizedBox(width: 12),
                                                          Container(
                                                              padding: EdgeInsets.only(top: 8),
                                                              child: Text("Achieve your Goals.", style: TextStyle(fontSize: 20, color: Color.fromRGBO(44, 44, 44, 1))))
                                                        ],
                                                      )),
                                                    ],
                                                  )),
                                              SizedBox(height: 28),
                                              Container(
                                                height: 50,
                                                width: 206,
                                                decoration: BoxDecoration(
                                                  color: const Color.fromRGBO(0, 118, 190, 1),
                                                  border: Border.all(color: const Color.fromRGBO(0, 118, 190, 1)),
                                                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                                                ),
                                                child: TextButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      //Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginAndRegistration(true)));
                                                    });
                                                  },
                                                  child: Text(
                                                    "Raise Your Fund",
                                                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.normal),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )),
                                        ),
                                        ResponsiveRowColumnItem(
                                          child: SizedBox(width: 47),
                                        ),
                                        ResponsiveRowColumnItem(
                                            child: Container(
                                                height: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? 634 : 634.h,
                                                width: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? 608 : 608.w,
                                                child: Image(
                                                  height: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? 634 : 634.h,
                                                  width: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? 608 : 608.w,
                                                  //fit: BoxFit.cover,
                                                  //image: networkImage("https://storage.googleapis.com/smco-web-static-assets/smv/smvPortalEntrepreneurIdea.png"),
                                                  image: AssetImage("assets/SMVInvestmentIdea.png"),
                                                )))
                                      ],
                                    ))),
                                Expanded(flex: 4, child: SizedBox()),
                              ],
                            ),
                          ),
                          Container(height: 20)
                        ],
                      ),
                    ),

                    Container(
                      color: Color.fromRGBO(242, 255, 247, 1),
                      child: Column(
                        children: [
                          Container(height: 20),
                          Row(children: [
                            Expanded(flex: 4, child: SizedBox()),
                            Expanded(
                              flex: 20,
                              child: Container(
                                child: Column(
                                  children: [
                                    Container(
                                      child: Text(
                                        "How SmartMoney Ventures work",
                                        style: TextStyle(
                                          color: Color.fromRGBO(97, 129, 103, 1),
                                          fontSize: 35,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: ResponsiveRowColumn(
                                        layout: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? ResponsiveRowColumnType.COLUMN : ResponsiveRowColumnType.ROW,
                                        rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          ResponsiveRowColumnItem(
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(top: 101),
                                                  child: Container(
                                                    height: 380.h,
                                                    width: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? double.infinity : 335.w,
                                                    decoration: BoxDecoration(
                                                      color: Color.fromRGBO(170, 221, 180, 1),
                                                      borderRadius: BorderRadius.only(
                                                        topLeft: Radius.circular(150),
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Container(
                                                        height: 240.h,
                                                        width: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? 240 : 240.w,
                                                        child: CircleAvatar(
                                                          //child: Icon(Icons.person),
                                                          radius: 18,
                                                          //backgroundImage: networkImage("https://storage.googleapis.com/smco-web-static-assets/smv/smvPortalStartupAssetClass.png"),
                                                          backgroundImage: AssetImage("assets/SMVAssetImage.png"),
                                                          backgroundColor: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 18),
                                                Container(
                                                  child: Text(
                                                    "Access the startup asset class",
                                                    style: TextStyle(
                                                      color: Color.fromRGBO(97, 129, 103, 1),
                                                      fontSize: 30,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          ResponsiveRowColumnItem(
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 59),
                                                  child: Container(
                                                    height: 420.h,
                                                    width: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? double.infinity : 335.w,
                                                    decoration: BoxDecoration(
                                                      color: Color.fromRGBO(155, 196, 162, 1),
                                                      borderRadius: BorderRadius.only(
                                                        topLeft: Radius.circular(150),
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Container(
                                                        height: 240.h,
                                                        width: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? 240 : 240.w,
                                                        child: CircleAvatar(
                                                          //backgroundImage: networkImage("https://storage.googleapis.com/smco-web-static-assets/smv/smvPortalInvestInStartup.png"),
                                                          backgroundImage: AssetImage("assets/SMVInvestmentGrowth.png"),
                                                          radius: 18,
                                                          backgroundColor: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 18),
                                                Container(
                                                  child: Text(
                                                    "Invest in Startup Companies",
                                                    style: TextStyle(
                                                      color: Color.fromRGBO(97, 129, 103, 1),
                                                      fontSize: 30,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          ResponsiveRowColumnItem(
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 19),
                                                  child: Container(
                                                    height: 460.h,
                                                    width: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? double.infinity : 335.w,
                                                    decoration: BoxDecoration(
                                                      color: Color.fromRGBO(97, 129, 103, 1),
                                                      borderRadius: BorderRadius.only(
                                                        topLeft: Radius.circular(150),
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Container(
                                                        height: 240.h,
                                                        width: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? 240 : 240.w,
                                                        child: CircleAvatar(
                                                          //backgroundImage: networkImage("https://storage.googleapis.com/smco-web-static-assets/smv/smvPortalDiversify.png"),
                                                          backgroundImage: AssetImage("assets/SMVDiversify.png"),
                                                          radius: 18,
                                                          backgroundColor: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 18),
                                                Container(
                                                  child: Text(
                                                    "Diversify like a VC",
                                                    style: TextStyle(
                                                      color: Color.fromRGBO(97, 129, 103, 1),
                                                      fontSize: 30,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(flex: 4, child: SizedBox()),
                          ]),
                          Container(height: 47),
                          Container(
                            height: 50,
                            width: 188,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(97, 129, 103, 1),
                              border: Border.all(color: const Color.fromRGBO(97, 129, 103, 1)),
                              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                            ),
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  // Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginAndRegistration(true)));
                                });
                              },
                              child: Text(
                                "Try Now",
                                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.normal),
                              ),
                            ),
                          ),
                          Container(height: 40),
                        ],
                      ),
                    ),

                    //Section2
                  ],
                ),
              ),
              Container(
                child: portalFooter(footerMap1, footerMap2),
              )
            ],
          ),
        ),
      )),
    );
  }

  Widget portalFooter(companyAddresssHQ, companyAddresssRegister) {
    return Container(
      // height: 230.h,
      width: double.infinity,
      decoration: BoxDecoration(color: Color.fromRGBO(57, 53, 50, 1)),
      child: Row(
        children: [
          Expanded(flex: 4, child: SizedBox()),
          Expanded(
            flex: 20,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 28, bottom: 10),
                  child: ResponsiveRowColumn(
                    layout: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? ResponsiveRowColumnType.COLUMN : ResponsiveRowColumnType.ROW,
                    rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
                    rowCrossAxisAlignment: CrossAxisAlignment.start,
                    columnCrossAxisAlignment: CrossAxisAlignment.start,
                    columnMainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ResponsiveRowColumnItem(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                child: const Text(
                              "LEGAL",
                              style: TextStyle(color: Color.fromRGBO(204, 204, 204, 1), fontFamily: "Roboto", fontSize: 16, decoration: TextDecoration.none),
                            )),
                            SizedBox(height: 10),
                            Container(
                                child: const Text("Terms and Conditions",
                                    style: TextStyle(color: Colors.white, fontFamily: "Roboto", fontSize: 16, decoration: TextDecoration.none, fontWeight: FontWeight.bold))),
                            SizedBox(height: 10),
                            Container(
                                child: const Text("Privacy Policy",
                                    style: TextStyle(color: Colors.white, fontFamily: "Roboto", fontSize: 16, decoration: TextDecoration.none, fontWeight: FontWeight.bold))),
                            SizedBox(height: 10),
                            Container(
                                child: const Text("Security",
                                    style: TextStyle(color: Colors.white, fontFamily: "Roboto", fontSize: 16, decoration: TextDecoration.none, fontWeight: FontWeight.bold))),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                      ResponsiveRowColumnItem(
                        child: SizedBox(
                          height: 10,
                          width: 10,
                        ),
                      ),
                      ResponsiveRowColumnItem(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                child: const Text(
                              "ABOUT US",
                              style: TextStyle(color: Color.fromRGBO(204, 204, 204, 1), fontFamily: "Roboto", fontSize: 16, decoration: TextDecoration.none),
                            )),
                            const SizedBox(height: 10),
                            Container(
                              child: const Text("Company",
                                  style: TextStyle(color: Colors.white, fontFamily: "Roboto", fontSize: 16, decoration: TextDecoration.none, fontWeight: FontWeight.bold)),
                            ),
                            const SizedBox(height: 10),
                            Container(
                                child: const Text("Mission and Vision",
                                    style: TextStyle(color: Colors.white, fontFamily: "Roboto", fontSize: 16, decoration: TextDecoration.none, fontWeight: FontWeight.bold))),
                            const SizedBox(height: 10),
                            Container(
                                child: const Text("The Team",
                                    style: TextStyle(color: Colors.white, fontFamily: "Roboto", fontSize: 16, decoration: TextDecoration.none, fontWeight: FontWeight.bold))),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                      ResponsiveRowColumnItem(
                        child: SizedBox(
                          height: 10,
                          width: 10,
                        ),
                      ),
                      ResponsiveRowColumnItem(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                child: const Text(
                              "REACH US",
                              style: TextStyle(color: Color.fromRGBO(204, 204, 204, 1), fontFamily: "Roboto", fontSize: 16, decoration: TextDecoration.none),
                            )),
                            const SizedBox(height: 10),
                            Container(
                                child: const Text("Support: support@smartmoney.co",
                                    style: TextStyle(color: Colors.white, fontFamily: "Roboto", fontSize: 16, decoration: TextDecoration.none, fontWeight: FontWeight.bold))),
                            const SizedBox(height: 10),
                            Container(
                                child: const Text("Feedback: feedback@smartmoney.co",
                                    style: TextStyle(color: Colors.white, fontFamily: "Roboto", fontSize: 16, decoration: TextDecoration.none, fontWeight: FontWeight.bold))),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                      ResponsiveRowColumnItem(
                        child: SizedBox(
                          height: 10,
                          width: 10,
                        ),
                      ),
                      ResponsiveRowColumnItem(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                child: const Text(
                              "FOLLOW SM VENTURES ON SOCIAL",
                              style: TextStyle(color: Color.fromRGBO(204, 204, 204, 1), fontFamily: "Roboto", fontSize: 16, decoration: TextDecoration.none),
                            )),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    //getShareHistory('https://storage.googleapis.com/smco-web-static-assets/smco/jsp/dashboard/v4/docs/assets/img/Fb-1%402x.png');
                                  },
                                  //child: circularImage("https://storage.googleapis.com/smco-web-static-assets/smv/Fb-1.png"),
                                  child: circularImage("assets/Fb.png"),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                GestureDetector(
                                    onTap: () {
                                      // getShareHistory('https://twitter.com/messages/compose?text=hi');
                                    },
                                    //child: circularImage("https://storage.googleapis.com/smco-web-static-assets/smv/Twitter-1.png")
                                    child: circularImage("assets/Twitter.png")),
                                const SizedBox(
                                  width: 15,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // print("uri" + uri);
                                    //getShareHistory('https://www.linkedin.com/');
                                  },
                                  //child: circularImage("https://storage.googleapis.com/smco-web-static-assets/smv/Linked-1.png"),
                                  child: circularImage("assets/LinkedIn.png"),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    //getShareHistory('https://www.linkedin.com/');
                                  },
                                  //child: circularImage("https://storage.googleapis.com/smco-web-static-assets/smv/Insta-1.png"),
                                  child: circularImage("assets/Insta.png"),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                //circularImage("https://storage.googleapis.com/smco-web-static-assets/smv/youtube.png"),
                                circularImage("assets/Youtube-1.png"),
                              ],
                            ),
                            //const SizedBox(height: 10),
                          ],
                        ),
                      ),
                      // ResponsiveRowColumnItem(
                      //   child: SizedBox(
                      //     height: 10,
                      //     width: 10,
                      //   ),
                      // ),
                    ],
                  ),
                ),
                //  SizedBox(height: 5),
                Container(
                    child: Divider(
                  color: Colors.white,
                  thickness: 0.1,
                )),
                SizedBox(height: 8),
                Container(
                    child: Text("Copyright (c) 2022 - Now. SmartMoney Ventures, LLC. All rights reserved.",
                        style: TextStyle(color: Colors.white, fontFamily: "Roboto", fontSize: 14, decoration: TextDecoration.none, fontWeight: FontWeight.bold))),
                SizedBox(height: 8),
              ],
            ),
          ),
          Expanded(flex: 4, child: SizedBox()),
        ],
      ),
    );
  }

  launchURL(urlinput) async {
    var url = urlinput;
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), webOnlyWindowName: "_blank");
    }
  }

  Widget circularImage(src) {
    return CircleAvatar(
      backgroundColor: Colors.black12,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        //child: Image(image: networkImage(src)),
        child: Image(image: AssetImage(src)),
      ),
    );
  }
}

class GroupByModel3 {
  String? buttonLable;
  bool? isOnTp;
  String? value;

  GroupByModel3({required this.buttonLable, required this.isOnTp, required this.value});
}
