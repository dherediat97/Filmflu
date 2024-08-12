import 'package:film_flu/app/constants/app_constants.dart';
import 'package:film_flu/presentation/features/home/bloc/home_bloc.dart';
import 'package:film_flu/presentation/features/media_details/bloc/media_detail_bloc.dart';
import 'package:film_flu/presentation/features/person_details/bloc/person_details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class TopBlocProviders extends StatelessWidget {
  final Widget child;
  final _getIt = GetIt.instance;

  TopBlocProviders({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => _getIt<MediaDetailBloc>()
            ..add(
              MediaDetailEvent.getMediaDetails(
                MediaType.movie,
                AppConstants.mediaTypeId,
              ),
            ),
        ),
        BlocProvider(
          create: (context) => _getIt<PersonDetailsBloc>()
            ..add(
              PersonDetailEvent.getPersonData(
                AppConstants.personId,
              ),
            ),
        ),
      ],
      child: child,
    );
  }
}
