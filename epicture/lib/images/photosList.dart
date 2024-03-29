import 'package:flutter/material.dart';
import 'package:oauth2/oauth2.dart' as oauth2;

import 'package:epicture/model/image.dart';
import 'imageCard.dart';

class PhotosList extends StatefulWidget {
  final List<ImgurImage> photos;
  oauth2.Client client;

  PhotosList({Key key, this.client, this.photos}) : super(key: key);
  @override
  PhotosListState createState() => new PhotosListState();
}

class PhotosListState extends State<PhotosList> {

  ScrollController _controller;

  PhotosListState();

  _scrollListener() {
 
 }

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      controller: _controller,
      itemCount: widget.photos.length,
      itemBuilder: (context, index) {
        return ImageCard(widget.client, widget.photos[index], false);
      },
    );
  }
}