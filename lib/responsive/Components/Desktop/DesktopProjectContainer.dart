import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:portfolio/Home.dart';
import 'dart:js' as js;

class DesktopProjectContainer extends StatefulWidget {
  int index;
  DesktopProjectContainer({required this.index});

  @override
  _DesktopProjectContainerState createState() =>
      _DesktopProjectContainerState();
}

class _DesktopProjectContainerState extends State<DesktopProjectContainer> {
  @override
  Widget build(BuildContext context) {
    int index = widget.index;
    String _license = "None";
    NumberFormat nf = NumberFormat("#.##", "pt_br");
    if (repositories[index].license != null) {
      _license = repositories[index].license!.name ?? "Other";
    }
    return GestureDetector(
      onTap: () {
        js.context.callMethod("open", [repositories[index].htmlUrl]);
      },
      child: Container(
        padding: EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: Color(0xFF1e0040),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(
              flex: 2,
            ),
            Text(
              repositories[index].name.length > 15
                  ? "${repositories[index].name.substring(0, 15)}..."
                  : repositories[index].name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
                repositories[index].description.length > 48
                    ? "${repositories[index].description.substring(0, 48)}..."
                    : repositories[index].description,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300)),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(FontAwesomeIcons.paperclip),
                    SizedBox(
                      width: 8,
                    ),
                    Text(_license)
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.star),
                    SizedBox(
                      width: 8,
                    ),
                    Text(repositories[index].stargazersCount.toString())
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.storage),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                        "${nf.format(repositories[index].size / 1000).toString()} MB")
                  ],
                ),
              ],
            ),
            Spacer(
              flex: 2,
            )
          ],
        ),
      ),
    );
  }
}
