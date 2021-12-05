import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingIndividual extends StatefulWidget {
  const RatingIndividual({Key? key, required this.rating}) : super(key: key);
  final double rating;
  @override
  _RatingIndividualState createState() => _RatingIndividualState();
}

class _RatingIndividualState extends State<RatingIndividual> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('${widget.rating}'),
        const SizedBox(
          width: 10,
        ),
        RatingBarIndicator(
          rating: widget.rating,
          itemBuilder: (context, index) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          itemCount: 5,
          itemSize: 15.0,
          direction: Axis.horizontal,
        ),
      ],
    );
  }
}
