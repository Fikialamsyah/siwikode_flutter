import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:siwikode_v2/model/travel.dart';
import 'package:share/share.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:siwikode_v2/widgets/favorite_button.dart';

import '../theme.dart';

class DetailPage extends StatelessWidget {
  final Travel travel;

  DetailPage({required this.travel});

  @override
  Widget build(BuildContext context) {
    var lottie = Lottie.asset('assets/loading.json');
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(travel.imageAsset))),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 20, left: 24, right: 24),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: whiteColor,
                        child: IconButton(
                          icon: Icon(Icons.arrow_back),
                          color: redColor,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Spacer(),
                      CircleAvatar(
                        backgroundColor: whiteColor,
                        child: FavoriteButton()
                      ),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, top: 205),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 5),
                      decoration: BoxDecoration(
                          color: darkGreyColor.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(30)),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            travel.rate,
                            style: whiteTextStyle,
                          )
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 5),
                      decoration: BoxDecoration(
                          color: darkGreyColor.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(30)),
                      child: Row(
                        children: [
                          Icon(
                            Icons.beach_access,
                            color: Colors.yellow,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            travel.type,
                            style: whiteTextStyle,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Center(
                child: Container(
                  height: 500,
                  margin: EdgeInsets.only(top: 250),
                  padding: EdgeInsets.only(top: 30, left: 24, right: 24),
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                travel.name,
                                style: blackTextStyle.copyWith(
                                    fontSize: 18, fontWeight: semiBold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                travel.address,
                                maxLines: 3,
                                style: darkGreyTextStyle.copyWith(fontSize: 14),
                              )
                            ],
                          ),
                          Spacer(),
                          CircleAvatar(
                              backgroundColor: redColor,
                              child: IconButton(
                                  onPressed: () {
                                    Share.share("Share from SIWIKODE\nAddress ${travel.name} :\n${travel.urlMap}");
                                  },
                                  splashColor: whiteColor,
                                  icon: Icon(
                                    Icons.share,
                                    color: whiteColor,
                                  )))
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Description',
                        style: blackTextStyle.copyWith(
                            fontSize: 14, fontWeight: regular),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        travel.desc,
                        maxLines: 3,
                        style: darkGreyTextStyle.copyWith(fontSize: 14),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Other Image',
                        style: blackTextStyle.copyWith(
                            fontSize: 14, fontWeight: regular),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 150,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: travel.imageUrls.map((url) {
                            return Padding(
                              padding: EdgeInsets.all(4.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.network(
                                  url,
                                  loadingBuilder: (BuildContext context,
                                      Widget child,
                                      ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    }
                                    return Center(
                                      child: Container(
                                        padding: EdgeInsets.all(30),
                                        width: 150,
                                        height: 150,
                                        child: CircularProgressIndicator(
                                          value: loadingProgress
                                                      .expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: 358,
                        height: 50,
                        child: TextButton(
                          onPressed: () {
                            MapsLauncher.launchCoordinates(travel.lat, travel.long);
                          },
                          child: Text(
                            'Go to Destination',
                            style: TextStyle(color: whiteColor),
                          ),
                          style: TextButton.styleFrom(
                              backgroundColor: redColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30))),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
