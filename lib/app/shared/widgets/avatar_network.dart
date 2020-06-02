import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class AvatarNetwork extends StatefulWidget {
  final String pictureUrl;
  final double size;
  final String initials;
  final double leftPadding;
  final double rightPadding;
  final Color color;

  AvatarNetwork(
      {this.pictureUrl,
      this.size,
      this.initials,
      this.leftPadding = 16.0,
      this.rightPadding = 0.0,
      this.color = Colors.white38});

  @override
  _AvatarNetworkState createState() => _AvatarNetworkState();
}

class _AvatarNetworkState extends State<AvatarNetwork> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        widget.leftPadding,
        0.0,
        widget.rightPadding,
        0.0,
      ),
      child: ClipOval(
        child: Container(
          color: Theme.of(context).primaryColor,
          width: widget.size,
          height: widget.size,
          child: ExtendedImage.network(
            widget.pictureUrl ?? '',
            fit: BoxFit.fitHeight,
            width: double.maxFinite,
            cache: true,
            enableLoadState: true,
            loadStateChanged: (ExtendedImageState state) {
              switch (state.extendedImageLoadState) {
                case LoadState.loading:
                  return Container(
                    width: widget.size * 0.8,
                    height: widget.size * 0.8,
                    child: Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Theme.of(context).canvasColor,
                      ),
                    ),
                  );
                case LoadState.failed:
                  return Center(
                    child: Text(
                      widget.initials?.toUpperCase()[0] ?? '?',
                      style: TextStyle(
                          color: Theme.of(context).canvasColor, fontSize: widget.size * 0.5),
                    ),
                  );
                case LoadState.completed:
                  return null;
                default:
                  return null;
              }
            },
          ),
        ),
      ),
    );
  }
}
