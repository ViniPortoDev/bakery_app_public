abstract class Mapper <T, F> {
  T to({required F entity});
  F from({required T dto});
}