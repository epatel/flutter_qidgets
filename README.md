
Build widgets hierarchies quickly with qidgets.

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
  qidgets:
    git: https://github.com/epatel/flutter_qidgets.git
```

## Usage

Quick-wrap widgets in other widgets with dot extensions, ie `.red` will wrap any widget in a `Container` with `color:` set to `Colors.red`.

Use `setQidgetsValues(…)` to set values for paddings and color on the colored text extensions, ie `.wHeadline4Custom()`.

There are also extensions on `List<Widget>` to be quick-wrapped with `Row` and `Column`.

Take a look in `lib/src/qidgets.dart` for the what's and how's.

## Additional information

