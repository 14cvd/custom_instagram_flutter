import 'package:flutter/material.dart';

import '../data/model_data.dart';

class StoryBoard extends StatelessWidget {
  const StoryBoard({
    super.key,
    required ModelDatas modelDataItem,
  }) : _modelDataItem = modelDataItem;

  final ModelDatas _modelDataItem;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: _modelDataItem.datas.length,
      itemBuilder: (context, index) {
        //return Image.asset(_modelDataItem.datas[index].userImage);

        return Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  foregroundImage:
                      AssetImage(_modelDataItem.datas[index].userImage),
                ),
                Text(_modelDataItem.datas[index].userTitle),
              ],
            ),
          ),
        );
      },
    ));
  }
}
