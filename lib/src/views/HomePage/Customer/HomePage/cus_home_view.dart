import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:instacop/link.dart';
import 'package:instacop/src/helpers/colors_constant.dart';
import 'package:instacop/src/helpers/screen.dart';
import 'package:instacop/src/views/HomePage/Customer/HomePage/product_list_view.dart';
import 'package:instacop/src/widgets/icon_instacop.dart';

class CustomerHomePageView extends StatefulWidget {
  @override
  _CustomerHomePageViewState createState() => _CustomerHomePageViewState();
}

class _CustomerHomePageViewState extends State<CustomerHomePageView>
    with AutomaticKeepAliveClientMixin {
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    ConstScreen.setScreen(context);
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        // Banner Slider
        CarouselSlider(
          viewportFraction: 1.0,
          enableInfiniteScroll: false,
          scrollDirection: Axis.vertical,
          initialPage: 0,
          items: <Widget>[
            Banner(
              title: 'NEW IN',
              description:
                  'Discover this season\'s new collection built around',
              image: 'giphy_1.gif',
              onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductListView(
                              search: '',
                            )));
              },
            ),
            Banner(
              title: 'SALE',
              description:
                  'Discover this season\'s new collection built around',
              image: 'banner_3.jpg',
              onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductListView(
                              search: 'sale',
                            )));
              },
            ),
            Banner(
              title: 'STORIES',
              description: 'Check out our stories focused',
              image: 'banner_10.jpg',
              onPress: () {
                Navigator.pushNamed(context, 'customer_detail_banner_screen');
              },
            ),
          ],
        ),
        // Logo
        Positioned(
          top: 0,
          left: ConstScreen.setSizeWidth(255),
          child: IconInstacop(
            textSize: FontSize.setTextSize(60),
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class Banner extends StatelessWidget {
  Banner({this.title, this.description, this.onPress, this.image});

  final String title;
  final String description;
  final String image;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(KImageAddress + image),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                  fontSize: FontSize.setTextSize(85),
                  color: kColorWhite,
                  fontWeight: FontWeight.w900),
              textAlign: TextAlign.center,
            ),
            Text(
              description,
              style: TextStyle(
                fontSize: FontSize.setTextSize(30),
                color: kColorWhite,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: kColorWhite, width: 2)),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: ConstScreen.setSizeHeight(5),
                    horizontal: ConstScreen.setSizeHeight(60)),
                child: Text('View',
                    style: TextStyle(
                        fontSize: FontSize.setTextSize(40),
                        color: kColorWhite,
                        fontWeight: FontWeight.w900)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
