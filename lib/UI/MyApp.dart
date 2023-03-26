import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sae_flutter/UI/SplashScreen.dart';
import 'package:sae_flutter/models/FavoriteViewModel.dart';
import 'package:sae_flutter/models/SplashScreenRepository.dart';
import 'package:sae_flutter/models/SplashScreenViewModel.dart';


import '../models/SettingViewModel.dart';
import '../models/ArticleViewModel.dart';
import '../theme/mytheme.dart';
import 'home.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_){
            SettingViewModel settingViewModel = SettingViewModel();
            return settingViewModel;
          }),
        ChangeNotifierProvider(
          create: (_){
            ArticleViewModel taskViewModel = ArticleViewModel();
            taskViewModel.generateArticle();
            return taskViewModel;
          }),
        ChangeNotifierProvider(
          create: (_){
            FavoriteViewModel favoriteViewModel = FavoriteViewModel();
            return favoriteViewModel;
          }
        ),
        ChangeNotifierProvider(
          create: (_){
            SplashScreenViewModel splashScreenViewModel = SplashScreenViewModel();
            return splashScreenViewModel;
          }
        )
      ],
      child: Consumer<SettingViewModel>(
        builder: (context, settingViewModel, child){
          if (SplashScreenViewModel().isCoched) {
            return MaterialApp(
              title: 'TD2',
              theme: settingViewModel.isDark ? MyTheme.dark() : MyTheme.light(),
              home: Home(),
              debugShowCheckedModeBanner: false,
            );
          } else {
            return MaterialApp(
              title: 'TD2',
              theme: settingViewModel.isDark ? MyTheme.dark() : MyTheme.light(),
              home: SplashScreen(),
              debugShowCheckedModeBanner: false,
            );
          }
        },
      )
    );
  }

}