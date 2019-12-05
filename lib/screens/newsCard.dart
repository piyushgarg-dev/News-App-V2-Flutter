import 'package:flutter/material.dart';
import 'package:news_appv2/screens/web_view.dart';
import 'package:expandable/expandable.dart';

class NewsCard extends StatefulWidget {
  String author, title, content, imageurl, url;
  NewsCard(this.author, this.title, this.content, this.imageurl, this.url);
  @override
  _NewsCardState createState() => _NewsCardState(
      this.author, this.title, this.content, this.imageurl, this.url);
}

class _NewsCardState extends State<NewsCard> {
  String author, title, content, imageurl, url;
  _NewsCardState(
      this.author, this.title, this.content, this.imageurl, this.url);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MyWebView(this.url),
          ));
        },
        child: Container(
          child: Card(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                      borderRadius: new BorderRadius.circular(8.0),
                      child: Image.network(
                          this.imageurl != null ? this.imageurl : '')),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ExpandablePanel(
                    header: Text(
                      this.title != null ? this.title : '',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    collapsed: Text(
                      this.content != null ? this.content : '',
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    expanded: Text(
                      this.content != null ? this.content : '',
                      softWrap: true,
                    ),
                    tapHeaderToExpand: true,
                    hasIcon: true,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
