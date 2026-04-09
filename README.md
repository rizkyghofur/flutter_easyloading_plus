# Flutter EasyLoading Plus

[![pub package](https://img.shields.io/pub/v/flutter_easyloading_plus?style=flat)](https://pub.dev/packages/flutter_easyloading_plus) [![pub points](https://badges.bar/flutter_easyloading_plus/pub%20points)](https://pub.dev/packages/flutter_easyloading_plus/score) [![popularity](https://badges.bar/flutter_easyloading_plus/popularity)](https://pub.dev/packages/flutter_easyloading_plus/score) [![likes](https://badges.bar/flutter_easyloading_plus/likes)](https://pub.dev/packages/flutter_easyloading_plus/score) [![license](https://img.shields.io/github/license/rizkyghofur/flutter_easyloading_plus?style=flat)](https://github.com/rizkyghofur/flutter_easyloading_plus) [![stars](https://img.shields.io/github/stars/rizkyghofur/flutter_easyloading_plus?style=social)](https://github.com/rizkyghofur/flutter_easyloading_plus)

<img src="https://raw.githubusercontent.com/rizkyghofur/flutter_easyloading_plus/main/images/gif01.gif" width=200 height=429/> <img src="https://raw.githubusercontent.com/rizkyghofur/flutter_easyloading_plus/main/images/gif02.gif" width=200 height=429/> <img src="https://raw.githubusercontent.com/rizkyghofur/flutter_easyloading_plus/main/images/gif03.gif" width=200 height=429/> <img src="https://raw.githubusercontent.com/rizkyghofur/flutter_easyloading_plus/main/images/gif04.gif" width=200 height=429/>

## Installing

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  flutter_easyloading_plus: ^3.2.0
```

## Import

```dart
import 'package:flutter_easyloading_plus/flutter_easyloading_plus.dart';
```

## How to use

First, initialize `EasyLoading` in your `MaterialApp`/`CupertinoApp`:

```dart
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter EasyLoading Plus',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter EasyLoading Plus'),
      builder: EasyLoading.init(),
    );
  }
}
```

Then, enjoy yourself:

```dart
EasyLoading.show(
  status: 'loading...',
  onDismiss: () {
    print('Loading dismissed');
  },
);

EasyLoading.showProgress(
  0.3, 
  status: 'downloading...',
  onDismiss: () {
    print('Progress dismissed');
  },
);

EasyLoading.showSuccess(
  'Great Success!',
  onDismiss: () {
    print('Success dismissed');
  },
);

EasyLoading.showError('Failed with Error');

EasyLoading.showInfo('Useful Information.');

EasyLoading.showToast('Toast');

EasyLoading.dismiss();
```

Add loading status callback

```dart
EasyLoading.addStatusCallback((status) {
  print('EasyLoading Status $status');
});
```

Remove loading status callback(s)

```dart
EasyLoading.removeCallback(statusCallback);

EasyLoading.removeAllCallbacks();
```

## Customize

❗️**Note:**

- **`textColor`、`indicatorColor`、`progressColor`、`backgroundColor` only used for `EasyLoadingStyle.custom`.**

- **`maskColor` only used for `EasyLoadingMaskType.custom`.**

```dart
/// loading style, default [EasyLoadingStyle.dark].
EasyLoadingStyle loadingStyle;

/// loading indicator type, default [EasyLoadingIndicatorType.fadingCircle].
EasyLoadingIndicatorType indicatorType;

/// loading mask type, default [EasyLoadingMaskType.none].
EasyLoadingMaskType maskType;

/// toast position, default [EasyLoadingToastPosition.center].
EasyLoadingToastPosition toastPosition;

/// loading animationStyle, default [EasyLoadingAnimationStyle.opacity].
EasyLoadingAnimationStyle animationStyle;

/// loading custom animation, default null.
EasyLoadingAnimation customAnimation;

/// textAlign of status, default [TextAlign.center].
TextAlign textAlign;

/// textStyle of status, default null.
TextStyle textStyle;

/// content padding of loading.
EdgeInsets contentPadding;

/// padding of [status].
EdgeInsets textPadding;

/// size of indicator, default 40.0.
double indicatorSize;

/// radius of loading, default 5.0.
double radius;

/// fontSize of loading, default 15.0.
double fontSize;

/// width of progress indicator, default 2.0.
double progressWidth;

/// width of indicator, default 4.0, only used for [EasyLoadingIndicatorType.ring, EasyLoadingIndicatorType.dualRing].
double lineWidth;

/// display duration of [showSuccess] [showError] [showInfo], default 2000ms.
Duration displayDuration;

/// animation duration of indicator, default 200ms.
Duration animationDuration;

/// color of loading status, only used for [EasyLoadingStyle.custom].
Color textColor;

/// color of loading indicator, only used for [EasyLoadingStyle.custom].
Color indicatorColor;

/// progress color of loading, only used for [EasyLoadingStyle.custom].
Color progressColor;

/// background color of loading, only used for [EasyLoadingStyle.custom].
Color backgroundColor;

/// mask color of loading, only used for [EasyLoadingMaskType.custom].
Color maskColor;

/// should allow user interactions while loading is displayed.
bool userInteractions;

/// should dismiss on user tap.
bool dismissOnTap;

/// indicator widget of loading
Widget indicatorWidget;

/// success widget of loading
Widget successWidget;

/// error widget of loading
Widget errorWidget;

/// info widget of loading
Widget infoWidget;

/// Whether to use the app's global [ThemeData] (via [BuildContext]).
/// Default is false.
bool useContextTheme;
```

Because of `EasyLoading` is a singleton, so you can custom loading style any where like this:

```dart
EasyLoading.instance
  ..displayDuration = const Duration(milliseconds: 2000)
  ..indicatorType = EasyLoadingIndicatorType.fadingCircle
  ..loadingStyle = EasyLoadingStyle.dark
  ..indicatorSize = 45.0
  ..radius = 10.0
  ..progressColor = Colors.yellow
  ..backgroundColor = Colors.green
  ..indicatorColor = Colors.yellow
  ..textColor = Colors.yellow
  ..maskColor = Colors.blue.withOpacity(0.5)
  ..userInteractions = true
  ..dismissOnTap = false
  ..useContextTheme = true
  ..customAnimation = CustomAnimation();
```

More indicatorType can see in 👉 [flutter_spinkit showcase](https://github.com/jogboms/flutter_spinkit#-showcase)

## Custom Animation

example: 👉 [Custom Animation](https://github.com/rizkyghofur/flutter_easyloading_plus/blob/main/example/lib/custom_animation.dart)

## Todo

- [x] add progress indicator

- [x] add custom animation

- [x] add accessibility (Semantics) support

- [x] add granular callbacks (onDismiss)

## Changelog

[CHANGELOG](./CHANGELOG.md)

## License

[MIT License](./LICENSE)

## ❤️❤️❤️

Thanks to [flutter_spinkit](https://github.com/jogboms/flutter_spinkit) ❤️

Supported by [JetBrains Open Source](https://www.jetbrains.com/community/opensource/#support)

[<img src="https://raw.githubusercontent.com/rizkyghofur/flutter_easyloading_plus/main/images/jetbrains.png" width=200 height=112/>](https://www.jetbrains.com/?from=FlutterEasyLoadingPlus)
