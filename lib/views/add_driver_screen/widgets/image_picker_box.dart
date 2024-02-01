import 'package:fire_drive/controller/add_Vehicle/provider/add_vehicle_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ImagePickerBoxWidget extends StatelessWidget {
  const ImagePickerBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final addVehicleProvider =
        Provider.of<AddVehicleProvider>(context, listen: false);
    final addVehicleProviderwatch = context.watch<AddVehicleProvider>();

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        height: height * 0.29,
        width: width * 0.85,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 55, 121, 113),
          border: BorderDirectional(),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: addVehicleProvider.image == null
            ? IconButton(
                icon: const Icon(
                  Icons.image,
                  size: 150,
                ),
                onPressed: () async {
                  // await productProvider.bottomSheet(context);
                  bottomSheet(context);
                },
              )
            : Stack(
                children: [
                  Positioned(
                    child: Center(
                      child: GestureDetector(
                        onTap: () async {
                          bottomSheet(context);
                        },
                        child: SizedBox(
                          height: 220,
                          width: 320,
                          child: Image.file(
                            addVehicleProviderwatch.image!,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Future<Widget?> bottomSheet(BuildContext context) async {
    final addVehicleProvider =
        Provider.of<AddVehicleProvider>(context, listen: false);
    return await showModalBottomSheet(
      backgroundColor: Colors.black,
      // barrierColor: Colors.blue,
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 200,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Pick From Camera',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await addVehicleProvider.getImage(ImageSource.camera);
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.camera,
                        size: 40,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Pick From Gallery',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        addVehicleProvider.getImage(ImageSource.gallery);
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.image,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
