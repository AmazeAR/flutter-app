import 'package:flutter/material.dart';
import 'package:flutter_amaze_ar/models/description_model.dart';
import 'package:flutter_amaze_ar/services/description_services.dart';

class DescriptionWidget extends StatefulWidget {
  final String productId;

  const DescriptionWidget({Key? key, required this.productId})
      : super(key: key);

  @override
  _DescriptionWidgetState createState() => _DescriptionWidgetState();
}

class _DescriptionWidgetState extends State<DescriptionWidget> {
  HttpDescriptionServices descriptionServices = HttpDescriptionServices();
  late Future<Description> descriptionFuture;

  @override
  void initState() {
    super.initState();
    descriptionFuture =
        descriptionServices.getDescription(productId: widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: descriptionFuture,
      builder: (BuildContext context, AsyncSnapshot<Description> snapshot) {
        if (snapshot.hasData) {
          Description description = snapshot.data!;
          return Text(
            description.description,
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade600,
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('${snapshot.error}'),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
