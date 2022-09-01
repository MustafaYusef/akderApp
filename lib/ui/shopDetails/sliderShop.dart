import 'package:akhder_app/data/bannersData.dart';
import 'package:akhder_app/data/shopSlider.dart';
import 'package:akhder_app/ui/customWidget/loadingImage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class sliderShop extends StatefulWidget {
  sliderShop({
    Key? key,
    required int current,
    required this.banners,
  })  : _current = current,
        super(key: key);

  int _current;
  List<ShopPromotion> banners;
  @override
  _sliderShopState createState() => _sliderShopState();
}

class _sliderShopState extends State<sliderShop> {
  void onPageChange(int index, CarouselPageChangedReason changeReason) {
    setState(() {
      widget._current = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      color: Colors.white,
      child: Stack(children: <Widget>[
        CarouselSlider.builder(
            itemCount: widget.banners.length == 0 ? 1 : widget.banners.length,
            options: CarouselOptions(
              height: 125,
              viewportFraction: 1.0,
              enableInfiniteScroll: true,
              autoPlay: true,
              aspectRatio: 2.0,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              pauseAutoPlayOnTouch: true,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
              onPageChanged: onPageChange,
            ),
            itemBuilder: (BuildContext context, int itemIndex, int u) =>
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        width: MediaQuery.of(context).size.width,
                        child: Card(
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: widget.banners[widget._current].img,
                            placeholder: (context, url) => loadinImage(),
                            errorWidget: (context, url, error) => loadinImage(),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 5,
                        ),
                      )),
                )),
        Positioned(
            bottom: 0.0,
            child: Container(
              width: Get.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.banners.map((image) {
                  return Container(
                    width: 7.0,
                    height: 7.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: widget._current == widget.banners.indexOf(image)
                            ? Colors.grey[900]
                            : Colors.grey[300]),
                  );
                }).toList(),
              ),
            )),
      ]),
    );
  }
}
