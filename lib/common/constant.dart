import 'dart:ui';

import 'package:tmdb_api/tmdb_api.dart';

const kPrimaryColor = Color(0xff141C2E);

const baseUrl = "https://pfe-watch-it.herokuapp.com/";

final tmdb = TMDB(ApiKeys('9aed0fa917a9e58dab4d4f0e3736f214',
    'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5YWVkMGZhOTE3YTllNThkYWI0ZDRmMGUzNzM2ZjIxNCIsInN1YiI6IjYxZWVhYWIyZWEzN2UwNDk2ZDE4MDU1MCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.sjd6Wvwz5Ss8yWNMAFrsjuxgwXhmioeamra2-mlgmJQ'));
