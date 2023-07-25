import 'package:custom_instagram/data/model_data.dart';
import 'package:flutter/material.dart';

class ImageDraft extends StatelessWidget {
  ImageDraft({super.key});

  final ModelDatas data = ModelDatas();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(data.datas[1].userImage),
    );
  }
}
