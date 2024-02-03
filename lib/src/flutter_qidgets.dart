import 'dart:core';
import 'dart:math';

import 'package:flutter/material.dart';

// Default Text
double _defaultTextScaleFactor = 1.0;

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

// Mono font family
var _monoFontFamily = 'Courier';

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
  String? monoFontFamily,
  double? defaultTextScaleFactor,
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
  _monoFontFamily = monoFontFamily ?? _monoFontFamily;
  _defaultTextScaleFactor = defaultTextScaleFactor ?? _defaultTextScaleFactor;
}

double qidgetsDoubleValue(String key) {
  switch (key) {
    case 'extrasSmallPaddingValue':
      return _extrasSmallPaddingValue;
    case 'smallPaddingValue':
      return _smallPaddingValue;
    case 'mediumPaddingValue':
      return _mediumPaddingValue;
    case 'largePaddingValue':
      return _largePaddingValue;
    case 'extraLargePaddingValue':
      return _extraLargePaddingValue;
    case 'cardElevationValue':
      return _cardElevationValue;
    case 'iconSmallSizeValue':
      return _iconSmallSizeValue;
    case 'iconMediumSizeValue':
      return _iconMediumSizeValue;
    case 'iconLargeSizeValue':
      return _iconLargeSizeValue;
    case 'defaultTextScaleFactor':
      return _defaultTextScaleFactor;
    default:
      throw Exception('Unknown key: $key');
  }
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
  Widget get extraSmallVPadding =>
      Padding(padding: EdgeInsets.symmetric(vertical: _extrasSmallPaddingValue), child: this);
  Widget get smallVPadding => Padding(padding: EdgeInsets.symmetric(vertical: _smallPaddingValue), child: this);
  Widget get mediumVPadding => Padding(padding: EdgeInsets.symmetric(vertical: _mediumPaddingValue), child: this);
  Widget get largeVPadding => Padding(padding: EdgeInsets.symmetric(vertical: _largePaddingValue), child: this);
  Widget get extraLargeVPadding =>
      Padding(padding: EdgeInsets.symmetric(vertical: _extraLargePaddingValue), child: this);
  Widget get extraSmallHPadding =>
      Padding(padding: EdgeInsets.symmetric(horizontal: _extrasSmallPaddingValue), child: this);
  Widget get smallHPadding => Padding(padding: EdgeInsets.symmetric(horizontal: _smallPaddingValue), child: this);
  Widget get mediumHPadding => Padding(padding: EdgeInsets.symmetric(horizontal: _mediumPaddingValue), child: this);
  Widget get largeHPadding => Padding(padding: EdgeInsets.symmetric(horizontal: _largePaddingValue), child: this);
  Widget get extraLargeHPadding =>
      Padding(padding: EdgeInsets.symmetric(horizontal: _extraLargePaddingValue), child: this);
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
  Widget scale(double factor, {AlignmentGeometry alignment = Alignment.center}) => Transform(
        transform: Matrix4.diagonal3Values(factor, factor, factor),
        alignment: alignment,
        child: this,
      );
  Widget future(Future future) => FutureBuilder(
      future: future,
      builder: (context, snapshot) => snapshot.connectionState == ConnectionState.done ? this : Container());
}

extension QuickState on State<dynamic> {
  void pop() {
    Navigator.pop(context);
  }

  void popTo(String name) {
    Navigator.popUntil(context, (route) => route.settings.name == name);
  }

  void popToRoot() {
    Navigator.popUntil(context, (route) => route.settings.name == '/');
  }
}

