import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pscomidas/app/global/models/entities/rating.dart';

class TitleRating extends StatefulWidget {
  const TitleRating(
      {Key? key,
      required this.restaurantId,
      required this.rating,
      required this.totalRating})
      : super(key: key);
  final String restaurantId;
  final double rating;
  final int totalRating;

  @override
  _TitleRatingState createState() => _TitleRatingState();
}

class _TitleRatingState extends State<TitleRating> {
  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return SizedBox(
      width: screen.width * .8,
      child: Column(
        children: [
          ListTile(
            title: const Center(
                child: Text(
              'AVALIAÇÕES DA LOJA',
              style: TextStyle(
                fontFamily: 'NUnito',
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            )),
            subtitle: Center(
                child: Text(
              widget.restaurantId,
              style: const TextStyle(fontFamily: 'NUnito'),
            )),
          ),
          Text(
            widget.rating.toStringAsFixed(1),
            style: const TextStyle(
                fontFamily: 'NUnito',
                fontSize: 35,
                fontWeight: FontWeight.bold),
          ),
          RatingBarIndicator(
            rating: widget.rating,
            itemBuilder: (context, index) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            itemCount: 5,
            itemSize: 20.0,
            direction: Axis.horizontal,
          ),
          Text(
            '${widget.totalRating} avaliações no total',
            style: const TextStyle(fontFamily: 'NUnito', color: Colors.grey),
          )
        ],
      ),
    );
  }
}
