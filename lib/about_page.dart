import 'package:flutter/material.dart';
import 'package:pert3/sidemenu.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 200),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 2),
                blurRadius: 4,
              ),
            ],
          ),
          padding: const EdgeInsets.all(20),
          child: const Column(
            children: [
              Text(
                'Perkenalkan Saya Aufa',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
              Text(
                'Saya merupakan Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque ultrices at dui aliquet laoreet. Nulla ornare risus vel mattis consectetur. Nulla venenatis id lectus et mattis. Praesent nec dignissim eros. In eget dolor in risus congue bibendum elementum quis arcu. Integer egestas metus eu orci convallis, ut aliquam lectus molestie. Nunc neque felis, placerat eget faucibus quis, consectetur sit amet augue. Vestibulum egestas fermentum felis, nec consequat eros interdum sit amet. Duis nec sapien pretium, bibendum metus consectetur, condimentum ipsum. Sed tincidunt, lacus in euismod tempor, enim massa bibendum ante, eget accumsan nisi diam sit amet arcu. Etiam euismod in urna in vehicula. Suspendisse lorem justo, tincidunt quis viverra id, dignissim sit amet massa. Vivamus molestie, purus id facilisis tincidunt, leo leo venenatis urna, eu mattis ante urna sit amet tortor. Donec sit amet imperdiet neque. Donec sit amet ante tincidunt, tristique risus vel, cursus erat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Maecenas nec erat nec arcu consequat suscipit in rhoncus nisi. Donec convallis mollis nulla id commodo. Sed scelerisque tristique ligula ac iaculis. In hac habitasse platea dictumst. Sed eu massa sit amet nunc dignissim pellentesque. Sed ut feugiat massa, in posuere elit. Donec aliquam faucibus massa, vitae suscipit magna lobortis non.',
                textAlign: TextAlign.justify,
              )
            ],
          ),
        ),
      ),
      drawer: const Sidemenu(),
    );
  }
}
