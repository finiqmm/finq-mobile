import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AnimatedLoadingButton extends StatefulWidget {
  final String title;
  final Function onPressed;
  final bool completeLoading;

  AnimatedLoadingButton(
      {required this.onPressed,
      required this.title,
      required this.completeLoading});

  @override
  _AnimatedLoadingButtonState createState() => _AnimatedLoadingButtonState();
}

class _AnimatedLoadingButtonState extends State<AnimatedLoadingButton> {
  bool _clicked = false;
  // double _opacity = 1.0;

  @override
  void initState() {
    super.initState();
    debugPrint('InitState ');
  }

  @override
  void didUpdateWidget(covariant AnimatedLoadingButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget == widget) return;
    setState(() {
      _clicked = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      InkWell(
        onTap: () {
          setState(() {
            _clicked = !_clicked;
            // _opacity = _opacity == 1.0 ? 0.0 : 0.0;
            widget.onPressed();
          });
        },
        child: AnimatedContainer(
          width: _clicked ? 55 : 300,
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_clicked ? 70.0 : 30.0),
            color: Theme.of(context).colorScheme.secondary,
          ),
          duration: Duration(milliseconds: 700),
          child: AnimatedOpacity(
            duration: Duration(milliseconds: 700),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    flex: 1,
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(FontAwesomeIcons.google,
                            color: Colors.white))),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 3,
                  child: Text(widget.title,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(color: Colors.white)),
                )
              ],
            ),
            opacity: _clicked ? 0 : 1,
          ),
        ),
      ),
      AnimatedContainer(
        duration: Duration(milliseconds: 700),
        width: _clicked ? 55 : 0,
        height: _clicked ? 45 : 0,
        curve: Curves.fastOutSlowIn,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(_clicked ? 70.0 : 30.0),
        ),
        child: AnimatedOpacity(
          duration: Duration(milliseconds: 700),
          child: Padding(
            child: CircularProgressIndicator(
                backgroundColor: Colors.blueAccent,
                valueColor: AlwaysStoppedAnimation<Color>(
                    _clicked ? Colors.pinkAccent : Colors.blueAccent)),
            padding: EdgeInsets.all(1),
          ),
          opacity: _clicked ? 1.0 : 0.0,
        ),
      )
    ]);
  }
}