extension QuickWidgetList on List<Widget> {
  Row get row => Row(children: this);
  Row get rowSpread => Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: this);
  Row get rowCentered => Row(mainAxisAlignment: MainAxisAlignment.center, children: this);
  Row get rowEnd => Row(mainAxisAlignment: MainAxisAlignment.end, children: this);
  Row get rowMin => Row(mainAxisSize: MainAxisSize.min, children: this);
  Row get rowMax => Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: this);
  Column get column => Column(children: this);
  Column get columnSpread => Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: this);
  Column get columnCentered => Column(mainAxisAlignment: MainAxisAlignment.center, children: this);
  Column get columnEnd => Column(mainAxisAlignment: MainAxisAlignment.end, children: this);
  Column get columnMin => Column(mainAxisSize: MainAxisSize.min, children: this);
  ListView get listView => ListView(children: this);
  GridView grid(int columns, double aspectRatio) =>
      GridView.count(crossAxisCount: columns, childAspectRatio: aspectRatio, children: this);
  Widget get rowColumn => OrientationBuilder(
      builder: (context, orientation) => (orientation == Orientation.landscape)
          ? Row(crossAxisAlignment: CrossAxisAlignment.start, children: this)
          : column);
  Widget get rowColumnCentered => OrientationBuilder(
      builder: (context, orientation) => (orientation == Orientation.landscape) ? rowCentered : columnCentered);
  Widget get rowColumnEnd => OrientationBuilder(
      builder: (context, orientation) => (orientation == Orientation.landscape) ? rowEnd : columnEnd);
  Widget get rowColumnMin => OrientationBuilder(
      builder: (context, orientation) => (orientation == Orientation.landscape) ? rowMin : columnMin);
  Widget get wrap => Wrap(children: this);
  Widget get stack => Stack(children: this);
}

extension QuickWidgetIterable on Iterable<Widget> {
  Row get row => Row(children: toList());
  Row get rowSpread => Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: toList());
  Row get rowSpreadEvenly => Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: toList());
  Row get rowCentered => Row(mainAxisAlignment: MainAxisAlignment.center, children: toList());
  Row get rowEnd => Row(mainAxisAlignment: MainAxisAlignment.end, children: toList());
  Row get rowMin => Row(mainAxisSize: MainAxisSize.min, children: toList());
  Row get rowMax => Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: toList());
  Column get column => Column(children: toList());
  Column get columnSpread => Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: toList());
  Column get columnSpreadEvenly => Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: toList());
  Column get columnCentered => Column(mainAxisAlignment: MainAxisAlignment.center, children: toList());
  Column get columnEnd => Column(mainAxisAlignment: MainAxisAlignment.end, children: toList());
  Column get columnMin => Column(mainAxisSize: MainAxisSize.min, children: toList());
  ListView get listView => ListView(children: toList());
  GridView grid(int columns, double aspectRatio) =>
      GridView.count(crossAxisCount: columns, childAspectRatio: aspectRatio, children: toList());
  Widget get rowColumn => OrientationBuilder(
      builder: (context, orientation) => (orientation == Orientation.landscape)
          ? Row(crossAxisAlignment: CrossAxisAlignment.start, children: toList())
          : column);
  Widget get rowColumnCentered => OrientationBuilder(
      builder: (context, orientation) => (orientation == Orientation.landscape) ? rowCentered : columnCentered);
  Widget get rowColumnEnd => OrientationBuilder(
      builder: (context, orientation) => (orientation == Orientation.landscape) ? rowEnd : columnEnd);
  Widget get rowColumnMin => OrientationBuilder(
      builder: (context, orientation) => (orientation == Orientation.landscape) ? rowMin : columnMin);
  Widget get wrap => Wrap(children: toList());
  Widget get stack => Stack(children: toList());
  List<Widget> inject(BuildContext context, Widget Function(BuildContext context, int index) builder) =>
      List.generate(length * 2 - 1, (index) => index.isEven ? elementAt(index ~/ 2) : builder(context, index ~/ 2));
  List<Widget> injectSmallFillers(BuildContext context) => inject(context, (_, __) => quickSmallFiller());
  List<Widget> injectMediumFillers(BuildContext context) => inject(context, (_, __) => quickMediumFiller());
  List<Widget> injectLargeFillers(BuildContext context) => inject(context, (_, __) => quickLargeFiller());
}

