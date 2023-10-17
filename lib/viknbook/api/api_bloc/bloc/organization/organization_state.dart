
//import 'package:flutter/cupertino.dart';
part of 'organization_bloc.dart';

@immutable
abstract class OrganizationState {}

class OrganizationInitial extends OrganizationState {}

class OrganizationListLoading extends OrganizationState {}
class OrganizationListLoaded extends OrganizationState {}
class OrganizationListError extends OrganizationState {}