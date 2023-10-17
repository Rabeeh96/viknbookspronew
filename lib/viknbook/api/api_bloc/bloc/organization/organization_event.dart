
part of 'organization_bloc.dart';
@immutable
abstract class OrganizationEvent {
}

class ListOrganizationEvent extends OrganizationEvent {
  final int userId;
  final bool is_mobile;

  ListOrganizationEvent({
    required this.userId,
    required this.is_mobile,
  });
}
