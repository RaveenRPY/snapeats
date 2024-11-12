import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snapeats/features/data/datasources/local_data_source.dart';
import 'package:snapeats/features/data/repository/repostory_impl.dart';
import 'package:snapeats/features/domain/usecases/splash/get_data.dart';
import 'package:snapeats/features/presentation/bloc/splash_bloc.dart';
import 'package:snapeats/features/presentation/views/on_boarding/menu_screen.dart';
import 'package:snapeats/utils/app_colors.dart';
import 'package:page_transition/page_transition.dart';
import 'package:snapeats/utils/app_styles.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final SplashBloc _bloc = SplashBloc(getAllDataUsecase: GetAllData(repository: RepositoryImpl(localDataSource: LocalDataSource())));

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: AppColors.primaryGreen,
      statusBarIconBrightness: Brightness.dark,
    ));
    _bloc.add(GetAllDataEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashBloc>(
      create: (context) => _bloc,
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is GetDataSuccessState) {
            Future.delayed(
              const Duration(seconds: 1),
              () => Navigator.pushReplacement(
                context,
                PageTransition(
                  type: PageTransitionType.rightToLeft,
                  child: const MenuScreen(),
                ),
              ),
            );
          } else if (state is GetDataFailedState){

          }
        },
        child: Material(
          color: AppColors.primaryGreen,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Snap',
                  style: AppStyles.mediumTextSize50White,
                ),
                Text(
                  'Eats',
                  style: AppStyles.mediumTextSize50Black,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
