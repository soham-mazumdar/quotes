import 'package:quotes/redux/models/quote.dart';
import 'package:quotes/redux/routes/routes.dart';

class AppState {
  final bool isLoading;
  final List<String> routes;
  // final String selectedPage;
  final List<Quote> quotes;
  final List<Quote> savedQuotes;
  

  AppState({
    this.isLoading,
    this.routes,
    // this.selectedPage,
    this.quotes,
    this.savedQuotes
  });

  factory AppState.initial(){
    return AppState(
      isLoading: true,
      routes: [AppRoutes.home],
      quotes: [],
      savedQuotes: []
    );
  }

  AppState copyWith({
    bool newIsLoading,
    List<String> newRoutes,
    // String newSelectedPage,
    List<Quote> newQuotes,
    List<Quote> newSavedQuotes
  })
  {
    return AppState(
      isLoading: newIsLoading ?? this.isLoading,
      routes: newRoutes ?? this.routes,
      // selectedPage: newSelectedPage ?? this.selectedPage,
      quotes: newQuotes ?? this.quotes,
      savedQuotes: newSavedQuotes ?? this.savedQuotes
    );
  }
}