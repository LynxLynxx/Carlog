import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/extensions/gorouter_extension.dart';
import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/core/router/routes_constants.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/manage_action/manage_action_bloc.dart';
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
      body: BlocBuilder<ManageActionBloc, ManageActionState>(
        builder: (context, state) {
          return Stack(
            children: [
              FlutterMap(
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
                              child: Icon(
                                Icons.location_pin,
                                color: context.primaryColor,
                                size: 40.0,
                              ),
                            ),
                          ]
                        : [],
                  ),
                ],
              ),
              SafeArea(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: PaddingsK.h10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _backIcon(context),
                        _infoIcon(context),
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }

  Widget _backIcon(BuildContext context) => ClipOval(
        child: Material(
          color: context.surfaceDim,
          child: InkWell(
            onTap: () => context.pop(),
            child: const SizedBox(
                width: 40, height: 40, child: Icon(Icons.arrow_back)),
          ),
        ),
      );
  Widget _infoIcon(BuildContext context) => ClipOval(
        child: Material(
          color: context.surfaceDim,
          child: InkWell(
            onTap: () => context.pushAndTrack(RoutesK.mapInfo, extra: {
              'title': S.of(context).information,
              'body': S.of(context).tapOnTheMap,
            }),
            child: const SizedBox(
                width: 40, height: 40, child: Icon(Icons.info_outline)),
          ),
        ),
      );
}
