import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_hotel_app/ui/constants/infohotel.dart';
import 'package:new_hotel_app/ui/constants/styles.dart';

class MyCard extends StatelessWidget {
  const MyCard({Key? key, required this.hotelInfo}) : super(key: key);
  final InfoHotel hotelInfo;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final String numOfStar = hotelInfo.numOfStar.toString(); //414x896
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "HotelDetailPage");
      },
      child: Card(
        child: Container(
          padding: EdgeInsets.all(size.width * 0.04),
          child: Column(
            children: [
              Container(
                child: Image.asset(hotelInfo.pathPic),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Stack(
                children: [
                  Container(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      hotelInfo.nameHotel,
                      style: StyleApp.namehotel,
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset(
                          'assets/images/1x/star.png',
                          color: hotelInfo.numOfStar >= 1
                              ? Colors.amber
                              : Colors.grey,
                        ),
                        SizedBox(
                          width: size.width * 0.01,
                        ),
                        Image.asset(
                          'assets/images/1x/star.png',
                          color: hotelInfo.numOfStar >= 2
                              ? Colors.amber
                              : Colors.grey,
                        ),
                        SizedBox(
                          width: size.width * 0.01,
                        ),
                        Image.asset(
                          'assets/images/1x/star.png',
                          color: hotelInfo.numOfStar >= 3
                              ? Colors.amber
                              : Colors.grey,
                        ),
                        SizedBox(
                          width: size.width * 0.01,
                        ),
                        Image.asset(
                          'assets/images/1x/star.png',
                          color: hotelInfo.numOfStar >= 4
                              ? Colors.amber
                              : Colors.grey,
                        ),
                        SizedBox(
                          width: size.width * 0.01,
                        ),
                        Image.asset(
                          'assets/images/1x/star.png',
                          color: hotelInfo.numOfStar >= 5
                              ? Colors.amber
                              : Colors.grey,
                        ),
                        SizedBox(
                          width: size.width * 0.02,
                        ),
                        Text(
                          numOfStar,
                          style: StyleApp.numstar,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.01),
              Row(
                children: [
                  Image.asset('assets/images/1x/location.png'),
                  SizedBox(
                    width: size.width * 0.01,
                  ),
                  Text(
                    hotelInfo.addressHotel,
                    style: StyleApp.alive,
                  )
                ],
              )
            ],
          ),
        ),
        margin: EdgeInsets.all(size.width * 0.04),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        elevation: 0,
      ),
    );
  }
}
