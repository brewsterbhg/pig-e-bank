import 'package:flutter/material.dart';
import 'package:pig_e_bank/data/offer.dart';
import 'package:snaplist/snaplist.dart';
import 'package:url_launcher/url_launcher.dart';

class OffersPage extends StatefulWidget {
  final List<Offer> _offers = [];

  OffersPage({Key key, @required offers}) {
    _offers.addAll(offers);
  }

  @override
  State<StatefulWidget> createState() {
    return new _OffersPageState();
  }
}

class _OffersPageState extends State<OffersPage> {
  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final child = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(child: _buildSnapList(context)),
        Expanded(child: _buildCardInfoBox()),
      ],
    );
    return new Scaffold(
      body: new _ShadedContainer(child: child),
    );
  }

  _buildSnapList(context) {
    final screenSize = MediaQuery.of(context).size;
    final Size cardSize = Size(300.0, 460.0);
    return SnapList(
      padding: EdgeInsets.only(
          left: (screenSize.width - cardSize.width) / 2,
          right: (screenSize.width - cardSize.width) / 2),
      sizeProvider: (index, data) => cardSize,
      separatorProvider: (index, data) => Size(10.0, 30.0),
      builder: (context, index, data) {
        return ClipRRect(
          borderRadius: new BorderRadius.circular(0),
          child: buildCreditCard(index),
        );
      },
      count: widget._offers.length,
      positionUpdate: (int index) {
        setState(() {
          _selectedIndex = index;
        });
      },
    );
  }

  Widget buildCreditCard(int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Image.network(
            widget._offers[index].image,
            fit: BoxFit.contain,
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 20),
          child: new RaisedButton(
            padding: const EdgeInsets.all(8.0),
            textColor: Colors.white,
            color: Colors.green,
            onPressed: _applyCardPressed,
            child: new Text("Apply"),
          ),
        ),
      ],
    );
  }

  _buildCardInfoBox() {
    final card = SizedBox(
      child: Card(
        margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IntrinsicHeight(
                child: new Row(
              children: <Widget>[
                Expanded(
                    child: ListTile(
                  title: Text(
                    'APR',
                    textAlign: TextAlign.center,
                    style: new TextStyle(fontWeight: FontWeight.w100),
                  ),
                  subtitle: Text(
                    widget._offers[_selectedIndex].interestRate,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 26),
                  ),
                )),
                VerticalDivider(
                  color: Colors.grey,
                ),
                Expanded(
                    child: ListTile(
                  title: Text(
                    'Annual Fees',
                    textAlign: TextAlign.center,
                    style: new TextStyle(fontWeight: FontWeight.w100),
                  ),
                  subtitle: Text(
                    widget._offers[_selectedIndex].annualFee,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 26),
                  ),
                )),
              ],
            )),
            Divider(
              color: Colors.grey,
            ),
            ListTile(
              title: Text(
                'Details',
                textAlign: TextAlign.center,
                style: new TextStyle(fontWeight: FontWeight.w100),
              ),
              subtitle: Text(
                widget._offers[_selectedIndex].description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );

    return card;
  }

  void _applyCardPressed() async {
    final url = widget._offers[_selectedIndex].signupUrl;
    print(url);
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class _ShadedContainer extends StatelessWidget {
  const _ShadedContainer({
    Key key,
    @required this.child,
  }) : super(key: key);

  final Column child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.white, Colors.grey],
        ),
      ),
      child: child,
    );
  }
}
