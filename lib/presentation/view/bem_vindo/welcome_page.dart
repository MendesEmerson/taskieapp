import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskieapp/presentation/comuns/constants/images.dart';
import 'package:taskieapp/presentation/comuns/constants/strings.dart';
import 'package:taskieapp/presentation/routes/nav_routes.dart';
import 'package:taskieapp/presentation/widgets/custom_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImagesPath.backgroundSplashScreen),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: SvgPicture.asset(
                ImagesPath.logo,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    StringsConstants.organize,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                    ),
                  ),
                  Text(
                    StringsConstants.simplifique,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                    ),
                  ),
                  Text(
                    StringsConstants.conquiste,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    StringsConstants.textHomePage,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomButtonWidget(
                  width: MediaQuery.of(context).size.width * 0.8,
                  onClick: () {
                    Navigator.pushNamed(
                      context,
                      NavRoutes.loginPage,
                    );
                  },
                  text: StringsConstants.login,
                ),
                const SizedBox(
                  height: 12,
                ),
                CustomButtonWidget(
                  width: MediaQuery.of(context).size.width * 0.8,
                  onClick: () {
                    Navigator.pushNamed(
                      context,
                      NavRoutes.cadastroPage,
                    );
                  },
                  text: StringsConstants.cadastro,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
