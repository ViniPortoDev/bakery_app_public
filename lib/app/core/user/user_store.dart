import 'package:mobx/mobx.dart';
import 'user_entity.dart';
part 'user_store.g.dart';

class UserStore = _UserStoreBase with _$UserStore;

abstract class _UserStoreBase with Store {
  @observable
  User? user;
  
  @action 
  setUser(User newUser) => this.user = newUser;
}