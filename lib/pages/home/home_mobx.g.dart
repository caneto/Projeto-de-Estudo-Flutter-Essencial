// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeMobx on HomeMobxBase, Store {
  late final _$homesAtom = Atom(name: 'HomeMobxBase.homes', context: context);

  @override
  List<Home>? get homes {
    _$homesAtom.reportRead();
    return super.homes;
  }

  @override
  set homes(List<Home>? value) {
    _$homesAtom.reportWrite(value, super.homes, () {
      super.homes = value;
    });
  }

  late final _$errorAtom = Atom(name: 'HomeMobxBase.error', context: context);

  @override
  Exception? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(Exception? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$fetchAsyncAction =
      AsyncAction('HomeMobxBase.fetch', context: context);

  @override
  Future fetch(String tipo) {
    return _$fetchAsyncAction.run(() => super.fetch(tipo));
  }

  @override
  String toString() {
    return '''
homes: ${homes},
error: ${error}
    ''';
  }
}
