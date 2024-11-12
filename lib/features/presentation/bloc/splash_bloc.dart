import 'package:bloc/bloc.dart';
import 'package:snapeats/features/domain/usecases/splash/get_data.dart';
import 'package:snapeats/features/domain/usecases/usecase.dart';
import 'package:snapeats/utils/app_constants.dart';

part 'splash_event.dart';

part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final GetAllData getAllDataUsecase;

  SplashBloc({required this.getAllDataUsecase}) : super(SplashInitial()) {
    on<GetAllDataEvent>(_handleGetDataEvent);
  }

  Future<void> _handleGetDataEvent(
      GetAllDataEvent event, Emitter<SplashState> emit) async {
    emit(SplashLoading());

    final response = await getAllDataUsecase(NoParams());

    emit(
      response.fold(
        (l) {
          return GetDataFailedState();
        },
        (r) {
          AppConstants.allMenuList = r.result!.menu;
          AppConstants.allCategoryList = r.result!.categories;
          AppConstants.allMenuItemList = r.result!.items;
          AppConstants.allModifierList = r.result!.modifierGroups;
          return GetDataSuccessState();
        },
      ),
    );
  }
}
