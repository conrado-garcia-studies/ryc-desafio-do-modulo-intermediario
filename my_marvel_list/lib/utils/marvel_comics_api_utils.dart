import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MarvelComicsApiUtils {
  static String? _hash;

  static Uri createUri(final String subpath, final int offset,
      final Map<String, dynamic> specificQueryParameters) {
    final String hash = _getOrCreateHash();
    final String uri = <String?>[
      dotenv.env['MARVEL_COMICS_API_BASE_URI'],
      subpath,
      '?ts=${dotenv.env['MARVEL_COMICS_API_TIMESTAMP']}',
      '&apikey=${dotenv.env['MARVEL_COMICS_API_PUBLIC_KEY']}',
      '&hash=$hash',
      '&offset=$offset',
      '&limit=${dotenv.env['MARVEL_COMICS_API_LIMIT']}',
      specificQueryParameters.keys
          .map<String>(
            (final String key) => '&$key=${specificQueryParameters[key]}',
          )
          .join(),
    ].join();
    return Uri.parse(uri);
  }

  static String _getOrCreateHash() {
    if (_hash == null) {
      final String rawHash = <String?>[
        dotenv.env['MARVEL_COMICS_API_TIMESTAMP'],
        dotenv.env['MARVEL_COMICS_API_PRIVATE_KEY'],
        dotenv.env['MARVEL_COMICS_API_PUBLIC_KEY'],
      ].join();
      final Uint8List encodedRawHash = utf8.encode(rawHash);
      _hash = md5.convert(encodedRawHash).toString();
    }
    return _hash!;
  }
}
