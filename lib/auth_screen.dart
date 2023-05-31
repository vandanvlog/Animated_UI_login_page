import 'dart:math';

import 'package:animation_one/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'widgets/loginform.dart';
import 'widgets/singupform.dart';
import 'widgets/social_buttons.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  bool _isShowSignUp = false;
  late AnimationController _animationController;
  late Animation<double> _animationTextRotate;

  void setUpAnimation() {
    _animationController =
        AnimationController(vsync: this, duration: defualtDuration);

    _animationTextRotate =
        Tween<double>(begin: 0, end: 90).animate(_animationController);
  }

  void upDateView() {
    setState(() {
      _isShowSignUp = !_isShowSignUp;
    });
    _isShowSignUp
        ? _animationController.forward()
        : _animationController.reverse();
  }

  @override
  void initState() {
    setUpAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Scaffold(
      body: AnimatedBuilder(
          animation: _animationController,
          builder: (context, _) {
            return Stack(
              children: [
                AnimatedPositioned(
                  duration: defualtDuration,
                  width: _size.width * 0.88,
                  height: _size.height,
                  left: _isShowSignUp ? -_size.width * 0.76 : 0,
                  child: Container(
                    color: login_bg,
                    child: LoginForm(),
                  ),
                ),

                AnimatedPositioned(
                    duration: defualtDuration,
                    height: _size.height,
                    width: _size.width * 0.88,
                    left:
                    _isShowSignUp ? _size.width * 0.12 : _size.width * 0.88,
                    child: Container(
                      color: singin_bg,
                      child: SignUpForm(),
                    )),

                AnimatedPositioned(
                  duration: defualtDuration,
                  top: _size.height * 0.1,
                  left: 0,
                  right:
                      _isShowSignUp ? -_size.width * 0.06 : _size.width * 0.06,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white60,
                    child: AnimatedSwitcher(
                      duration: defualtDuration,
                      child: _isShowSignUp
                          ? SvgPicture.asset(
                              'assets/images/animation_logo.svg',
                              color: singin_bg,
                            )
                          : SvgPicture.asset(
                              'assets/images/animation_logo.svg',
                              color: login_bg,
                            ),
                    ),
                  ),
                ),

                AnimatedPositioned(
                    duration: defualtDuration,
                    bottom: _size.height * 0.1,
                    width: _size.width,
                    right: _isShowSignUp
                        ? -_size.width * 0.06
                        : _size.width * 0.06,
                    child: SocialButtns()),
                AnimatedPositioned(
                  duration: defualtDuration,
                  bottom: _isShowSignUp
                      ? _size.height / 2 - 80
                      : _size.height * 0.3,
                  left: _isShowSignUp ? 0 : _size.width * 0.44 - 80,
                  child: AnimatedDefaultTextStyle(
                    duration: defualtDuration,
                    style: TextStyle(
                        fontSize: _isShowSignUp ? 20 : 32,
                        fontWeight: FontWeight.bold,
                        color: _isShowSignUp ? Colors.white : Colors.white70),
                    child: Transform.rotate(
                      angle: -_animationTextRotate.value * pi / 180,
                      alignment: Alignment.topLeft,
                      child: InkWell(
                        onTap: upDateView,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: defualtPadding * 0.75),
                          width: 160,
                          child: Text(
                            "LogIN".toUpperCase(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: defualtDuration,
                  bottom: !_isShowSignUp
                      ? _size.height / 2 - 80
                      : _size.height * 0.3,
                  right: _isShowSignUp ? _size.width * 0.44 - 80 : 0,
                  child: AnimatedDefaultTextStyle(
                    duration: defualtDuration,
                    style: TextStyle(
                        fontSize: !_isShowSignUp ? 20 : 32,
                        fontWeight: FontWeight.bold,
                        color: _isShowSignUp ? Colors.white : Colors.white70),
                    child: Transform.rotate(
                      angle: (90 - _animationTextRotate.value) * pi / 180,
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: upDateView,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: defualtPadding * 0.75),
                          width: 160,
                          child: Text(
                            "Sing Up".toUpperCase(),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            );
          }),
    );
  }
}
