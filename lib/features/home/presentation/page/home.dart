import 'package:auto_size_text/auto_size_text.dart';
import 'package:find_worker/utils/colors.dart';
import 'package:find_worker/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            topBarWidget(width),
            const SizedBox(height: 20),
            searchField(),
            const SizedBox(height: 20),
            CarouselSlider(
              options: CarouselOptions(height: 150.0, viewportFraction: 1),
              items: [
                BannerContainer(index: 1),
                BannerContainer(index: 2),
                BannerContainer(index: 3),
              ],
            ),
            const SizedBox(height: 20),
            servicesWidget(),
            const SizedBox(height: 20),
            cleaningService(),
            const SizedBox(height: 20),
            bestService()
          ],
        ),
      ),
    );
  }

  Column cleaningService() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 200,
              child: Text(
                'Clean & pest control',
                style: mainTitle.copyWith(
                    fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ),
            Text(
              'Viwe all >>',
              style: labelText.copyWith(
                  color: primaryColor, fontWeight: FontWeight.w700),
            )
          ],
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 190,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 180,
                    height: 120,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: shadowColor.withOpacity(0.5),
                          spreadRadius: 0,
                          blurRadius: 2,
                          offset: const Offset(0, 0),
                        ),
                      ],
                      image: const DecorationImage(
                          image: AssetImage(
                              'assets/images/bathroom_cleaning_img.jpg'),
                          fit: BoxFit.fill),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text('Bathroom Cleaning', style: cardTitle),
                  Text('Service at home',
                      style: cardTitle.copyWith(color: shadowColor)),
                  Row(
                    children: [
                      Text('Start at',
                          style: cardTitle.copyWith(color: shadowColor)),
                      const SizedBox(width: 10),
                      Text('100 ₹',
                          style: cardTitle.copyWith(color: Colors.green)),
                    ],
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(width: 10);
            },
            itemCount: 10,
          ),
        )
      ],
    );
  }

  Column bestService() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 200,
              child: Text(
                'Our best service',
                style: mainTitle.copyWith(
                    fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ),
            Text(
              'Viwe all >>',
              style: labelText.copyWith(
                  color: primaryColor, fontWeight: FontWeight.w700),
            )
          ],
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 190,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 180,
                    height: 120,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: shadowColor.withOpacity(0.5),
                          spreadRadius: 0,
                          blurRadius: 2,
                          offset: const Offset(0, 0),
                        ),
                      ],
                      image: const DecorationImage(
                          image: AssetImage('assets/images/hair_cut_img.jpg'),
                          fit: BoxFit.fill),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text('Salon', style: cardTitle),
                  Text('Free waxing',
                      style: cardTitle.copyWith(color: shadowColor)),
                  Row(
                    children: [
                      Text('Start at',
                          style: cardTitle.copyWith(color: shadowColor)),
                      const SizedBox(width: 10),
                      Text('70 ₹',
                          style: cardTitle.copyWith(color: Colors.green)),
                    ],
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(width: 10);
            },
            itemCount: 10,
          ),
        )
      ],
    );
  }

  Widget servicesWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Services',
              style:
                  mainTitle.copyWith(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            Text(
              'Viwe all >>',
              style: labelText.copyWith(
                  color: primaryColor, fontWeight: FontWeight.w700),
            )
          ],
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 120,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: shadowColor.withOpacity(0.3),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.asset(
                        'assets/images/image_${index + 1}.png',
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    width: 80,
                    child: AutoSizeText(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      'Ac Services',
                      style: labelText,
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(width: 10);
            },
            itemCount: 5,
          ),
        )
      ],
    );
  }

  TextFormField searchField() {
    return TextFormField(
      style: labelText,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        suffixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.mic),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(
            color: shadowColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(
            color: shadowColor,
          ),
        ),
      ),
    );
  }

  Row topBarWidget(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(
              Icons.location_pin,
              color: primaryColor,
              size: 30,
            ),
            const SizedBox(width: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Home',
                  style: mainTitle,
                ),
                SizedBox(
                  width: width * 0.54,
                  child: AutoSizeText(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    minFontSize: 12,
                    'G2,Field View Enclave, Daira street, Palakad',
                    style: labelText,
                  ),
                )
              ],
            )
          ],
        ),
        SvgPicture.asset(
          'assets/vectors/notification_ic.svg',
          width: 30,
          height: 30,
        )
      ],
    );
  }
}

// ignore: must_be_immutable
class BannerContainer extends StatelessWidget {
  int index;
  BannerContainer({
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 150,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Image.asset(
        'assets/vectors/banners/banner_0$index.png',
        fit: BoxFit.fill,
      ),
    );
  }
}
