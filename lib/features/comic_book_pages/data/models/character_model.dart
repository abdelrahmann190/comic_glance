import 'package:comic_glance/features/comic_book_pages/data/models/common_data_model.dart';
import 'package:comic_glance/features/comic_book_pages/data/models/credits_model.dart';
import 'package:comic_glance/features/comic_book_pages/data/models/image_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'character_model.g.dart';

@JsonSerializable()
class CharacterModel extends CommonDataModel {
  final String? birth;
  @JsonKey(name: 'character_enemies')
  final List<CreditsModel>? characterEnemies;
  @JsonKey(name: 'character_friends')
  final List<CreditsModel>? characterFriends;
  @JsonKey(name: 'count_of_issue_appearances')
  final int? countOfIssueAppearances;
  @JsonKey(name: 'creators')
  final List<CreditsModel>? creators;

  @JsonKey(name: 'first_appeared_in_issue')
  final CreditsModel? firstAppearedIIssue;

  @JsonKey(name: 'issue_credits')
  final List<CreditsModel>? issueCredits;
  @JsonKey(name: 'issues_died_in')
  final List<CreditsModel>? issuesDiedIn;
  @JsonKey(name: 'movies')
  final List<CreditsModel>? movies;

  @JsonKey(name: 'powers')
  final List<CreditsModel>? powers;
  @JsonKey(name: 'publisher')
  final CreditsModel? publisher;
  @JsonKey(name: 'real_name')
  final String? realName;
  @JsonKey(name: 'story_arc_credits')
  final List<CreditsModel>? storyArcCredits;
  @JsonKey(name: 'team_enemies')
  final List<CreditsModel>? teamEnemies;
  @JsonKey(name: 'team_friends')
  final List<CreditsModel>? teamFriends;
  @JsonKey(name: 'teams')
  final List<CreditsModel>? teams;
  @JsonKey(name: 'volume_credits')
  final List<CreditsModel>? volumeCredits;

  CharacterModel({
    this.birth,
    this.characterEnemies,
    this.characterFriends,
    this.countOfIssueAppearances,
    this.creators,
    super.dateAdded,
    super.dateLastUpdated,
    super.deck,
    super.description,
    this.firstAppearedIIssue,
    super.id,
    this.issueCredits,
    this.issuesDiedIn,
    this.movies,
    super.name,
    this.powers,
    this.publisher,
    this.realName,
    this.storyArcCredits,
    this.teamEnemies,
    this.teamFriends,
    this.teams,
    this.volumeCredits,
    super.imageModel,
    super.apiDetailUrl,
    super.siteDetailUrl,
    super.aliases,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return _$CharacterModelFromJson(json);
  }
  @override
  Map<String, dynamic> toJson() => _$CharacterModelToJson(this);
}
