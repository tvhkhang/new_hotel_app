import 'package:flutter/material.dart';
import 'package:new_hotel_app/ui/constants/colors.dart';
import 'package:new_hotel_app/ui/constants/infohotel.dart';
import 'package:new_hotel_app/ui/constants/styles.dart';
import 'package:new_hotel_app/ui/widgets/cards.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  List<InfoHotel> listHotel = <InfoHotel>[
    InfoHotel('assets/images/1x/hotelpic1.png', 'Leslie Alexander', 4,
        '1901 Thornridge Cir. Shiloh, Hawaii 81063'),
    InfoHotel('assets/images/1x/hotelpic2.png', 'Jenny Wilson', 3,
        '4517 Washington Ave. Manchester, Kentucky...'),
    InfoHotel('assets/images/1x/hotelpic3.png', 'Leslie Alexander', 2,
        '1901 Thornridge Cir. Shiloh, Hawaii 81063'),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        backgroundColor: ColorApp.backgroundApp,
        elevation: 0.0,
        title: Container(
          padding:
              EdgeInsets.only(left: size.width * 0.07, top: size.height * 0.01),
          child: RichText(
            text: TextSpan(
                text: 'Hello Linh,\nExplore',
                style: StyleApp.welcome,
                children: [
                  TextSpan(text: ' New Hotels', style: StyleApp.newhotels)
                ]),
          ),
        ),
        actions: [
          Container(
            padding: EdgeInsets.only(
                right: size.width * 0.05, top: size.height * 0.01),
            child: Image.asset(
              'assets/images/1x/add-square.png',
              height: 24,
              color: ColorApp.black,
            ),
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) =>
                  MyCard(hotelInfo: listHotel[index]),
              childCount: listHotel.length,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/1x/home-2-1.png',
              height: 20,
            ),
            label: 'Home',
            backgroundColor: ColorApp.white,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/1x/search-normal.png',
              height: 20,
            ),
            label: 'Discover',
            backgroundColor: ColorApp.white,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/1x/book-saved.png',
              height: 20,
            ),
            label: 'Bookmark',
            backgroundColor: ColorApp.white,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/1x/user-square.png',
              height: 20,
            ),
            label: 'Profile',
            backgroundColor: ColorApp.white,
          ),
        ],
        selectedItemColor: ColorApp.blue,
        currentIndex: 0,
        iconSize: size.width*0.05,
      ),
    );
  }
}
