import 'package:auto_size_text/auto_size_text.dart';
import 'package:film_flu/app/constants/app_constants.dart';
import 'package:film_flu/app/constants/app_urls.dart';
import 'package:film_flu/app/extensions/localizations_extensions.dart';
import 'package:film_flu/app/routes/app_paths.dart';
import 'package:film_flu/domain/models/credit_actor_entity.dart';
import 'package:film_flu/domain/models/person_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ActorCreditsWidget extends StatelessWidget {
  const ActorCreditsWidget({
    super.key,
    required this.person,
    required this.credits,
  });

  final PersonEntity person;
  final List<CreditActorEntity> credits;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        itemCount: credits.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 240,
          mainAxisExtent: 340,
          mainAxisSpacing: 18,
          crossAxisSpacing: 18,
        ),
        itemBuilder: (context, index) {
          CreditActorEntity filmPerson = credits[index];

          String? movieTitle = filmPerson.title != null
              ? '${filmPerson.character} ${context.localizations.in_preposition} ${filmPerson.title}'
              : '${filmPerson.character}';

          return ListTile(
            onTap: () {
              AppConstants.mediaTypeId = filmPerson.id;
              context.push(
                '${AppRoutePaths.mediaDetailsRoute}/${filmPerson.id}',
              );
            },
            title: ClipRRect(
              borderRadius: BorderRadius.circular(32.0),
              child: Image.network(
                '${AppUrls.personImgBaseUrl}${filmPerson.backdropPath}',
                height: 200,
                width: 120,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.network(
                    height: 200,
                    width: 120,
                    fit: BoxFit.cover,
                    '${AppUrls.personImgBaseUrl}${person.profilePath}',
                  );
                },
              ),
            ),
            subtitle: AutoSizeText(
              '${context.localizations.actor_job} $movieTitle',
              textAlign: TextAlign.center,
              maxLines: 3,
              minFontSize: 14,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.displayMedium,
            ),
          );
        },
      ),
    );
  }
}
