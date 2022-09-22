import 'dart:core';
import 'dart:math';

import 'package:flutter/material.dart';

// Padding
var _extrasSmallPaddingValue = 4.0;
var _smallPaddingValue = 6.0;
var _mediumPaddingValue = 8.0;
var _largePaddingValue = 12.0;
var _extraLargePaddingValue = 16.0;

// Card
var _cardElevationValue = 4.0;

// Icon
var _iconSmallSizeValue = 18.0;
var _iconMediumSizeValue = 24.0;
var _iconLargeSizeValue = 32.0;

// Text color
Color _customTextColor = Colors.orange;

void setQidgetsValues({
  double? extrasSmallPaddingValue,
  double? smallPaddingValue,
  double? mediumPaddingValue,
  double? largePaddingValue,
  double? extraLargePaddingValue,
  double? cardElevationValue,
  double? iconSmallSizeValue,
  double? iconMediumSizeValue,
  double? iconLargeSizeValue,
  Color? customTextColor,
}) {
  _extrasSmallPaddingValue = extrasSmallPaddingValue ?? _extrasSmallPaddingValue;
  _smallPaddingValue = smallPaddingValue ?? _smallPaddingValue;
  _mediumPaddingValue = mediumPaddingValue ?? _mediumPaddingValue;
  _largePaddingValue = largePaddingValue ?? _largePaddingValue;
  _extraLargePaddingValue = extraLargePaddingValue ?? _extraLargePaddingValue;
  _cardElevationValue = cardElevationValue ?? _cardElevationValue;
  _iconSmallSizeValue = iconSmallSizeValue ?? _iconSmallSizeValue;
  _iconMediumSizeValue = iconMediumSizeValue ?? _iconMediumSizeValue;
  _iconLargeSizeValue = iconLargeSizeValue ?? _iconLargeSizeValue;
  _customTextColor = customTextColor ?? _customTextColor;
}

extension _Theme on BuildContext {
  TextTheme get tt => Theme.of(this).textTheme;
  Color get pc => Theme.of(this).primaryColor;
}

extension _ColorStyle on TextStyle {
  TextStyle cc(Color? c) => copyWith(color: c);
}

extension QuickPaddingWidgets on Widget {
  Widget get extraSmallPadding => Padding(padding: EdgeInsets.all(_extrasSmallPaddingValue), child: this);
  Widget get smallPadding => Padding(padding: EdgeInsets.all(_smallPaddingValue), child: this);
  Widget get mediumPadding => Padding(padding: EdgeInsets.all(_mediumPaddingValue), child: this);
  Widget get largePadding => Padding(padding: EdgeInsets.all(_largePaddingValue), child: this);
  Widget get extraLargePadding => Padding(padding: EdgeInsets.all(_extraLargePaddingValue), child: this);
  Widget get wide => SizedBox(width: double.infinity, child: this);
  Widget get tall => SizedBox(height: double.infinity, child: this);
  Widget get width25 => FractionallySizedBox(widthFactor: 0.25, child: this);
  Widget get width33 => FractionallySizedBox(widthFactor: 0.33, child: this);
  Widget get width50 => FractionallySizedBox(widthFactor: 0.5, child: this);
  Widget get width66 => FractionallySizedBox(widthFactor: 0.66, child: this);
  Widget get width75 => FractionallySizedBox(widthFactor: 0.75, child: this);
  Widget get safeArea => SafeArea(child: this);
}

extension QuickWidgets on Widget {
  Widget get center => Center(child: this);
  Widget get card => Card(elevation: _cardElevationValue, child: this);
  Widget _border(double width) => Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black54, width: width)),
        child: this,
      );
  Widget get border => _border(1);
  Widget get border2 => _border(2);
  Widget get border3 => _border(3);
  Widget get rotatedCW90 => Transform.rotate(angle: pi / 2, child: this);
  Widget get rotatedCCW90 => Transform.rotate(angle: -pi / 2, child: this);
  Widget get rotated180 => Transform.rotate(angle: pi, child: this);
  Widget scale(double factor) => Transform(transform: Matrix4.diagonal3Values(factor, factor, factor), child: this);
  Widget future(Future future) => FutureBuilder(
      future: future,
      builder: (context, snapshot) => snapshot.connectionState == ConnectionState.done ? this : Container());
}

extension QuickState on State<dynamic> {
  void pop(BuildContext context) {
    Navigator.pop(context);
  }

  void popTo(BuildContext context, String name) {
    Navigator.popUntil(context, (route) => route.settings.name == name);
  }

