import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fsuper/fsuper.dart';
import 'bloc/CommonBloc.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fsuper/fsuper.dart';

class BrushQuestions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var brightness =
        Provider.of<CommonBloc>(context, listen: true).themeData.brightness;
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            largeTitle: Text(
              AppLocalizations.of(context).brushQuestions,
            ),
          ),
          // 主题部分
          SliverSafeArea(
            top: false,
            sliver: SliverList(
              delegate: SliverChildListDelegate.fixed([
                // N5 框框
                FSuper(
                  text: "N5",
                  style: TextStyle(
                    fontSize: 132,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                  textAlignment: Alignment.center,
                  height: 160,
                  margin: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
                  padding: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
                  width: double.infinity,
                  corner: FCorner.all(15),
                  shadowBlur: 5,
                  backgroundImage: AssetImage("images/kyotomomiji.jpg"),
                  onClick: () {
                    print("aa");
                  },
                ), 
                // N4
                FSuper(
                  text: "N4",
                  style: TextStyle(
                    fontSize: 132,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                  textAlignment: Alignment.center,
                  height: 160,
                  margin: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
                  padding: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
                  width: double.infinity,
                  corner: FCorner.all(15),
                  shadowBlur: 5,
                  backgroundImage: AssetImage("images/donbori.jpg"),
                  onClick: () {
                    print("aa");
                  },
                ),
                // N3 
                FSuper(
                  text: "N3",
                  style: TextStyle(
                    fontSize: 132,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                  textAlignment: Alignment.center,
                  height: 160,
                  margin: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
                  padding: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
                  width: double.infinity,
                  corner: FCorner.all(15),
                  shadowBlur: 5,
                  backgroundImage: AssetImage("images/fujisan.jpg"),
                  onClick: () {
                    print("aa");
                  },
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
