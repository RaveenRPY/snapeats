part of 'splash_bloc.dart';

abstract class SplashState {}

class SplashInitial extends SplashState {}

class SplashLoading extends SplashState {}

class GetDataSuccessState extends SplashState {}

class GetDataFailedState extends SplashState {}