  void popToRoot(BuildContext context) {
    Navigator.popUntil(context, (route) => route.settings.name == '/');
  }
}

extension QuickWidgetList on List<Widget> {
  Row get row => Row(children: this);
  Row get rowSpread => Row(children: this, mainAxisAlignment: MainAxisAlignment.spaceBetween);
  Row get rowCentered => Row(children: this, mainAxisAlignment: MainAxisAlignment.center);
  Row get rowEnd => Row(children: this, mainAxisAlignment: MainAxisAlignment.end);
  Row get rowMin => Row(children: this, mainAxisSize: MainAxisSize.min);
  Row get rowMax => Row(children: this, mainAxisAlignment: MainAxisAlignment.spaceBetween);
  Column get column => Column(children: this);
  Column get columnSpread => Column(children: this, mainAxisAlignment: MainAxisAlignment.spaceBetween);
  Column get columnCentered => Column(children: this, mainAxisAlignment: MainAxisAlignment.center);
  Column get columnEnd => Column(children: this, mainAxisAlignment: MainAxisAlignment.end);
  Column get columnMin => Column(children: this, mainAxisSize: MainAxisSize.min);
  ListView get listView => ListView(children: this);
  GridView grid(int columns, double aspectRatio) =>
      GridView.count(crossAxisCount: columns, childAspectRatio: aspectRatio, children: this);
  Widget get rowColumn => OrientationBuilder(
      builder: (context, orientation) => (orientation == Orientation.landscape)
          ? Row(children: this, crossAxisAlignment: CrossAxisAlignment.start)
          : column);
  Widget get rowColumnCentered => OrientationBuilder(
      builder: (context, orientation) => (orientation == Orientation.landscape) ? rowCentered : columnCentered);
  Widget get rowColumnEnd => OrientationBuilder(
      builder: (context, orientation) => (orientation == Orientation.landscape) ? rowEnd : columnEnd);
  Widget get rowColumnMin => OrientationBuilder(
      builder: (context, orientation) => (orientation == Orientation.landscape) ? rowMin : columnMin);
  Stack get stack => Stack(children: this);
}

extension QuickWidgetIterable on Iterable<Widget> {
  Row get row => Row(children: toList());
  Row get rowSpread => Row(children: toList(), mainAxisAlignment: MainAxisAlignment.spaceBetween);
  Row get rowCentered => Row(children: toList(), mainAxisAlignment: MainAxisAlignment.center);
  Row get rowEnd => Row(children: toList(), mainAxisAlignment: MainAxisAlignment.end);
  Row get rowMin => Row(children: toList(), mainAxisSize: MainAxisSize.min);
  Row get rowMax => Row(children: toList(), mainAxisAlignment: MainAxisAlignment.spaceBetween);
  Column get column => Column(children: toList());
  Column get columnSpread => Column(children: toList(), mainAxisAlignment: MainAxisAlignment.spaceBetween);
  Column get columnCentered => Column(children: toList(), mainAxisAlignment: MainAxisAlignment.center);
  Column get columnEnd => Column(children: toList(), mainAxisAlignment: MainAxisAlignment.end);
  Column get columnMin => Column(children: toList(), mainAxisSize: MainAxisSize.min);
  ListView get listView => ListView(children: toList());
  GridView grid(int columns, double aspectRatio) =>
      GridView.count(crossAxisCount: columns, childAspectRatio: aspectRatio, children: toList());
  Widget get rowColumn => OrientationBuilder(
      builder: (context, orientation) => (orientation == Orientation.landscape)
          ? Row(children: toList(), crossAxisAlignment: CrossAxisAlignment.start)
          : column);
  Widget get rowColumnCentered => OrientationBuilder(
      builder: (context, orientation) => (orientation == Orientation.landscape) ? rowCentered : columnCentered);
  Widget get rowColumnEnd => OrientationBuilder(
      builder: (context, orientation) => (orientation == Orientation.landscape) ? rowEnd : columnEnd);
  Widget get rowColumnMin => OrientationBuilder(
      builder: (context, orientation) => (orientation == Orientation.landscape) ? rowMin : columnMin);
  Stack get stack => Stack(children: toList());
}

