import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/manage_action/manage_action_bloc.dart';
import 'package:carlog/features/dashboard_features/shared/widgets/custom_appbar.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatelessWidget {
  final BuildContext appContext;
  const MapPage({super.key, required this.appContext});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: appContext.read<ManageActionBloc>(),
      child: const MapView(),
    );
  }
}

class MapView extends StatelessWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<ManageActionBloc, ManageActionState>(
          builder: (context, state) {
            return Column(
              children: [
                //TODO full screen + stack
                CustomAppBar(title: S.of(context).addAction),
                Expanded(
                  child: Container(
                    color: context.surfaceBright,
                    padding: PaddingsK.all24,
                    child: ClipRRect(
                      borderRadius: PaddingsK.circular10,
                      child: FlutterMap(
                        options: MapOptions(
                          initialCenter: const LatLng(52.2297, 21.0122),
                          initialZoom: 13.0,
                          onTap: (tapPosition, latLng) {
                            context.read<ManageActionBloc>().add(
                                  ManageActionEvent.changeLatitude(
                                      latLng.latitude.toString()),
                                );
                            context.read<ManageActionBloc>().add(
                                  ManageActionEvent.changeLongitude(
                                      latLng.longitude.toString()),
                                );
                            context
                                .read<ManageActionBloc>()
                                .add(const ManageActionEvent.generateAddress());
                            context.pop();
                          },
                        ),
                        children: [
                          TileLayer(
                            urlTemplate:
                                "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                            userAgentPackageName: 'carlog',
                          ),
                          MarkerLayer(
                            markers: state.latitude.value.isNotEmpty
                                ? [
                                    Marker(
                                      width: 80.0,
                                      height: 80.0,
                                      point: LatLng(
                                        double.parse(state.latitude.value),
                                        double.parse(state.longitude.value),
                                      ),
                                      child: const Icon(
                                        Icons.location_pin,
                                        color: Colors.red,
                                        size: 40.0,
                                      ),
                                    ),
                                  ]
                                : [],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton:
      //     BlocSelector<ManageActionBloc, ManageActionState, bool>(
      //   selector: (state) {
      //     return state.latitude.value.isNotEmpty &&
      //         state.longitude.value.isNotEmpty;
      //   },
      //   builder: (context, state) {
      //     return FloatingActionButton(
      //       onPressed: () {
      //         context
      //             .read<ManageActionBloc>()
      //             .add(const ManageActionEvent.generateAddress());
      //         context.pop();
      //       },
      //       shape: RoundedRectangleBorder(borderRadius: PaddingsK.circular30),
      //       backgroundColor: context.primaryColor,
      //       child: SvgPicture.asset(
      //         ImagesK.save,
      //         colorFilter: ColorFilter.mode(context.onPrimary, BlendMode.srcIn),
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
