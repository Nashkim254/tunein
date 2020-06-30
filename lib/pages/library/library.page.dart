import 'package:tunein/components/pagenavheader.dart';
import 'package:tunein/pages/library/albums.page.dart';
import 'package:tunein/pages/library/artists.page.dart';
import 'package:tunein/pages/library/tracks.page.dart';
import 'package:tunein/services/layout.dart';
import 'package:tunein/services/locator.dart';
import 'package:flutter/material.dart';

class LibraryPage extends StatelessWidget {
  LibraryPage({Key key}) : super(key: key);
  final layoutService = locator<LayoutService>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        PageNavHeader(
          pageIndex: 0,
        ),
        Flexible(
          child: PageView(
            physics: AlwaysScrollableScrollPhysics(),
            controller: layoutService.pageServices[0].pageViewController,
            children: [
              TracksPage(),
              ArtistsPage(),
              AlbumsPage(),
            ],
          ),
        )
      ],
    );
  }
}