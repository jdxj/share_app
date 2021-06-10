import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

import 'package:share_app/model/response.dart';

class VideoList extends StatefulWidget {
  VideoList({Key key}) : super(key: key);

  @override
  _VideoListState createState() {
    return _VideoListState();
  }
}

class _VideoListState extends State<VideoList> {
  final videoListURL = 'http://192.168.124.17:49152/api/v1/videos?page=';
  Dio client = Dio();

  int page = 0;
  bool hasVideosInfo = true;
  List<VideoInfo> videosInfo = <VideoInfo>[];
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    getVideoList();
    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        getVideoList();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      //滚动条
      child: ListView.builder(
          itemCount: videosInfo.length,
          itemBuilder: (BuildContext ctx, int idx) {
            return ListTile(title: Text(videosInfo[idx].title));
          },
          controller: scrollController,
      ),
    );
  }

  void getVideoList() async {
    var resp = await client.get(videoListURL+this.page.toString());
    var apiResp = APIResponse.fromJson(resp.data);
    if (apiResp.code != 0) {
      print(apiResp.message);
      return;
    }

    var page = APIPage.fromJson(apiResp.data);
    List<dynamic> data = page.data;
    if (data.length == 0) {
      this.hasVideosInfo = false;
      return;
    }

    data.forEach((element) {
      videosInfo.add(VideoInfo.fromJson(element));
      print('add success');
    });

    this.page++;
    setState((){});
  }
}