extension QuickContainerWidgets on Widget {
  Widget get red => Container(color: Colors.red, child: this);
  Widget get green => Container(color: Colors.green, child: this);
  Widget get blue => Container(color: Colors.blue, child: this);
  Widget get lightBlue => Container(color: Colors.lightBlue, child: this);
  Widget get pink => Container(color: Colors.pink, child: this);
  Widget get purple => Container(color: Colors.purple, child: this);
  Widget get deepPurple => Container(color: Colors.deepPurple, child: this);
  Widget get yellow => Container(color: Colors.yellow, child: this);
  Widget get amber => Container(color: Colors.amber, child: this);
  Widget get grey => Container(color: Colors.grey, child: this);
  Widget get white => Container(color: Colors.white, child: this);
  Widget get white10 => Container(color: Colors.white10, child: this);
  Widget get white30 => Container(color: Colors.white30, child: this);
  Widget get white54 => Container(color: Colors.white54, child: this);
  Widget get white70 => Container(color: Colors.white70, child: this);
  Widget get black => Container(color: Colors.black, child: this);
  Widget get black12 => Container(color: Colors.black12, child: this);
  Widget get black38 => Container(color: Colors.black38, child: this);
  Widget get black54 => Container(color: Colors.black54, child: this);
  Widget get black87 => Container(color: Colors.black87, child: this);
  Widget appBarColor(BuildContext context) =>
      Container(color: Theme.of(context).appBarTheme.backgroundColor, child: this);

  Widget get smallRoundedCorners => ClipRRect(borderRadius: BorderRadius.circular(_smallPaddingValue), child: this);
  Widget get mediumRoundedCorners => ClipRRect(borderRadius: BorderRadius.circular(_mediumPaddingValue), child: this);
  Widget get largeRoundedCorners => ClipRRect(borderRadius: BorderRadius.circular(_largePaddingValue), child: this);
  Widget get circle => ClipOval(child: this);
  Widget get square => AspectRatio(aspectRatio: 1.0, child: this);
  Widget get goldenRatioLandscape => AspectRatio(aspectRatio: 1.618, child: this);
  Widget get goldenRatioPortrait => AspectRatio(aspectRatio: 0.618, child: this);
  Widget get container => Container(child: this);
  Widget get expanded => Expanded(child: this);
  Widget get expanded2 => Expanded(flex: 2, child: this);
  Widget get expanded3 => Expanded(flex: 3, child: this);
  Widget get flexible => Flexible(child: this);
  Widget get flexible2 => Flexible(flex: 2, child: this);
  Widget get flexible3 => Flexible(flex: 3, child: this);
  Widget get shrink => SizedBox.shrink(child: this);
  Widget get scaleDown => FittedBox(fit: BoxFit.scaleDown, child: this);
  Widget get alignTL => Align(alignment: Alignment.topLeft, child: this);
  Widget get alignTC => Align(alignment: Alignment.topCenter, child: this);
  Widget get alignTR => Align(alignment: Alignment.topRight, child: this);
  Widget get alignCL => Align(alignment: Alignment.centerLeft, child: this);
  Widget get alignCR => Align(alignment: Alignment.centerRight, child: this);
  Widget get alignBL => Align(alignment: Alignment.bottomLeft, child: this);
  Widget get alignBC => Align(alignment: Alignment.bottomCenter, child: this);
  Widget get alignBR => Align(alignment: Alignment.bottomRight, child: this);
  Widget get alignC => Align(alignment: Alignment.center, child: this);
  Widget ignore(bool ignore) => IgnorePointer(ignoring: ignore, child: this);
  Widget absorb(bool absorb) => AbsorbPointer(absorbing: absorb, child: this);
  Widget opacity(double opacity) => Opacity(opacity: opacity, child: this);
}

extension QuickTextStyles on TextStyle {
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);
  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);
}

extension QuickBuildContext on BuildContext {
  Color get primaryColor => Theme.of(this).primaryColor;
  Color get backgroundColor => Theme.of(this).backgroundColor;
  Brightness get brightness => Theme.of(this).brightness;
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
}

extension QuickButtons on Widget {
  Widget onTap(Function() onTap) => Material(child: InkWell(child: this, onTap: onTap), color: Colors.transparent);
  Widget on({void Function()? tap, void Function()? doubleTap, void Function()? longPress}) => Material(
        child: InkWell(
          child: this,
          onTap: tap,
          onDoubleTap: doubleTap,
          onLongPress: longPress,
        ),
        color: Colors.transparent,
      );
  Widget button(Function() onPressed) => ElevatedButton(
        onPressed: onPressed,
        child: this,
      );
  Widget transparentButton(Function() onPressed) => ElevatedButton(
        onPressed: onPressed,
        child: this,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
        ),
      );
}

Color? _iconColor;
Icon _iconWithColor(IconData data, double? size) {
  final color = _iconColor;
  _iconColor = null;
  return Icon(data, size: size, color: color);
}

extension QuickIcons on IconData {
  IconData get white {
    _iconColor = Colors.white;
    return this;
  }

