import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopyswiss/features/components/custom_image.dart';
import 'package:shopyswiss/features/components/image_zoom.dart';

class ImagePreview extends StatelessWidget {
  final String? url;

  const ImagePreview({super.key, this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(toolbarHeight: 0),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.close,
                color: Colors.black,
                size: 32.r,
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: 1.sw,
              padding: const EdgeInsets.all(20),
              child: ImageZoom(
                initTotalZoomOut: true,
                child: CustomImage(
                  baseUrl: url,
                  radius: 10.r,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
