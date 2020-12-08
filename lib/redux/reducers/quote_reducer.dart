import 'package:quotes/redux/actions/action.dart';
import 'package:quotes/redux/actions/quotes_action.dart';
import 'package:quotes/redux/models/quote.dart';
import 'package:redux/redux.dart';


final loadingReducer = combineReducers<bool>([
  new TypedReducer<bool, AllLoadedAction>(_isLoading),
]);

bool _isLoading(bool meds, AllLoadedAction action) {
  return false;
}

final quoteReducer = combineReducers<List<Quote>>([
  new TypedReducer<List<Quote>, SavedQuotesAction>(_saveQuote),
  new TypedReducer<List<Quote>, SaveNewQuotesAction>(_saveNewQuote),
]);

List<Quote> _saveQuote(List<Quote> meds, SavedQuotesAction action) {
  return action.quotes;
}

List<Quote> _saveNewQuote(List<Quote> meds, SaveNewQuotesAction action) {
  meds.removeAt(0);
  meds.addAll(action.quotes);
  return meds;
}

final saveLocalReducer = combineReducers<List<Quote>>([
  new TypedReducer<List<Quote>, SaveLocalQuotesAction>(_saveLocalQuote),
]);

List<Quote> _saveLocalQuote(List<Quote> meds, SaveLocalQuotesAction action) {
  return action.quotes;
}