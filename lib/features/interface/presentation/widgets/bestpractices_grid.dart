import 'package:capimobile/core/language/language_list.dart';
import 'package:capimobile/features/interface/presentation/screens/best_practices/power_to_the_people.dart';
import 'package:capimobile/features/interface/presentation/widgets/practice_card.dart';
import 'package:capimobile/features/interface/presentation/screens/best_practices/big_picture.dart';
import 'package:capimobile/features/interface/presentation/screens/best_practices/fast_n_furious.dart';
import 'package:capimobile/features/interface/presentation/screens/best_practices/fixed_point.dart';
import 'package:capimobile/features/interface/presentation/screens/best_practices/know_thy_enemy.dart';
import 'package:capimobile/features/interface/presentation/screens/best_practices/let_there_be_light.dart';
import 'package:capimobile/features/interface/presentation/screens/best_practices/rome_wasnt_build.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BestPracticesGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      int count = (constraints.maxWidth / 250).floor();
      count = count < 2 ? 2 : count;
      return GridView.count(
        shrinkWrap: true,
        crossAxisCount: count,
        childAspectRatio: 0.75,
        children: [
          BestPracticesCard(
            name: d.KnowThyEnemy,
            imgPath: 'images/know_thy_enemy.png',
            onTap: () {
              Navigator.pushNamed(context, KnowThyEnemy.rout);
            },
          ),
          BestPracticesCard(
            name: d.RomeWasntBuildInADay,
            imgPath: 'images/rome_wasnt_built.png',
            onTap: () {
              Navigator.pushNamed(context, RomeWasntBuild.rout);
            },
          ),
          BestPracticesCard(
            name: d.LetThereBeLight,
            imgPath: 'images/let_there_be_light.png',
            onTap: () {
              Navigator.pushNamed(context, LetThereBeLight.rout);
            },
          ),
          BestPracticesCard(
            name: d.FastAndFurious,
            imgPath: 'images/fast_n_furious.png',
            onTap: () {
              Navigator.pushNamed(context, FastNFurious.rout);
            },
          ),
          BestPracticesCard(
            name: d.FixedPointInTime,
            imgPath: 'images/fixed_point.png',
            onTap: () {
              Navigator.pushNamed(context, FixedPoint.rout);
            },
          ),
          BestPracticesCard(
            name: d.GetTheBigPcture,
            imgPath: 'images/big_picture.png',
            onTap: () {
              Navigator.pushNamed(context, BigPicture.rout);
            },
          ),
          BestPracticesCard(
            name: d.PowerToThePeople,
            imgPath: 'images/power_to_the_people.png',
            onTap: () {
              Navigator.pushNamed(context, PowerToThePeople.rout);
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Theme.of(context).colorScheme.primary,
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              borderOnForeground: true,
              shadowColor: Theme.of(context).colorScheme.surface,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text.rich(
                        TextSpan(
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                            text: d.Based_on),
                        textAlign: TextAlign.center,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text.rich(
                          TextSpan(
                            text: 'Viana et al. 2018',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                decoration: TextDecoration.underline),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                _launchURL(
                                    'https://www.scielo.br/scielo.php?script=sci_arttext&pid=S2317-48892018000400839');
                              },
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      );
    });
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('error url');
    }
  }
}