  IconData get black {
    _iconColor = Colors.black;
    return this;
  }

  IconData get red {
    _iconColor = Colors.red;
    return this;
  }

  IconData get green {
    _iconColor = Colors.green;
    return this;
  }

  IconData get blue {
    _iconColor = Colors.blue;
    return this;
  }

  IconData get lightblue {
    _iconColor = Colors.lightBlue[200];
    return this;
  }

  IconData get orange {
    _iconColor = Colors.orange;
    return this;
  }

  IconData get pink {
    _iconColor = Colors.pink;
    return this;
  }

  IconData get purple {
    _iconColor = Colors.purple;
    return this;
  }

  IconData get amber {
    _iconColor = Colors.amber;
    return this;
  }

  Icon get icon => _iconWithColor(this, null);
  Icon get smallIcon => _iconWithColor(this, _iconSmallSizeValue);
  Icon get mediumIcon => _iconWithColor(this, _iconMediumSizeValue);
  Icon get largeIcon => _iconWithColor(this, _iconLargeSizeValue);
}

extension QuickTextWidgets on String {
  /// Wrap a string with a Text widget
  Widget get wText50 => Text(this, textScaleFactor: 0.5);
  Widget get wText75 => Text(this, textScaleFactor: 0.75);
  Widget get wText => Text(this);
  Widget get wText125 => Text(this, textScaleFactor: 1.25);
  Widget get wText150 => Text(this, textScaleFactor: 1.5);
  Widget get wText200 => Text(this, textScaleFactor: 2.0);

  Widget get wText50Mono => Text(this, textScaleFactor: 0.5, style: TextStyle(fontFamily: 'Courier'));
  Widget get wText75Mono => Text(this, textScaleFactor: 0.75, style: TextStyle(fontFamily: 'Courier'));
  Widget get wTextMono => Text(this, style: TextStyle(fontFamily: 'Courier'));
  Widget get wText125Mono => Text(this, textScaleFactor: 1.25, style: TextStyle(fontFamily: 'Courier'));
  Widget get wText150Mono => Text(this, textScaleFactor: 1.5, style: TextStyle(fontFamily: 'Courier'));
  Widget get wText200Mono => Text(this, textScaleFactor: 2.0, style: TextStyle(fontFamily: 'Courier'));

  Text wHeadline1(BuildContext context, {int? maxLines}) => Text(this, style: context.tt.headline1, maxLines: maxLines);
  Text wHeadline2(BuildContext context, {int? maxLines}) => Text(this, style: context.tt.headline2, maxLines: maxLines);
  Text wHeadline3(BuildContext context, {int? maxLines}) => Text(this, style: context.tt.headline3, maxLines: maxLines);
  Text wHeadline4(BuildContext context, {int? maxLines}) => Text(this, style: context.tt.headline4, maxLines: maxLines);
  Text wHeadline5(BuildContext context, {int? maxLines}) => Text(this, style: context.tt.headline5, maxLines: maxLines);
  Text wHeadline6(BuildContext context, {int? maxLines}) => Text(this, style: context.tt.headline6, maxLines: maxLines);
  Text wSubtitle1(BuildContext context, {int? maxLines}) => Text(this, style: context.tt.subtitle1, maxLines: maxLines);
  Text wSubtitle2(BuildContext context, {int? maxLines}) => Text(this, style: context.tt.subtitle2, maxLines: maxLines);
  Text wBodyText1(BuildContext context, {int? maxLines}) => Text(this, style: context.tt.bodyText1, maxLines: maxLines);
  Text wBodyText2(BuildContext context, {int? maxLines}) => Text(this, style: context.tt.bodyText2, maxLines: maxLines);

  Text wHeadline1Primary(BuildContext context, {int? maxLines}) =>
      Text(this, style: context.tt.headline1!.cc(context.pc), maxLines: maxLines);
  Text wHeadline2Primary(BuildContext context, {int? maxLines}) =>
      Text(this, style: context.tt.headline2!.cc(context.pc), maxLines: maxLines);
  Text wHeadline3Primary(BuildContext context, {int? maxLines}) =>
      Text(this, style: context.tt.headline3!.cc(context.pc), maxLines: maxLines);
  Text wHeadline4Primary(BuildContext context, {int? maxLines}) =>
      Text(this, style: context.tt.headline4!.cc(context.pc), maxLines: maxLines);
  Text wHeadline5Primary(BuildContext context, {int? maxLines}) =>
      Text(this, style: context.tt.headline5!.cc(context.pc), maxLines: maxLines);
  Text wHeadline6Primary(BuildContext context, {int? maxLines}) =>
      Text(this, style: context.tt.headline6!.cc(context.pc), maxLines: maxLines);
  Text wSubtitle1Primary(BuildContext context, {int? maxLines}) =>
      Text(this, style: context.tt.subtitle1!.cc(context.pc), maxLines: maxLines);
  Text wSubtitle2Primary(BuildContext context, {int? maxLines}) =>
      Text(this, style: context.tt.subtitle2!.cc(context.pc), maxLines: maxLines);
  Text wBodyText1Primary(BuildContext context, {int? maxLines}) =>
      Text(this, style: context.tt.bodyText1!.cc(context.pc), maxLines: maxLines);
  Text wBodyText2Primary(BuildContext context, {int? maxLines}) =>
      Text(this, style: context.tt.bodyText2!.cc(context.pc), maxLines: maxLines);

