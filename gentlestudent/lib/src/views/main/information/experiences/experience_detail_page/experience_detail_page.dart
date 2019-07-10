import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gentlestudent/src/models/experience.dart';
import 'package:gentlestudent/src/utils/date_utils.dart';
import 'package:gentlestudent/src/widgets/loading_spinner.dart';

class ExperienceDetailPage extends StatelessWidget {
  final Experience experience;

  ExperienceDetailPage({this.experience});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ervaring", style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: ListView(
        children: <Widget>[
          experienceImage(),
          experienceTitle(),
          experienceInfoBox(),
          shortDescription(),
          longDescription(),
        ],
      ),
    );
  }

  Widget experienceImage() => CachedNetworkImage(
        imageUrl: experience.imageUrl,
        placeholder: (context, message) => loadingSpinner(),
        errorWidget: (context, message, object) => Icon(Icons.error),
      );

  Widget experienceTitle() => Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 26, bottom: 10),
        child: Text(
          experience.title,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 21),
        ),
      );

  Widget experienceInfoBox() => Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 16, bottom: 10),
        child: Container(
          padding: EdgeInsets.all(14),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.lightBlue),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              experienceAuthor(),
              SizedBox(height: 6),
              experienceDate(),
            ],
          ),
        ),
      );

  Widget experienceAuthor() => Row(
        children: <Widget>[
          Text(
            "Auteur:",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.lightBlue,
            ),
          ),
          Expanded(
            child: Text(
              " ${experience.author}",
              style: TextStyle(
                fontSize: 14,
                color: Colors.lightBlue,
              ),
            ),
          ),
        ],
      );

  Widget experienceDate() => Row(
        children: <Widget>[
          Text(
            "Gepubliceerd op:",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.lightBlue,
            ),
          ),
          Expanded(
            child: Text(
              " ${DateUtils.formatDate(experience.published)}",
              style: TextStyle(
                fontSize: 14,
                color: Colors.lightBlue,
              ),
            ),
          ),
        ],
      );

  Widget shortDescription() => Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 8, bottom: 10),
        child: Text(
          experience.shortText,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  Widget longDescription() => Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 8, bottom: 10),
        child: Text(
          experience.longText,
          style: TextStyle(fontSize: 14),
        ),
      );
}