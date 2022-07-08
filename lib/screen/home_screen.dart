import 'package:covid_19_flutter/constants.dart';
import 'package:covid_19_flutter/screen/details_screen.dart';
import 'package:covid_19_flutter/widgets/info_card.dart';
import 'package:covid_19_flutter/widgets/prevention_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        children: [
          Container(
            padding:
                const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 40),
            width: double.infinity,
            decoration: BoxDecoration(
              color: kPrimaryColor.withOpacity(.03),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Wrap(
              runSpacing: 20,
              spacing: 20,
              children: [
                InfoCard(
                  title: "Confirmed Cases",
                  iconColor: Color(0xFFFF8C00),
                  effectedNum: 1062,
                  onPress: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const DetailsScreen();
                      },
                    ));
                  },
                ),
                InfoCard(
                  title: "Total Deaths",
                  iconColor: Color(0xFFFF2D55),
                  effectedNum: 75,
                  onPress: () {},
                ),
                InfoCard(
                  title: "Total Recovered",
                  iconColor: Color(0xFF50E3C2),
                  effectedNum: 689,
                  onPress: () {},
                ),
                InfoCard(
                  title: "New Cases",
                  iconColor: Color(0xFF5856D6),
                  effectedNum: 75,
                  onPress: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Preventions",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  buildPreventionCard(),
                  const SizedBox(height: 40),
                  buildHelpCard(context),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Row buildPreventionCard() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        PreventionCard(
          svgSrc: "assets/icons/hand_wash.svg",
          title: "Wash Hands",
        ),
        PreventionCard(
          svgSrc: "assets/icons/use_mask.svg",
          title: "Use Mask",
        ),
        PreventionCard(
          svgSrc: "assets/icons/Clean_Disinfect.svg",
          title: "Clean Disinfect",
        ),
      ],
    );
  }

  SizedBox buildHelpCard(BuildContext context) {
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * .42,
              top: 20,
              right: 20,
            ),
            height: 130,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF60BE93),
                  Color(0xFF1B8D59),
                ],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Dial 999 for Medical Help!\n",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: Colors.white),
                  ),
                  TextSpan(
                    text: "If any symptoms appear",
                    style: TextStyle(
                      color: Colors.white.withOpacity(.7),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: SvgPicture.asset("assets/icons/nurse.svg"),
          ),
          Positioned(
            top: 30,
            right: 10,
            child: SvgPicture.asset("assets/icons/virus.svg"),
          )
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor.withOpacity(.03),
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/menu.svg"),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: SvgPicture.asset("assets/icons/search.svg"),
          onPressed: () {},
        )
      ],
    );
  }
}
