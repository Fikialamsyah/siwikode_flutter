import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:siwikode_v2/data/travel_data.dart';
import 'package:siwikode_v2/model/travel.dart';
import 'package:siwikode_v2/pages/detail_page.dart';
import 'package:siwikode_v2/widgets/travel_card.dart';
import '../theme.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 24, right: 24, bottom: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello Traveler',
                          style: redTextStyle.copyWith(
                              fontWeight: regular, fontSize: 23),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'find culinary and travel\nexperiences in the city of Depok',
                          style: lightGrey2TextStyle.copyWith(
                              fontSize: 15, fontWeight: light),
                        )
                      ],
                      ),
                      Spacer(),
                      Image.asset(
                      'assets/sally.png',
                      width: 80,
                      height: 80,
                    )
                  ],
                ),
                SizedBox(height: 15,),
                Container(
                  height: 600,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      final Travel travel = travelData[index];
                      return InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(travel: travel,)));
                        },
                        child: TravelCard(imgAsset: travel.imageAsset, name: travel.name, type: travel.type, rate: travel.rate)
                      );
                    },
                    itemCount: travelData.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
