import 'dart:convert';
// import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:quotes/redux/models/quote.dart';
import 'package:shared_preferences/shared_preferences.dart';
class QuoteApiService {

  QuoteApiService(SharedPreferences preferences);
  final String _baseURL = "favqs.com";
  // static const String API_KEY ="3443a991daab31d324dbc8704a571791";


  // get quotes from API
  Future<List<Quote>> getQOTD(int j) async {
    List<Quote> quotes = [];
    Uri uri = Uri.https(_baseURL,'/api/qotd');
    Map<String, String> header = {HttpHeaders.contentTypeHeader: 'application/json'};
    
    for (var i = 0; i < j; i++) {
      var response = await http.get(uri,headers: header);
      Map<String, dynamic> body = json.decode(response.body);

      if (response.statusCode == 200)
        quotes.add(Quote.fromJson(body['quote']));
    }

    return quotes;
  }

  // get local quotes
  Future<List<Quote>> saveQuote(Quote quote) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Quote> quotes = [];
    String _counter = prefs.getString('quotes') ?? '';
    if(_counter.isEmpty || _counter == '[]') {
      quotes = [];
      quotes.add(quote);
    }
    else{
      List __quotes = json.decode(_counter);
      quotes = __quotes.map((e) => Quote.fromJson(e)).toList();
      // quotes.removeWhere((element) => element.id == quote.id);
      var q = quotes.firstWhere((element) => element.id == quote.id, orElse: () => null); //.contains((element) => element.id == quote.id);
      if(q == null)
        quotes.add(quote);
    }

    String _quotes = jsonEncode(quotes);
    await prefs.setString('quotes', _quotes);
    return quotes;
  }
  
  // get local quotes
  Future<List<Quote>> getQuote() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Quote> quotes = [];
    String _counter = prefs.getString('quotes') ?? '';
    if(_counter.isEmpty || _counter == '[]') {
      quotes = [];
    }
    else{
      List __quotes = json.decode(_counter);
      quotes = __quotes.map((e) => Quote.fromJson(e)).toList();
    }
    return quotes;
  }

  // get from local quotes
  Future<List<Quote>> delQuote(Quote quote) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Quote> quotes = [];
    String _counter = prefs.getString('quotes') ?? '';
    
    List __quotes = json.decode(_counter);
    quotes = __quotes.map((e) => Quote.fromJson(e)).toList();
    quotes.removeWhere((element) => element.id == quote.id);
      
    String _quotes = jsonEncode(quotes);
    await prefs.setString('quotes', _quotes);
    return quotes;
  }
}