import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payment_management_app/utils/constants.dart';
import 'package:payment_management_app/widgets/activity_tile_widget.dart';
import 'package:payment_management_app/widgets/balance_card_widget.dart';
import 'package:payment_management_app/widgets/recent_payment_user_widget.dart';
import 'package:payment_management_app/widgets/top_bar_widget.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kgrey.shade100,
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverPadding(
            padding: EdgeInsets.only(top: 60),
            sliver: SliverToBoxAdapter(child: TopBarWidget()),
          ),
          const SliverToBoxAdapter(child: BalanceCardWidget()),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Send Again',
                style: textstyle1,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            sliver: SliverToBoxAdapter(
              child: SizedBox(
                height: 130,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) =>
                      const RecentPaymentUserWidget(),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 500,
              color: kwhite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(18.0),
                    child: SizedBox(
                      height: 45,
                      child: CupertinoSearchTextField(
                        itemColor: kblue,
                        itemSize: 25,
                        placeholder: 'Search Transactions',
                      ),
                    ),
                  ),
                  kheight10,
                  Padding(
                    padding: const EdgeInsets.only(left: 18, right: 18),
                    child: Row(
                      children: [
                        Text('Your Activity', style: textstyle2),
                        const Spacer(),
                        const Icon(
                          Icons.menu,
                          color: kblue,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                  kheight20,
                  SizedBox(
                    height: 300,
                    child: ListView.builder(
                      padding: const EdgeInsets.only(left: 18, right: 18),
                      itemCount: 2,
                      itemBuilder: (context, index) =>
                          const ActivityTileWidget(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