extension QuickContainerWidgets on Widget {
  Widget get red => Container(color: Colors.red, child: this);
  Widget get lightGreen => Container(color: Colors.lightGreen, child: this);
  Widget get green => Container(color: Colors.green, child: this);
  Widget get darkGreen => Container(color: Colors.green.darken(0.5), child: this);
  Widget get blue => Container(color: Colors.blue, child: this);
  Widget get lightBlue => Container(color: Colors.lightBlue, child: this);
  Widget get darkBlue => Container(color: Colors.blue.darken(0.5), child: this);
  Widget get yellow => Container(color: Colors.yellow, child: this);
  Widget get purple => Container(color: Colors.purple, child: this);
  Widget get deepPurple => Container(color: Colors.deepPurple, child: this);
  Widget get cyan => Container(color: Colors.cyan, child: this);
  Widget get orange => Container(color: Colors.orange, child: this);
  Widget get pink => Container(color: Colors.pink, child: this);
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
  Widget width(double width) => SizedBox(width: width, child: this);
  Widget height(double height) => SizedBox(height: height, child: this);
  Widget sized({required double width, required double height}) => SizedBox(width: width, height: height, child: this);
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
  Color get backgroundColor => Theme.of(this).scaffoldBackgroundColor;
  Brightness get brightness => Theme.of(this).brightness;
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
}

extension QuickButtons on Widget {
  Widget onTap(Function()? onTap) => Material(color: Colors.transparent, child: InkWell(onTap: onTap, child: this));
  Widget on({void Function()? tap, void Function()? doubleTap, void Function()? longPress}) => Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: tap,
          onDoubleTap: doubleTap,
          onLongPress: longPress,
          child: this,
        ),
      );
  Widget button(Function()? onPressed) => ElevatedButton(
        onPressed: onPressed,
        child: this,
      );
  Widget transparentButton(Function()? onPressed) => ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
        ),
        child: this,
      );
}

Color? _iconColor;
Icon _iconWithColor(IconData data, double? size) {
  final color = _iconColor;
  _iconColor = null;
  return Icon(data, size: size, color: color);
}

extension QuickIcons on IconData {
  IconData color(Color color) {
    _iconColor = color;
    return this;
  }

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

  IconData get lightGreen {
    _iconColor = Colors.lightGreen;
    return this;
  }

  IconData get green {
    _iconColor = Colors.green;
    return this;
  }

  IconData get darkGreen {
    _iconColor = Colors.green.darken(0.5);
    return this;
  }

  IconData get lightblue {
    _iconColor = Colors.lightBlue;
    return this;
  }

  IconData get blue {
    _iconColor = Colors.blue;
    return this;
  }

  IconData get darkBlue {
    _iconColor = Colors.blue.darken(0.5);
    return this;
  }

  IconData get yellow {
    _iconColor = Colors.yellow;
    return this;
  }

  IconData get purple {
    _iconColor = Colors.purple;
    return this;
  }

