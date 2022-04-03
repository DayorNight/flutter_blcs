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
  String get switch_theme {
    return Intl.message(
      'Switch Theme',
      name: 'switch_theme',
      desc: '',
      args: [],
    );
  }

  /// `Switch Language`
  String get switch_language {
    return Intl.message(
      'Switch Language',
      name: 'switch_language',
      desc: '',
      args: [],
    );
  }

  /// `Select Language`
  String get select_language {
    return Intl.message(
      'Select Language',
      name: 'select_language',
      desc: '',
      args: [],
    );
  }

  /// `Dark Theme`
  String get dark_theme {
    return Intl.message(
      'Dark Theme',
      name: 'dark_theme',
      desc: '',
      args: [],
    );
  }

  /// `Widget`
  String get home_view {
    return Intl.message(
      'Widget',
      name: 'home_view',
      desc: '',
      args: [],
    );
  }

  /// `Function`
  String get home_fun {
    return Intl.message(
      'Function',
      name: 'home_fun',
      desc: '',
      args: [],
    );
  }

  /// `Me`
  String get home_me {
    return Intl.message(
      'Me',
      name: 'home_me',
      desc: '',
      args: [],
    );
  }

  /// `App LifeCycle`
  String get app_lifeCycle {
    return Intl.message(
      'App LifeCycle',
      name: 'app_lifeCycle',
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
  String get screen_adapter {
    return Intl.message(
      'Screen Adapter',
      name: 'screen_adapter',
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
