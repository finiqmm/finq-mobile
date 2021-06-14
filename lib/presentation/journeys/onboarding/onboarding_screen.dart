import 'package:finq/common/constants/route_constants.dart';
import 'package:finq/di/get_it.dart';
import 'package:finq/presentation/bloc/onboarding/onboarding_bloc.dart';
import 'package:finq/presentation/journeys/onboarding/onboarding_ui_model.dart';
import 'package:finq/presentation/journeys/onboarding/onboarding_item.dart';
import 'package:finq/presentation/journeys/onboarding/onboarding_page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentPage = 0;
  late PageController _pageController;
  late final OnboardingBloc _onboardingBloc;

  @override
  void initState() {
    super.initState();
    _onboardingBloc = getItInstance<OnboardingBloc>();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _onboardingBloc.close();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => _onboardingBloc,
        child: Scaffold(
          body: Stack(
            children: [
              Container(
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.1, 0.4, 0.7, 0.9],
                    colors: [
                      Color(0xFF3594DD),
                      Color(0xFF4563DB),
                      Color(0xFF5036D5),
                      Color(0xFF5B16D0),
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      BlocListener<OnboardingBloc, OnboardingState>(
                        listenWhen: (previous, current) =>
                            current is OnboardingFinished,
                        listener: (context, state) {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              RouteList.login, (route) => false);
                        },
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () => {
                              _onboardingBloc.add(OnboardingFinishedEvent())
                              // BlocProvider.of<OnboardingBloc>(context)
                              //     .add(OnboardingFinishedEvent())
                            },
                            child: Text(
                              'Skip',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 550,
                        child: PageView(
                            scrollDirection: Axis.horizontal,
                            controller: _pageController,
                            physics: ClampingScrollPhysics(),
                            onPageChanged: (int page) {
                              setState(() {
                                _currentPage = page;
                              });
                            },
                            children: onboardingItemList
                                .map((e) => OnboaringItem(onboarding: e))
                                .toList()),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          OnboardingPageIndicator(isActive: _currentPage == 0),
                          OnboardingPageIndicator(isActive: _currentPage == 1),
                          OnboardingPageIndicator(isActive: _currentPage == 2)
                        ],
                      ),
                      _currentPage != onboardingItemList.length - 1
                          ? Expanded(
                              flex: 1,
                              child: Align(
                                alignment: FractionalOffset.bottomRight,
                                child: TextButton(
                                  onPressed: () {
                                    _pageController.nextPage(
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.ease,
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Text(
                                        'Next',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22.0,
                                        ),
                                      ),
                                      SizedBox(width: 10.0),
                                      Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                        size: 30.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : SizedBox.shrink(),
                    ],
                  ),
                ),
              ),
              if (_currentPage == onboardingItemList.length - 1)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: () {
                      BlocProvider.of<OnboardingBloc>(context)
                          .add(OnboardingFinishedEvent());
                    },
                    child: Container(
                      height: 55,
                      width: double.infinity,
                      color: Colors.white,
                      child: Center(
                        child: Text(
                          'Get started',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF5B16D0)),
                        ),
                      ),
                    ),
                  ),
                ),
              if (_currentPage == onboardingItemList.length - 1)
                BlocListener<OnboardingBloc, OnboardingState>(
                  listenWhen: (previous, current) =>
                      current is OnboardingFinished,
                  listener: (context, state) {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        RouteList.login, (route) => false);
                  },
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: GestureDetector(
                      onTap: () {
                        _onboardingBloc.add(OnboardingFinishedEvent());
                      },
                      child: Container(
                        height: 55,
                        width: double.infinity,
                        color: Colors.white,
                        child: Center(
                          child: Text(
                            'Get started',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF5B16D0)),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
            ],
          ),
        ));
  }
}
