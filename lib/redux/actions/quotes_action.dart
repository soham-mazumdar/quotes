import 'package:quotes/redux/actions/action.dart';
import 'package:quotes/redux/models/quote.dart';

class SavedQuotesAction extends AppAction{

  final List<Quote> quotes;
  SavedQuotesAction(this.quotes);

  @override String toString() => "SavedQuotesAction{$quotes}";
}

class GetNewQuotesAction extends AppAction{}

class SaveNewQuotesAction extends AppAction{

  final List<Quote> quotes;
  SaveNewQuotesAction(this.quotes);

  @override String toString() => "SaveNewQuotesAction{$quotes}";
}

class SaveQuotesAction extends AppAction{
  final Quote quote;

  SaveQuotesAction(this.quote);

  @override String toString() => "SaveQuotesAction{$quote}";
}

class SaveLocalQuotesAction extends AppAction{
  final List<Quote> quotes;
  SaveLocalQuotesAction(this.quotes);

  @override String toString() => "SaveLocalQuotesAction{$quotes}";
}

class DeleteQuotesAction extends AppAction{
  final Quote quote;

  DeleteQuotesAction(this.quote);

  @override String toString() => "DeleteQuotesAction{$quote}";
}
