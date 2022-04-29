// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Corn`
  String get appName {
    return Intl.message(
      'Corn',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Switch Theme`
  String get switchTheme {
    return Intl.message(
      'Switch Theme',
      name: 'switchTheme',
      desc: '',
      args: [],
    );
  }

  /// `Switch Language`
  String get switchLanguage {
    return Intl.message(
      'Switch Language',
      name: 'switchLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Select Language`
  String get selectLanguage {
    return Intl.message(
      'Select Language',
      name: 'selectLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Dark Theme`
  String get darkTheme {
    return Intl.message(
      'Dark Theme',
      name: 'darkTheme',
      desc: '',
      args: [],
    );
  }

  /// `Widget`
  String get homeView {
    return Intl.message(
      'Widget',
      name: 'homeView',
      desc: '',
      args: [],
    );
  }

  /// `Function`
  String get homeFun {
    return Intl.message(
      'Function',
      name: 'homeFun',
      desc: '',
      args: [],
    );
  }

  /// `Me`
  String get homeMe {
    return Intl.message(
      'Me',
      name: 'homeMe',
      desc: '',
      args: [],
    );
  }

  /// `App LifeCycle`
  String get appLifeCycle {
    return Intl.message(
      'App LifeCycle',
      name: 'appLifeCycle',
      desc: '',
      args: [],
    );
  }

  /// `LifeCycle`
  String get lifeCycle {
    return Intl.message(
      'LifeCycle',
      name: 'lifeCycle',
      desc: '',
      args: [],
    );
  }

  /// `Screen Adapter`
  String get screenAdapter {
    return Intl.message(
      'Screen Adapter',
      name: 'screenAdapter',
      desc: '',
      args: [],
    );
  }

  /// `Provider`
  String get provider {
    return Intl.message(
      'Provider',
      name: 'provider',
      desc: '',
      args: [],
    );
  }

  /// `Hero`
  String get hero {
    return Intl.message(
      'Hero',
      name: 'hero',
      desc: '',
      args: [],
    );
  }

  /// `Personal`
  String get personal {
    return Intl.message(
      'Personal',
      name: 'personal',
      desc: '',
      args: [],
    );
  }

  /// `Personal Information`
  String get personalInformation {
    return Intl.message(
      'Personal Information',
      name: 'personalInformation',
      desc: '',
      args: [],
    );
  }

  /// `Animation`
  String get animation {
    return Intl.message(
      'Animation',
      name: 'animation',
      desc: '',
      args: [],
    );
  }

  /// `Route Animation`
  String get routeAnimation {
    return Intl.message(
      'Route Animation',
      name: 'routeAnimation',
      desc: '',
      args: [],
    );
  }

  /// `Mixed Animation`
  String get mixedAnimation {
    return Intl.message(
      'Mixed Animation',
      name: 'mixedAnimation',
      desc: '',
      args: [],
    );
  }

  /// `Animated Switcher`
  String get animatedSwitcher {
    return Intl.message(
      'Animated Switcher',
      name: 'animatedSwitcher',
      desc: '',
      args: [],
    );
  }

  /// `Basic Knowledge`
  String get basicKnowledge {
    return Intl.message(
      'Basic Knowledge',
      name: 'basicKnowledge',
      desc: '',
      args: [],
    );
  }

  /// `Report`
  String get report {
    return Intl.message(
      'Report',
      name: 'report',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Custom Widget`
  String get customWidget {
    return Intl.message(
      'Custom Widget',
      name: 'customWidget',
      desc: '',
      args: [],
    );
  }

  /// `Net Work`
  String get netWork {
    return Intl.message(
      'Net Work',
      name: 'netWork',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message(
      'Camera',
      name: 'camera',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
