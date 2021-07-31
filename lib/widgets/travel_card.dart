import 'package:flutter/material.dart';
import 'package:siwikode_v2/model/travel.dart';
import '../theme.dart';

class TravelCard extends StatelessWidget {
  final String imgAsset;
  final String name;
  final String type;
  final String rate;

  TravelCard({required this.imgAsset, required this.name, required this.type, required this.rate});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
        ),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.network(
                  imgAsset,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return Center(
                      child: Container(
                        padding: EdgeInsets.all(30),
                        width: 100,
                        height: 100,
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      ),
                    );
                  },
                ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 20, right: 20, bottom: 16),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name, style: blackTextStyle.copyWith(fontSize: 14, fontWeight: semiBold),),
                      SizedBox(height: 5,),
                      Text(type, style: darkGreyTextStyle.copyWith(fontSize: 14, fontWeight: regular),)
                    ],
                  ),
                  Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(rate, style: blackTextStyle.copyWith(fontSize: 14, fontWeight: light),),
                      SizedBox(width: 7,),
                      Icon(Icons.star, size: 20, color: Colors.yellow,)
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
