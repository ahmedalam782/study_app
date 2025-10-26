import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_app/core/config/base_state/base_state.dart';
import 'package:study_app/core/config/di/injectable_config.dart';
import 'package:study_app/core/errors/handle_errors/handle_errors.dart';
import 'package:study_app/core/shared/widgets/no_internet_widget.dart';
import 'package:study_app/core/theme/styles.dart';
import 'package:study_app/features/home/presentation/view_model/cubit/home_cubit.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final HomeCubit homeCubit = getIt.get<HomeCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeCubit..getAllData(),
      child: Scaffold(
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            final networkCheck =
                handleNetwork(state.productHomeState?.exception) ??
                handleNetwork(state.categoryHomeState?.exception);
            if (state.productHomeState == null ||
                state.categoryHomeState == null ||
                (networkCheck != null && networkCheck == true)) {
              return NoInternetWidget(
                onPressed: () async {
                  await homeCubit.getAllData();
                },
              );
            } else {
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Text(
                      'Products List:',
                      style: Styles.bold(context, 20),
                    ),
                  ),
                  BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      final networkCheck = handleNetwork(
                        state.productHomeState?.exception,
                      );
                       if (state.productHomeState?.state == StateType.error &&
                          (networkCheck == null || networkCheck == false)) {
                        return SliverToBoxAdapter(
                          child: Text(
                            handleError(state.productHomeState?.exception)!,
                            style: Styles.medium(context, 14),
                          ),
                        );
                      }else if (state.productHomeState?.state ==
                          StateType.success) {
                        return SliverList.separated(
                          itemBuilder: (context, index) => Container(
                            padding: const EdgeInsets.all(16),
                            child: Text(
                              state.productHomeState?.data?[index].name ?? '',
                              style: Styles.medium(context, 16),
                            ),
                          ),
                          separatorBuilder: (context, index) => const Divider(),
                          itemCount: state.productHomeState?.data?.length ?? 0,
                        );
                      } else {
                        return const SliverToBoxAdapter(
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }
                    },
                  ),
                  SliverToBoxAdapter(
                    child: Text(
                      'Categories List:',
                      style: Styles.bold(context, 20),
                    ),
                  ),
                  BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      final networkCheck = handleNetwork(
                        state.categoryHomeState?.exception,
                      );
                       if (state.categoryHomeState?.state == StateType.error &&
                          (networkCheck == null || networkCheck == false)) {
                        return SliverToBoxAdapter(
                          child: Text(
                            handleError(state.categoryHomeState?.exception)!,
                            style: Styles.medium(context, 14),
                          ),
                        );
                      } else if (state.categoryHomeState?.state ==
                          StateType.success) {
                        return SliverList.separated(
                          itemBuilder: (context, index) => Container(
                            padding: const EdgeInsets.all(16),
                            child: Text(
                              state.categoryHomeState?.data?[index].name ?? '',
                              style: Styles.medium(context, 16),
                            ),
                          ),
                          separatorBuilder: (context, index) => const Divider(),
                          itemCount: state.categoryHomeState?.data?.length ?? 0,
                        );
                      } else {
                        return const SliverToBoxAdapter(
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }
                    },
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
