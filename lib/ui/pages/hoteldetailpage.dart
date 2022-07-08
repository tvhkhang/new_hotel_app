import 'package:flutter/material.dart';
import 'package:flutter_svg/avd.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_hotel_app/ui/constants/assets.dart';
import 'package:new_hotel_app/ui/constants/colors.dart';
class HotelDetailPage extends StatefulWidget
{
  const HotelDetailPage({Key? key}) : super(key : key);
  @override
  State<HotelDetailPage> createState()=> _HotelDetailPage();
}
class _HotelDetailPage extends State<HotelDetailPage>
{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(

              expandedHeight: size.height*0.2,
            )
          ],
        ),
    );
  }
}