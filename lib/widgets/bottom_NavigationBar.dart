import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:starter_app/app/theme/tw_colors.dart';

class JobListItemCard extends StatelessWidget {
  String designation;
  Widget? prefix;
  String companyName;
  String jobLocation;
  JobListItemCard(
      {Key? key,
      required this.designation,
      this.prefix,
      required this.companyName,
      required this.jobLocation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      padding: const EdgeInsets.all(15),
      decoration: ShapeDecoration(
        color: TWColors.slate.shade100,
        shape: SmoothRectangleBorder(
          borderRadius: SmoothBorderRadius(
            cornerRadius: 15,
            cornerSmoothing: 0.6,
          ),
        ),
      ),
      child: Row(
        children: [
          if (prefix != null)
            Flexible(
              flex: 0,
              fit: FlexFit.tight,
              child: prefix!,
            ),
          const SizedBox(width: 15),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 2),
                Text(
                  designation,
                  maxLines: 1,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 7),
                Row(
                  children: [
                    Text(
                      companyName,
                      maxLines: 1,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(fontSize: 12.0),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 15),
                      width: 5,
                      height: 5,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: TWColors.slate.shade300,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 15),
                      child: Text(
                        jobLocation,
                        maxLines: 1,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(fontSize: 12.0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Flexible(
            flex: 0,
            fit: FlexFit.tight,
            child: GestureDetector(
              child: Icon(
                Icons.more_vert,
                color: TWColors.slate.shade400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
