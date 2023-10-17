import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../functions_api/organization.dart';
import '../../model/OrganizationListModelClass.dart';

part 'organization_event.dart';

part 'organization_state.dart';

class OrganizationBloc extends Bloc<OrganizationEvent, OrganizationState> {
  late OrganizationListModelClass organizationListModelClass;

  OrganizationApi organizationApi;

  OrganizationBloc(this.organizationApi) : super(OrganizationInitial()) {
    on<ListOrganizationEvent>((event, emit) async {
      emit(OrganizationListLoading());
      try {
        organizationListModelClass =
            await organizationApi.OrganizationListFunction(
                userId: event.userId, is_mobile: event.is_mobile);

        emit(OrganizationListLoaded());
      } catch (e) {
        emit(OrganizationListError());
        print("-----------------loan list BlocCatchError $e");
      }
    });
  }
}
