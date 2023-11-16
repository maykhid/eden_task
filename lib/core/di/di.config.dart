// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ably_flutter/ably_flutter.dart' as _i4;
import 'package:eden_task/app/features/auth/data/authentication_interface.dart'
    as _i5;
import 'package:eden_task/app/features/auth/data/authentication_repository.dart'
    as _i7;
import 'package:eden_task/app/features/auth/data/firebase_authentication.dart'
    as _i6;
import 'package:eden_task/app/features/order/data/ably_order_datasource.dart'
    as _i9;
import 'package:eden_task/app/features/order/data/order_interface.dart' as _i8;
import 'package:eden_task/app/features/order/data/order_repository.dart'
    as _i10;
import 'package:eden_task/core/di/module.dart' as _i11;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.singleton<_i3.FirebaseAuth>(registerModule.firebaseAuth);
    gh.singleton<_i4.Realtime>(registerModule.realtime);
    gh.singleton<_i4.RealtimeChannel>(registerModule.realtimeChannel);
    gh.singleton<_i5.AuthenticationInterface>(
        _i6.FirebaseAuthentication(firebaseAuth: gh<_i3.FirebaseAuth>()));
    gh.singleton<_i7.AuthenticationRepository>(_i7.AuthenticationRepository(
        authenticationInterface: gh<_i5.AuthenticationInterface>()));
    gh.singleton<_i8.OrderDataSourceInterface>(_i9.AblyOrderDataSource(
      realtime: gh<_i4.Realtime>(),
      realtimeChannel: gh<_i4.RealtimeChannel>(),
    ));
    gh.singleton<_i10.OrderRepository>(_i10.OrderRepository(
        orderDataSourceInterface: gh<_i8.OrderDataSourceInterface>()));
    return this;
  }
}

class _$RegisterModule extends _i11.RegisterModule {}
