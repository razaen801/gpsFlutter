import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:adobe_xd/blend_mask.dart';
import 'package:flutter_svg/flutter_svg.dart';

class login extends StatelessWidget {
  login({
    required Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(start: 0.0, end: 0.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xff3676a7),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 209.0, start: 47.0),
            Pin(size: 22.0, middle: 0.2152),
            child: Text(
              'welcome to EZ to Track',
              style: TextStyle(
                fontFamily: 'Helvetica',
                fontSize: 20,
                color: const Color(0xffffffff),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 155.0, middle: 0.3171),
            Pin(size: 16.0, middle: 0.3077),
            child: Text(
              'Email/User Name/Mobile',
              style: TextStyle(
                fontFamily: 'Helvetica',
                fontSize: 14,
                color: const Color(0xffd8d7d7),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 254.0, start: 52.0),
            Pin(size: 30.0, middle: 0.3049),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17.0),
                border: Border.all(width: 1.0, color: const Color(0xffc4c4c4)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 254.0, start: 52.0),
            Pin(size: 30.0, middle: 0.4033),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17.0),
                border: Border.all(width: 1.0, color: const Color(0xffc4c4c4)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 123.0, middle: 0.5021),
            Pin(size: 30.0, middle: 0.5607),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17.0),
                color: const Color(0xff041167),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 49.0, middle: 0.5016),
            Pin(size: 22.0, middle: 0.5599),
            child: Text(
              'Login',
              style: TextStyle(
                fontFamily: 'Helvetica',
                fontSize: 20,
                color: const Color(0xffffffff),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 106.0, start: 28.0),
            Pin(size: 16.0, middle: 0.6603),
            child: Text(
              'Forget Password',
              style: TextStyle(
                fontFamily: 'Helvetica',
                fontSize: 14,
                color: const Color(0xffffffff),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 108.0, end: 35.0),
            Pin(size: 16.0, middle: 0.6603),
            child: Text(
              'External Tracking',
              style: TextStyle(
                fontFamily: 'Helvetica',
                fontSize: 14,
                color: const Color(0xffffffff),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 61.0, middle: 0.2174),
            Pin(size: 16.0, middle: 0.4038),
            child: Text(
              'Password',
              style: TextStyle(
                fontFamily: 'Helvetica',
                fontSize: 14,
                color: const Color(0xffd8d7d7),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 109.0, middle: 0.502),
            Pin(size: 38.0, middle: 0.7774),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11.0),
                color: const Color(0x70041167),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 53.0, middle: 0.5081),
            Pin(size: 22.0, middle: 0.7702),
            child: Text(
              'Demo',
              style: TextStyle(
                fontFamily: 'Helvetica',
                fontSize: 20,
                color: const Color(0xffffffff),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 13.0, middle: 0.5014),
            Pin(size: 14.0, end: 97.0),
            child: Text(
              'Or',
              style: TextStyle(
                fontFamily: 'Helvetica',
                fontSize: 12,
                color: const Color(0xffffffff),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 47.0, middle: 0.5016),
            Pin(size: 16.0, end: 59.0),
            child: Text(
              'Sign up',
              style: TextStyle(
                fontFamily: 'Helvetica',
                fontSize: 14,
                color: const Color(0xffffffff),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 117.0, start: 17.5),
            Pin(size: 1.0, end: 106.5),
            child: SvgPicture.string(
              _svg_g5rs8r,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 190.0, middle: 0.5),
            Pin(size: 28.0, end: 55.0),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(start: -46.0, end: -139.0),
                  Pin(start: -162.0, end: -123.0),
                  child:
                      // Adobe XD layer: 'Layer 0' (shape)
                      BlendMask(
                    blendMode: BlendMode.colorBurn,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: const AssetImage(
                              'assets/images/nepal_map_background.png'),
                          fit: BoxFit.fill,
                          colorFilter: new ColorFilter.mode(
                              Colors.black.withOpacity(0.34), BlendMode.dstIn),
                        ),
                      ),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(start: 0.0, end: 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11.0),
                      color: const Color(0xff041167),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 117.0, end: 15.5),
            Pin(size: 1.0, end: 106.5),
            child: SvgPicture.string(
              _svg_c1jy0r,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 62.0, middle: 0.5),
            Pin(size: 81.0, start: 7.0),
            child:
                // Adobe XD layer: 'logo' (shape)
                Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/ic_logo.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_g5rs8r =
    '<svg viewBox="17.5 532.5 117.0 1.0" ><path transform="translate(17.5, 532.5)" d="M 0 0 L 117 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_c1jy0r =
    '<svg viewBox="227.5 532.5 117.0 1.0" ><path transform="translate(227.5, 532.5)" d="M 0 0 L 117 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
