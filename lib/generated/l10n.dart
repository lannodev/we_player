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
// ignore_for_file: avoid_redundant_argument_values

class Translate {
  Translate();
  
  static Translate current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<Translate> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      Translate.current = Translate();
      
      return Translate.current;
    });
  } 

  static Translate of(BuildContext context) {
    return Localizations.of<Translate>(context, Translate);
  }

  /// `Search`
  String get searchPageTitle {
    return Intl.message(
      'Search',
      name: 'searchPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Music`
  String get searchPageSubtitle {
    return Intl.message(
      'Music',
      name: 'searchPageSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while searching!`
  String get searchPageListErrorTitle {
    return Intl.message(
      'An error occurred while searching!',
      name: 'searchPageListErrorTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please verify Internet connectivity.`
  String get searchPageListErrorSubtitle {
    return Intl.message(
      'Please verify Internet connectivity.',
      name: 'searchPageListErrorSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Could not find using the term '{term}'`
  String searchPageListNotFoundTitle(Object term) {
    return Intl.message(
      'Could not find using the term \'$term\'',
      name: 'searchPageListNotFoundTitle',
      desc: '',
      args: [term],
    );
  }

  /// `Try again by typing the search term in another way`
  String get searchPageListNotFoundSubtitle {
    return Intl.message(
      'Try again by typing the search term in another way',
      name: 'searchPageListNotFoundSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Find what you want to listen`
  String get searchPageListEmptyTitle {
    return Intl.message(
      'Find what you want to listen',
      name: 'searchPageListEmptyTitle',
      desc: '',
      args: [],
    );
  }

  /// `Search for artists, music, podcasts and more`
  String get searchPageListEmptySubtitle {
    return Intl.message(
      'Search for artists, music, podcasts and more',
      name: 'searchPageListEmptySubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Search music...`
  String get searchPageHintText {
    return Intl.message(
      'Search music...',
      name: 'searchPageHintText',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get bottomBarHome {
    return Intl.message(
      'Home',
      name: 'bottomBarHome',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get bottomBarSearch {
    return Intl.message(
      'Search',
      name: 'bottomBarSearch',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get bottomBarFavorites {
    return Intl.message(
      'Favorites',
      name: 'bottomBarFavorites',
      desc: '',
      args: [],
    );
  }

  /// `Playlist`
  String get bottomBarPlaylist {
    return Intl.message(
      'Playlist',
      name: 'bottomBarPlaylist',
      desc: '',
      args: [],
    );
  }

  /// `Favorite`
  String get favoritesPageTitle {
    return Intl.message(
      'Favorite',
      name: 'favoritesPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Musics`
  String get favoritesPageSubtitle {
    return Intl.message(
      'Musics',
      name: 'favoritesPageSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Shuffle`
  String get favoritesPageShuffleButtom {
    return Intl.message(
      'Shuffle',
      name: 'favoritesPageShuffleButtom',
      desc: '',
      args: [],
    );
  }

  /// `PLAYING NOW`
  String get playerPageTitle {
    return Intl.message(
      'PLAYING NOW',
      name: 'playerPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Recently`
  String get explorePageRecentTitle {
    return Intl.message(
      'Recently',
      name: 'explorePageRecentTitle',
      desc: '',
      args: [],
    );
  }

  /// `played`
  String get explorePageRecentSubtitle {
    return Intl.message(
      'played',
      name: 'explorePageRecentSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Favorite music`
  String get explorePageFavoriteTitle {
    return Intl.message(
      'Favorite music',
      name: 'explorePageFavoriteTitle',
      desc: '',
      args: [],
    );
  }

  /// `Selected`
  String get explorePageSpecialTitle {
    return Intl.message(
      'Selected',
      name: 'explorePageSpecialTitle',
      desc: '',
      args: [],
    );
  }

  /// `for you`
  String get explorePageSpecialSubtitle {
    return Intl.message(
      'for you',
      name: 'explorePageSpecialSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `New`
  String get explorePageNewAudiosTitle {
    return Intl.message(
      'New',
      name: 'explorePageNewAudiosTitle',
      desc: '',
      args: [],
    );
  }

  /// `releases`
  String get explorePageNewAudiosSubtitle {
    return Intl.message(
      'releases',
      name: 'explorePageNewAudiosSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `New`
  String get explorePageNewAlbumsTitle {
    return Intl.message(
      'New',
      name: 'explorePageNewAlbumsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Albums`
  String get explorePageNewAlbumsSubtitle {
    return Intl.message(
      'Albums',
      name: 'explorePageNewAlbumsSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Top 100`
  String get explorePageTopAudiosTitle {
    return Intl.message(
      'Top 100',
      name: 'explorePageTopAudiosTitle',
      desc: '',
      args: [],
    );
  }

  /// `Rap & Hip-Hop`
  String get explorePageRapTitle {
    return Intl.message(
      'Rap & Hip-Hop',
      name: 'explorePageRapTitle',
      desc: '',
      args: [],
    );
  }

  /// `Pop`
  String get explorePagePopTitle {
    return Intl.message(
      'Pop',
      name: 'explorePagePopTitle',
      desc: '',
      args: [],
    );
  }

  /// `Rock`
  String get explorePageRockTitle {
    return Intl.message(
      'Rock',
      name: 'explorePageRockTitle',
      desc: '',
      args: [],
    );
  }

  /// `Mood`
  String get explorePageMoodTitle {
    return Intl.message(
      'Mood',
      name: 'explorePageMoodTitle',
      desc: '',
      args: [],
    );
  }

  /// `Music`
  String get explorePageMoodSubtitle {
    return Intl.message(
      'Music',
      name: 'explorePageMoodSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Editors'`
  String get explorePageEditorTitle {
    return Intl.message(
      'Editors\'',
      name: 'explorePageEditorTitle',
      desc: '',
      args: [],
    );
  }

  /// `Choice`
  String get explorePageEditorSubtitle {
    return Intl.message(
      'Choice',
      name: 'explorePageEditorSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Music collections`
  String get explorePageCollectionTitle {
    return Intl.message(
      'Music collections',
      name: 'explorePageCollectionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Music for `
  String get explorePageAnyCaseTitle {
    return Intl.message(
      'Music for ',
      name: 'explorePageAnyCaseTitle',
      desc: '',
      args: [],
    );
  }

  /// `Every occasion`
  String get explorePageAnyCaseSubtitle {
    return Intl.message(
      'Every occasion',
      name: 'explorePageAnyCaseSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `New artists`
  String get explorePageNewArtistsTitle {
    return Intl.message(
      'New artists',
      name: 'explorePageNewArtistsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Show All`
  String get explorePageShowMoreButton {
    return Intl.message(
      'Show All',
      name: 'explorePageShowMoreButton',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<Translate> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'pt'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<Translate> load(Locale locale) => Translate.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}