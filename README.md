
Build widgets hierarchies quickly with qidgets. Quick widgets → qidgets.

## Features

Qidgets add shorthand quick access to build common widget hierarchies.

Example.
```
// qidgets
[
  'Hello'.wText,
  'world!'.wText,
].column.center,

// Normal
Center(
  child: Column(
    children: [
      Text('Hello'),
      Text('world!'),
    ],
  ),
),
```

## Getting started

Add to `pubspec.yaml`

```
  flutter_qidgets:
    git:
      ref: b0317cbad91c54471ec2a489fa4f090e7ee894d7
      url: https://github.com/epatel/flutter_qidgets.git
```

## Usage

Quick-wrap widgets in other widgets with dot extensions, ie `.red` will wrap any widget in a `Container` with `color:` set to `Colors.red`.

Use `setQidgetsValues(…)` to set values for paddings and color on the colored text extensions, ie `.wLabelLargeCustom()`.

There are also extensions on `List<Widget>` to be quick-wrapped with `Row` and `Column`.

Take a look in `lib/src/flutter_qidgets.dart` for the what's and how's.

## Additional information