  IconData get cyan {
    _iconColor = Colors.cyan;
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
  Widget get wText50 => Text(this, textScaleFactor: 0.5 * _defaultTextScaleFactor);
  Widget get wText75 => Text(this, textScaleFactor: 0.75 * _defaultTextScaleFactor);
  Widget get wText => Text(this, textScaler: TextScaler.linear(_defaultTextScaleFactor));
  Widget get wText125 => Text(this, textScaleFactor: 1.25 * _defaultTextScaleFactor);
  Widget get wText150 => Text(this, textScaleFactor: 1.5 * _defaultTextScaleFactor);
  Widget get wText200 => Text(this, textScaleFactor: 2.0 * _defaultTextScaleFactor);

  Widget get wText50Mono =>
      Text(this, textScaleFactor: 0.5 * _defaultTextScaleFactor, style: TextStyle(fontFamily: _monoFontFamily));
  Widget get wText75Mono =>
      Text(this, textScaleFactor: 0.75 * _defaultTextScaleFactor, style: TextStyle(fontFamily: _monoFontFamily));
  Widget get wTextMono =>
      Text(this, textScaler: TextScaler.linear(_defaultTextScaleFactor), style: TextStyle(fontFamily: _monoFontFamily));
  Widget get wText125Mono =>
      Text(this, textScaleFactor: 1.25 * _defaultTextScaleFactor, style: TextStyle(fontFamily: _monoFontFamily));
  Widget get wText150Mono =>
      Text(this, textScaleFactor: 1.5 * _defaultTextScaleFactor, style: TextStyle(fontFamily: _monoFontFamily));
  Widget get wText200Mono =>
      Text(this, textScaleFactor: 2.0 * _defaultTextScaleFactor, style: TextStyle(fontFamily: _monoFontFamily));

  Text wDisplayLarge(BuildContext context, {int? maxLines}) => Text(this,
      textScaler: TextScaler.linear(_defaultTextScaleFactor), style: context.tt.displayLarge, maxLines: maxLines);
  Text wDisplayMedium(BuildContext context, {int? maxLines}) => Text(this,
      textScaler: TextScaler.linear(_defaultTextScaleFactor), style: context.tt.displayMedium, maxLines: maxLines);
  Text wDisplaySmall(BuildContext context, {int? maxLines}) => Text(this,
      textScaler: TextScaler.linear(_defaultTextScaleFactor), style: context.tt.displaySmall, maxLines: maxLines);
  Text wHeadlineLarge(BuildContext context, {int? maxLines}) => Text(this,
      textScaler: TextScaler.linear(_defaultTextScaleFactor), style: context.tt.headlineLarge, maxLines: maxLines);
  Text wHeadlineMedium(BuildContext context, {int? maxLines}) => Text(this,
      textScaler: TextScaler.linear(_defaultTextScaleFactor), style: context.tt.headlineMedium, maxLines: maxLines);
  Text wHeadlineSmall(BuildContext context, {int? maxLines}) => Text(this,
      textScaler: TextScaler.linear(_defaultTextScaleFactor), style: context.tt.headlineSmall, maxLines: maxLines);
  Text wTitleLarge(BuildContext context, {int? maxLines}) => Text(this,
      textScaler: TextScaler.linear(_defaultTextScaleFactor), style: context.tt.titleLarge, maxLines: maxLines);
  Text wTitleMedium(BuildContext context, {int? maxLines}) => Text(this,
      textScaler: TextScaler.linear(_defaultTextScaleFactor), style: context.tt.titleMedium, maxLines: maxLines);
  Text wTitleSmall(BuildContext context, {int? maxLines}) => Text(this,
      textScaler: TextScaler.linear(_defaultTextScaleFactor), style: context.tt.titleSmall, maxLines: maxLines);
  Text wBodyLarge(BuildContext context, {int? maxLines}) => Text(this,
      textScaler: TextScaler.linear(_defaultTextScaleFactor), style: context.tt.bodyLarge, maxLines: maxLines);
  Text wBodyMedium(BuildContext context, {int? maxLines}) => Text(this,
      textScaler: TextScaler.linear(_defaultTextScaleFactor), style: context.tt.bodyMedium, maxLines: maxLines);
  Text wBodySmall(BuildContext context, {int? maxLines}) => Text(this,
      textScaler: TextScaler.linear(_defaultTextScaleFactor), style: context.tt.bodySmall, maxLines: maxLines);
  Text wLabelLarge(BuildContext context, {int? maxLines}) => Text(this,
      textScaler: TextScaler.linear(_defaultTextScaleFactor), style: context.tt.labelLarge, maxLines: maxLines);
  Text wLabelMedium(BuildContext context, {int? maxLines}) => Text(this,
      textScaler: TextScaler.linear(_defaultTextScaleFactor), style: context.tt.labelMedium, maxLines: maxLines);
  Text wLabelSmall(BuildContext context, {int? maxLines}) => Text(this,
      textScaler: TextScaler.linear(_defaultTextScaleFactor), style: context.tt.labelSmall, maxLines: maxLines);

  Text wDisplayLargePrimary(BuildContext context, {int? maxLines}) => Text(this,
      textScaler: TextScaler.linear(_defaultTextScaleFactor),
      style: context.tt.displayLarge!.cc(context.pc),
      maxLines: maxLines);
  Text wDisplayMediumPrimary(BuildContext context, {int? maxLines}) => Text(this,
      textScaler: TextScaler.linear(_defaultTextScaleFactor),
      style: context.tt.displayMedium!.cc(context.pc),
      maxLines: maxLines);
  Text wDisplaySmallPrimary(BuildContext context, {int? maxLines}) => Text(this,
      textScaler: TextScaler.linear(_defaultTextScaleFactor),
      style: context.tt.displaySmall!.cc(context.pc),
      maxLines: maxLines);
  Text wHeadlineLargePrimary(BuildContext context, {int? maxLines}) => Text(this,
      textScaler: TextScaler.linear(_defaultTextScaleFactor),
      style: context.tt.headlineLarge!.cc(context.pc),
      maxLines: maxLines);
  Text wHeadlineMediumPrimary(BuildContext context, {int? maxLines}) => Text(this,
      textScaler: TextScaler.linear(_defaultTextScaleFactor),
      style: context.tt.headlineMedium!.cc(context.pc),
      maxLines: maxLines);
  Text wHeadlineSmallPrimary(BuildContext context, {int? maxLines}) => Text(this,
      textScaler: TextScaler.linear(_defaultTextScaleFactor),
      style: context.tt.headlineSmall!.cc(context.pc),
      maxLines: maxLines);
  Text wTitleLargePrimary(BuildContext context, {int? maxLines}) => Text(this,
      textScaler: TextScaler.linear(_defaultTextScaleFactor),
      style: context.tt.titleLarge!.cc(context.pc),
      maxLines: maxLines);
  Text wTitleMediumPrimary(BuildContext context, {int? maxLines}) => Text(this,
      textScaler: TextScaler.linear(_defaultTextScaleFactor),
      style: context.tt.titleMedium!.cc(context.pc),
      maxLines: maxLines);
  Text wTitleSmallPrimary(BuildContext context, {int? maxLines}) => Text(this,
      textScaler: TextScaler.linear(_defaultTextScaleFactor),
      style: context.tt.titleSmall!.cc(context.pc),
      maxLines: maxLines);
  Text wBodyLargePrimary(BuildContext context, {int? maxLines}) => Text(this,
      textScaler: TextScaler.linear(_defaultTextScaleFactor),
      style: context.tt.bodyLarge!.cc(context.pc),
      maxLines: maxLines);
  Text wBodyMediumPrimary(BuildContext context, {int? maxLines}) => Text(this,
      textScaler: TextScaler.linear(_defaultTextScaleFactor),
      style: context.tt.bodyMedium!.cc(context.pc),
      maxLines: maxLines);
  Text wBodySmallPrimary(BuildContext context, {int? maxLines}) => Text(this,
      textScaler: TextScaler.linear(_defaultTextScaleFactor),
      style: context.tt.bodySmall!.cc(context.pc),
      maxLines: maxLines);
  Text wLabelLargePrimary(BuildContext context, {int? maxLines}) => Text(this,
      textScaler: TextScaler.linear(_defaultTextScaleFactor),
      style: context.tt.labelLarge!.cc(context.pc),
      maxLines: maxLines);
  Text wLabelMediumPrimary(BuildContext context, {int? maxLines}) => Text(this,
      textScaler: TextScaler.linear(_defaultTextScaleFactor),
      style: context.tt.labelMedium!.cc(context.pc),
      maxLines: maxLines);
  Text wLabelSmallPrimary(BuildContext context, {int? maxLines}) => Text(this,
      textScaler: TextScaler.linear(_defaultTextScaleFactor),
      style: context.tt.labelSmall!.cc(context.pc),
      maxLines: maxLines);

  Text wDisplayLargeCustom(BuildContext context, {int? maxLines}) => Text(this,
      textScaler: TextScaler.linear(_defaultTextScaleFactor),
      style: context.tt.displayLarge!.cc(_customTextColor),
      maxLines: maxLines);
  Text wDisplayMediumCustom(BuildContext context, {int? maxLines}) => Text(this,
      textScaler: TextScaler.linear(_defaultTextScaleFactor),
      style: context.tt.displayMedium!.cc(_customTextColor),
      maxLines: maxLines);
  Text wDisplaySmallCustom(BuildContext context, {int? maxLines}) => Text(this,
      textScaler: TextScaler.linear(_defaultTextScaleFactor),
      style: context.tt.displaySmall!.cc(_customTextColor),
      maxLines: maxLines);
  Text wHeadlineLargeCustom(BuildContext context, {int? maxLines}) => Text(this,
      textScaler: TextScaler.linear(_defaultTextScaleFactor),
      style: context.tt.headlineLarge!.cc(_customTextColor),
      maxLines: maxLines);
  Text wHeadlineMediumCustom(BuildContext context, {int? maxLines}) => Text(this,
      textScaler: TextScaler.linear(_defaultTextScaleFactor),
      style: context.tt.headlineMedium!.cc(_customTextColor),
      maxLines: maxLines);
  Text wHeadlineSmallCustom(BuildContext context, {int? maxLines}) => Text(this,
      textScaler: TextScaler.linear(_defaultTextScaleFactor),
      style: context.tt.headlineSmall!.cc(_customTextColor),
      maxLines: maxLines);
  Text wTitleLargeCustom(BuildContext context, {int? maxLines}) => Text(this,
      textScaler: TextScaler.linear(_defaultTextScaleFactor),
      style: context.tt.titleLarge!.cc(_customTextColor),
      maxLines: maxLines);
  Text wTitleMediumCustom(BuildContext context, {int? maxLines}) => Text(this,
      textScaler: TextScaler.linear(_defaultTextScaleFactor),
      style: context.tt.titleMedium!.cc(_customTextColor),
      maxLines: maxLines);
  Text wTitleSmallCustom(BuildContext context, {int? maxLines}) => Text(this,
      textScaler: TextScaler.linear(_defaultTextScaleFactor),
      style: context.tt.titleSmall!.cc(_customTextColor),
      maxLines: maxLines);
  Text wBodyLargeCustom(BuildContext context, {int? maxLines}) => Text(this,
      textScaler: TextScaler.linear(_defaultTextScaleFactor),
      style: context.tt.bodyLarge!.cc(_customTextColor),
      maxLines: maxLines);
  Text wBodyMediumCustom(BuildContext context, {int? maxLines}) => Text(this,
      textScaler: TextScaler.linear(_defaultTextScaleFactor),
      style: context.tt.bodyMedium!.cc(_customTextColor),
      maxLines: maxLines);
  Text wBodySmallCustom(BuildContext context, {int? maxLines}) => Text(this,
      textScaler: TextScaler.linear(_defaultTextScaleFactor),
      style: context.tt.bodySmall!.cc(_customTextColor),
      maxLines: maxLines);
  Text wLabelLargeCustom(BuildContext context, {int? maxLines}) => Text(this,
      textScaler: TextScaler.linear(_defaultTextScaleFactor),
      style: context.tt.labelLarge!.cc(_customTextColor),
      maxLines: maxLines);
  Text wLabelMediumCustom(BuildContext context, {int? maxLines}) => Text(this,
      textScaler: TextScaler.linear(_defaultTextScaleFactor),
      style: context.tt.labelMedium!.cc(_customTextColor),
      maxLines: maxLines);
  Text wLabelSmallCustom(BuildContext context, {int? maxLines}) => Text(this,
      textScaler: TextScaler.linear(_defaultTextScaleFactor),
      style: context.tt.labelSmall!.cc(_customTextColor),
      maxLines: maxLines);
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
  void retry({int retries = 2, bool escalate = true, void Function()? onRetry, void Function()? onAbort}) {
    while (retries >= 0) {
      try {
        this();
        return;
      } catch (_) {
        if (retries == 0) {
          onAbort?.call();
          if (escalate) rethrow;
          return;
        }
        retries--;
        onRetry?.call();
      }
    }
  }
}

extension QuickColor on Color {
  Color darken(double factor) => Color.lerp(this, Colors.black, factor) ?? Colors.black;
  Color brighten(double factor) => Color.lerp(this, Colors.white, factor) ?? Colors.white;
}
