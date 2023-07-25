import 'package:custom_instagram/data/model_data.dart';
import 'package:custom_instagram/widget/story.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ModelDatas _modelDataItem = ModelDatas();
  Widget? _widget;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: DropdownButton<Widget>(
                    hint: const Text("Instagram"),
                    items: const [
                      DropdownMenuItem(
                          value: Text("Following"), child: Text("Following")),
                      DropdownMenuItem(
                          value: Text("Favorite"), child: Text("Favorite")),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _widget = value;
                      });
                    },
                    value: _widget,
                  ),
                ),
                const Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Icon(FontAwesomeIcons.heart),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(FontAwesomeIcons.facebookMessenger),
                    )
                  ],
                )
              ],
            ),
            StoryBoard(modelDataItem: _modelDataItem),
            const Divider(thickness: 2),
            Expanded(
                flex: 5,
                child: ListView.builder(
                  itemCount: _modelDataItem.datas.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    radius: 20,
                                    foregroundImage: AssetImage(
                                        _modelDataItem.datas[index].userImage),
                                  ),
                                ),
                                Text(_modelDataItem.datas[index].userTitle)
                              ],
                            ),
                            const Icon(Icons.arrow_drop_down_circle_outlined)
                          ],
                        ),
                        Image.asset(_modelDataItem.datas[index].postImage),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(FontAwesomeIcons.heart),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(FontAwesomeIcons.comment),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(FontAwesomeIcons.share),
                                )
                              ],
                            ),
                            Icon(Icons.save_alt_outlined)
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(_modelDataItem.datas[index].comment),
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: RichText(
                              text: TextSpan(
                                text: _modelDataItem.datas[index].userTitle,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                children: [
                                  TextSpan(
                                    text:
                                        ' ${_modelDataItem.datas[index].desc}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            )
                            // Row(
                            //   children: <Widget>[
                            //     // Text(
                            //     //   _modelDataItem.datas[index].userTitle,
                            //     //   style: const TextStyle(
                            //     //       fontWeight: FontWeight.bold),
                            //     // ),
                            //     // const SizedBox(
                            //     //   width: 10,
                            //     // ),
                            //     // Expanded(
                            //     //   // width: MediaQuery.of(context).size.width * 0.7,
                            //     //   child: Text(
                            //     //     _modelDataItem.datas[index].desc,
                            //     //     //  overflow: TextOverflow.ellipsis,
                            //     //     // softWrap: false,
                            //     //   ),
                            //     // ),

                            //   ],
                            // ),
                            )
                      ],
                    );
                  },
                ))
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.house, color: Colors.black),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.magnifyingGlass, color: Colors.black),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.plus, color: Colors.black),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.tiktok, color: Colors.black),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.user, color: Colors.black),
              label: "",
            ),
          ],
        ),
      ),
    );
  }
}
