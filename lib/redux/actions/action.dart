abstract class AppAction{}

class InitAppAction extends AppAction {

  InitAppAction();

  @override @override String toString() {
    return "InitAppAction";
  }
}





class SaveDataAction extends AppAction {
  List<dynamic> val;

  SaveDataAction(this.val);

  @override String toString() => "SaveDataAction{$val}";
}

class LoadedAction extends AppAction{}

class AllLoadedAction extends AppAction {

  AllLoadedAction();

  @override @override String toString() {
    return "AllLoadedAction";
  }
}