  Text wHeadline1Custom(BuildContext context, {int? maxLines}) =>
      Text(this, style: context.tt.headline1!.cc(_customTextColor), maxLines: maxLines);
  Text wHeadline2Custom(BuildContext context, {int? maxLines}) =>
      Text(this, style: context.tt.headline2!.cc(_customTextColor), maxLines: maxLines);
  Text wHeadline3Custom(BuildContext context, {int? maxLines}) =>
      Text(this, style: context.tt.headline3!.cc(_customTextColor), maxLines: maxLines);
  Text wHeadline4Custom(BuildContext context, {int? maxLines}) =>
      Text(this, style: context.tt.headline4!.cc(_customTextColor), maxLines: maxLines);
  Text wHeadline5Custom(BuildContext context, {int? maxLines}) =>
      Text(this, style: context.tt.headline5!.cc(_customTextColor), maxLines: maxLines);
  Text wHeadline6Custom(BuildContext context, {int? maxLines}) =>
      Text(this, style: context.tt.headline6!.cc(_customTextColor), maxLines: maxLines);
  Text wSubtitle1Custom(BuildContext context, {int? maxLines}) =>
      Text(this, style: context.tt.subtitle1!.cc(_customTextColor), maxLines: maxLines);
  Text wSubtitle2Custom(BuildContext context, {int? maxLines}) =>
      Text(this, style: context.tt.subtitle2!.cc(_customTextColor), maxLines: maxLines);
  Text wBodyText1Custom(BuildContext context, {int? maxLines}) =>
      Text(this, style: context.tt.bodyText1!.cc(_customTextColor), maxLines: maxLines);
  Text wBodyText2Custom(BuildContext context, {int? maxLines}) =>
      Text(this, style: context.tt.bodyText2!.cc(_customTextColor), maxLines: maxLines);
}

Widget quickSmallFiller() => SizedBox(width: _smallPaddingValue, height: _smallPaddingValue);
Widget quickMediumFiller() => SizedBox(width: _mediumPaddingValue, height: _mediumPaddingValue);
Widget quickLargeFiller() => SizedBox(width: _largePaddingValue, height: _largePaddingValue);

const Duration quickDuration10ms = Duration(milliseconds: 10);
const Duration quickDuration20ms = Duration(milliseconds: 20);
const Duration quickDuration30ms = Duration(milliseconds: 30);
const Duration quickDuration40ms = Duration(milliseconds: 40);
const Duration quickDuration50ms = Duration(milliseconds: 50);
const Duration quickDuration80ms = Duration(milliseconds: 80);
const Duration quickDuration100ms = Duration(milliseconds: 100);
const Duration quickDuration200ms = Duration(milliseconds: 200);
const Duration quickDuration300ms = Duration(milliseconds: 300);
const Duration quickDuration400ms = Duration(milliseconds: 400);
const Duration quickDuration500ms = Duration(milliseconds: 500);
const Duration quickDuration800ms = Duration(milliseconds: 800);
const Duration quickDuration1sec = Duration(seconds: 1);
const Duration quickDuration2sec = Duration(seconds: 2);
const Duration quickDuration3sec = Duration(seconds: 3);
const Duration quickDuration4sec = Duration(seconds: 4);
const Duration quickDuration5sec = Duration(seconds: 5);
const Duration quickDuration10sec = Duration(seconds: 10);
const Duration quickDuration20sec = Duration(seconds: 20);
const Duration quickDuration30sec = Duration(seconds: 30);

extension Retries on Function {
  void retry({int retries = 4, bool escalate = true, void Function()? onRetry}) {
    while (retries > 0) {
      try {
        this();
        return;
      } catch (_) {
        retries--;
        if (escalate && retries == 0) rethrow;
        onRetry?.call();
      }
    }
  }
}
