import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'bloc/CommonBloc.dart';

class Today extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          // 标题部分
          CupertinoSliverNavigationBar(
            // backgroundColor: Colors.white,
            // automaticallyImplyLeading: false,
            /*border: Border(
              bottom: BorderSide.none,
            ),*/
            largeTitle: Text(
              AppLocalizations.of(context).today,
            ),
          ),
          // 内容部分
          SliverSafeArea(
            top: false,
            minimum: const EdgeInsets.only(top: 8),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (content, index) {
                  return Container(
                    padding: EdgeInsets.all(10),
                    child: CupertinoButton(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(40),
                      child: Text('切换主题'),
                      onPressed: () {
                        Provider.of<CommonBloc>(context,listen: false).changeTheme();
                      },
                    ),
                  );
                },
                childCount: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
