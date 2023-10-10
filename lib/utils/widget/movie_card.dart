import 'package:filmi_safari/utils/theme/colors.dart';
import 'package:flutter/material.dart';


class MovieGridCard extends StatelessWidget {
  const MovieGridCard({
    super.key,
    required this.onPress ,
    required this.image ,
    required this.rating ,
    this.width = 130 ,
    this.height = 190 ,
  });

  final double height,width;
  final VoidCallback onPress;
  final String image;
  final String rating;
  // final String imagelink = "https://image.tmdb.org/t/p/w500/w4mPBAfZS5yIXOcqEiEOL8fnuQG.jpg";

  @override
  Widget build(BuildContext context) {
    final String imagelink = "https://image.tmdb.org/t/p/w500$image";
    return InkWell(
      onTap: onPress,

      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage(imagelink),
            fit: BoxFit.cover,
          ),
        ),
        child: 
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              decoration: BoxDecoration(
                color: primaryRed,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(rating, style: const TextStyle(color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.onPress ,
    required this.image ,
    required this.rating ,
    this.width = 130 ,
    this.height = 190 ,
    this.isUpcoming = false
  });

  final isUpcoming ;
  final double height,width;
  final VoidCallback onPress;
  final String image;
  final String rating;
  // final String imagelink = "https://image.tmdb.org/t/p/w500/w4mPBAfZS5yIXOcqEiEOL8fnuQG.jpg";

  @override
  Widget build(BuildContext context) {
    final String imagelink = "https://image.tmdb.org/t/p/w500$image";
    return InkWell(
      onTap: onPress,

      child: Container(
        margin: const EdgeInsets.only(left: 10),
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage(imagelink),
            fit: BoxFit.cover,
          ),
        ),
        child: isUpcoming == false ?
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              decoration: BoxDecoration(
                color: primaryRed,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(rating, style: const TextStyle(color: Colors.white)),
            )
          ],
        )
        :Container(),
      ),
    );
  }
}