import 'package:admin_fe/components/index.dart';
import 'package:admin_fe/provider/index.dart';
import 'package:admin_fe/utils/index.dart';
import 'package:flutter/material.dart';

import '../../../../utils/them.dart';

class PasswordDetailsTab extends StatefulWidget {
  const PasswordDetailsTab({Key? key, required this.formKey}) : super(key: key);

  // final Function(Function) onNext;
  // final Function(Function) onPrevious;
  final GlobalKey<FormState> formKey;
  // final Function incrementTab;
  // final Function decrementTab;

  @override
  State<PasswordDetailsTab> createState() => _PasswordDetailsTabState();
}

String createPasswordStateValue = "";

class _PasswordDetailsTabState extends State<PasswordDetailsTab> {
  String s =
      '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. In venenatis accumsan mattis. Morbi finibus lectus sed lacus volutpat, vel mattis erat blandit. Maecenas ante ligula, blandit ac tincidunt dapibus, maximus in odio. Praesent sit amet ante non urna consequat lobortis a sed massa. Etiam tristique imperdiet magna a dictum. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis ligula augue, fermentum id ligula nec, tincidunt imperdiet tellus. Ut quis porttitor felis. Ut molestie sapien nec odio bibendum tempus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Ut ultrices dui sapien, eu scelerisque velit aliquam ornare. In velit lacus, aliquet nec dictum eu, semper et est. Sed fermentum arcu in velit commodo porttitor. Donec facilisis dignissim nisl, nec aliquet lacus.

Aenean commodo vulputate nisl, sed auctor libero eleifend ut. Etiam vulputate gravida aliquet. Quisque mattis vestibulum arcu sit amet tempus. Nam facilisis, tortor id feugiat feugiat, sem ex porttitor urna, at ornare urna velit condimentum quam. Etiam tempus efficitur tincidunt. Etiam laoreet scelerisque nunc, et posuere dolor ullamcorper eget. Pellentesque et diam in est sagittis malesuada vitae non massa. Etiam commodo quam magna, ac congue odio scelerisque in.

In mattis elementum nisl, eget sodales libero euismod et. Fusce et sapien et eros accumsan convallis. Etiam non nibh ligula. Nunc elit mi, vehicula vitae tempus non, molestie fringilla nisl. Sed et lacus quis neque convallis ornare. Suspendisse potenti. Nulla porttitor urna ut ante suscipit vestibulum. Ut nulla metus, congue at lacus ac, mattis egestas leo. Aenean vitae leo nunc. Sed vel ex est. Mauris porttitor sem a nibh posuere euismod nec ac lectus. Duis lacus nisi, molestie nec lorem sed, viverra fringilla justo. Nulla sed porta justo. Nullam iaculis justo ut nisi semper pharetra.

Fusce est sem, elementum vitae tortor eu, posuere semper arcu. Proin enim nisi, suscipit id elit imperdiet, dictum blandit nisi. Morbi sed ligula ac velit ultricies vulputate. Donec sed neque magna. Etiam velit diam, fermentum id eros a, lacinia feugiat odio. Nulla imperdiet, ipsum a suscipit semper, felis ipsum congue ex, nec dictum tellus purus ac lacus. Morbi ac magna eget massa mattis venenatis. Aenean ultricies consequat ultricies. Curabitur non vehicula sapien. Morbi dignissim sagittis tortor in rhoncus. Suspendisse ac malesuada urna.

Donec dolor purus, bibendum at rhoncus a, efficitur non velit. Curabitur consectetur felis enim, at ornare nulla pellentesque eget. Quisque et nisi quis nisi mollis blandit vel a augue. Duis tincidunt enim tellus, at sagittis mi eleifend venenatis. Maecenas ac mauris cursus, condimentum nisl quis, tincidunt dolor. Sed sit amet mauris pharetra, condimentum neque condimentum, sollicitudin mi. Suspendisse quis varius est, in imperdiet ex. Vestibulum nec mollis tellus. Praesent sollicitudin at nulla et laoreet. Etiam gravida cursus purus et semper. Praesent viverra dapibus augue in pharetra. Sed elementum elit arcu. Nunc cursus id arcu non fringilla. Vestibulum pellentesque eros sit amet ligula molestie, id lobortis metus scelerisque. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nullam at urna sodales, commodo mi in, finibus urna.

Donec turpis libero, tempus sit amet lobortis eget, placerat vel lacus. Proin ultricies turpis ac aliquam ullamcorper. Proin aliquam tempus neque. Vivamus in rutrum elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque feugiat lobortis augue, et aliquet augue tempus ac. Proin eget auctor metus. Fusce ut porta nisl. Cras sodales elementum libero. Praesent ut vulputate mauris.

Morbi rhoncus massa sem, et semper neque convallis et. Etiam pharetra felis quis enim volutpat porttitor. Nullam euismod ante id justo vestibulum, non tempor felis dapibus. Vestibulum iaculis risus eu efficitur finibus. Nulla nec sem in ligula tempor iaculis. Aenean eu felis eget neque cursus ullamcorper ut id massa. Etiam scelerisque maximus ipsum eleifend tristique. Vivamus ultricies nulla felis, vel rhoncus quam commodo id. Phasellus tempus urna libero. In a massa nec tellus aliquam dictum. Integer sollicitudin augue a arcu pellentesque, sit amet lobortis lectus finibus. Cras porttitor nisi molestie iaculis viverra. Nunc facilisis libero ut mauris elementum fringilla.

Mauris id ipsum id elit rhoncus accumsan vel ac erat. Donec accumsan et dolor et tristique. Donec semper ipsum at elementum pharetra. Maecenas vitae tortor vitae enim ullamcorper hendrerit. Praesent at faucibus ante. Vestibulum tortor nisl, finibus ut bibendum id, gravida vel arcu. Fusce sed orci ut purus venenatis blandit at et arcu. Donec lacinia interdum diam, at pretium tortor tincidunt a. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Etiam mauris odio, rutrum quis dui vel, interdum gravida nisl. Quisque suscipit semper justo sed ornare.

Vivamus laoreet nisl at malesuada aliquam. Morbi eu ornare odio, at tempor neque. Quisque commodo, urna quis sollicitudin malesuada, arcu libero tempus arcu, ut gravida tortor sem semper nisi. Phasellus congue, lectus sed mollis ultricies, turpis lacus porttitor nibh, sed faucibus nunc ante non turpis. Aliquam nisi nibh, finibus ut ultricies eu, dignissim vitae erat. Vestibulum suscipit arcu quis vestibulum faucibus. Cras eu tincidunt justo. Praesent id tellus pretium, ultrices est nec, tincidunt enim. Ut eu porttitor lacus.

Cras suscipit justo a risus tincidunt, at accumsan erat dignissim. Suspendisse massa erat, aliquam sed urna in, ornare molestie enim. Vestibulum blandit felis nec eleifend eleifend. Morbi consectetur turpis sed est pellentesque, sit amet scelerisque eros consequat. Vivamus ornare ultricies lacus, vel volutpat arcu porttitor vitae. Sed suscipit sagittis libero ut viverra. Proin ut diam non sem bibendum sodales. Aliquam vitae auctor quam, ut porta leo. Sed pulvinar suscipit enim, sit amet vehicula quam tristique sed. Suspendisse id facilisis felis, eget porta enim. Vivamus tellus arcu, pretium ut faucibus ac, bibendum vel leo. Aliquam hendrerit, augue ut mattis pharetra, quam orci tempus enim, id maximus felis lectus at tortor. Nam congue est magna, at rhoncus purus egestas et. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nunc id pulvinar orci.

Quisque mattis ligula at libero consectetur, vel dapibus neque pharetra. Nam lorem tellus, viverra eget aliquam et, vulputate ut sem. Fusce non justo non tellus bibendum pharetra sit amet id urna. Maecenas vitae libero sit amet dolor euismod consequat. Proin ac nibh a nisi aliquam eleifend. In hac habitasse platea dictumst. Vestibulum ultricies fermentum risus.

Pellentesque efficitur pellentesque risus, vitae auctor augue bibendum at. Donec ultrices quam vel tortor cursus elementum. Aliquam ac dignissim nisi. Nam eu dignissim risus, eu eleifend sapien. Aliquam a nisi at enim euismod ultrices. In euismod pulvinar interdum. Sed id velit quis elit elementum ultrices ut sit amet dui. Suspendisse potenti. Proin ornare sit amet magna quis fringilla. Fusce non posuere enim. Sed blandit libero non auctor facilisis.

Nunc ornare nunc ac odio finibus, id rhoncus sapien finibus. Nam pharetra id augue non placerat. Sed luctus libero in lacinia sodales. Aenean quis iaculis augue. Nulla elit sem, imperdiet ac nisi at, bibendum semper ipsum. Vestibulum fermentum volutpat dolor, ac scelerisque erat convallis eu. Proin vel felis quis nulla rutrum porta sed non ex. Proin et egestas eros. Praesent ut egestas quam. Nulla facilisis urna non orci finibus laoreet. Nulla fermentum interdum est, vitae tincidunt justo pulvinar ut. Aliquam erat volutpat. Integer laoreet neque nunc, vel aliquet augue volutpat a. Morbi a nunc et risus egestas bibendum. Nulla non metus non elit convallis finibus. Ut a dictum dui.

Etiam mauris leo, lacinia ut eros ac, fringilla imperdiet felis. Donec vitae ipsum ultrices, sollicitudin lacus eu, condimentum enim. Etiam pharetra neque nec ultrices interdum. Phasellus consectetur tortor vel eleifend lobortis. Mauris blandit neque tortor, sed condimentum sem tincidunt eget. Fusce mauris diam, feugiat id mi semper, viverra scelerisque nunc. Sed laoreet erat sed mi viverra, ut lacinia enim congue. Donec nulla dolor, sodales ut semper a, vulputate et orci. Aliquam in nisl egestas, gravida tortor consectetur, accumsan ante. Vivamus turpis justo, tempus et elementum eu, ultrices non neque. Aliquam congue velit sed tellus tincidunt consectetur. Sed malesuada fermentum magna a tristique.

Maecenas a fringilla tellus. Nullam ante lectus, auctor sed euismod eu, tincidunt eget lacus. Donec eget imperdiet quam. Sed non risus nisl. Vivamus molestie arcu mattis mauris tincidunt scelerisque. Nam vitae vestibulum felis. Aenean dapibus mollis dolor quis pretium. Pellentesque at hendrerit tortor. Nulla faucibus consectetur turpis, non dapibus est. Cras vulputate risus sed bibendum blandit. Cras euismod mauris lectus, quis feugiat risus ullamcorper in. Etiam consequat urna id felis laoreet, et finibus turpis sagittis.

Suspendisse arcu dolor, mollis at egestas ac, pellentesque id velit. Sed aliquet fringilla eros vel consequat. Nullam id dolor et turpis fringilla auctor. Sed velit nunc, egestas ut ipsum quis, interdum viverra justo. Etiam ac ipsum volutpat, porttitor lorem eu, ultrices neque. In ut rutrum magna. Praesent malesuada justo massa, quis interdum dolor porta non.

Maecenas ut dignissim orci, in pulvinar tortor. Fusce a orci non ante vehicula posuere tincidunt consequat est. Vivamus tortor ex, ultricies non ex in, euismod dictum nisi. Nunc vel neque consectetur, pellentesque sem in, auctor leo. Maecenas interdum massa vel dui consequat, non bibendum nisi placerat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce nec eros dictum, efficitur ante at, auctor quam. Nam consequat pellentesque lectus, quis ultrices nibh tincidunt ac.

Pellentesque eu quam accumsan, lacinia elit non, viverra purus. Vestibulum porttitor lorem vel aliquet auctor. Suspendisse dapibus aliquam erat congue vestibulum. Fusce elit quam, sagittis scelerisque elit ac, cursus scelerisque enim. Vestibulum est odio, blandit ac blandit ac, blandit nec diam. Nunc placerat massa eget sollicitudin dignissim. In finibus nisi vitae turpis posuere sollicitudin. Maecenas lacinia purus vitae faucibus porttitor.

Sed euismod quam at nibh bibendum eleifend. Praesent vehicula congue ornare. Nullam sapien diam, consectetur quis risus nec, gravida tempor quam. Proin porta nisl dolor, luctus molestie neque porta id. Ut et aliquet nulla. Donec fringilla ante a leo scelerisque, id posuere neque pharetra. Morbi orci nisi, fermentum sed libero sed, faucibus vehicula tortor. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Fusce tempor at elit in tempor.

In tincidunt, nunc id egestas tristique, felis ex auctor urna, ac auctor augue metus quis mi. Etiam tempor enim ut elit imperdiet pretium. Vivamus urna sem, tincidunt quis sem et, hendrerit viverra lorem. Nunc consectetur arcu sit amet risus dapibus, eget sodales felis facilisis. Aliquam molestie pellentesque dictum. Nullam ullamcorper ante in dapibus fringilla. Integer tristique sapien vehicula ultrices porta.

Duis ultricies diam quis diam lobortis, quis mattis dolor egestas. Maecenas eu auctor felis. Suspendisse quis diam fringilla, fermentum nisl non, molestie orci. Suspendisse posuere, magna interdum suscipit mollis, velit nisl faucibus sem, finibus imperdiet mauris purus at neque. In hac habitasse platea dictumst. Phasellus volutpat lorem porta mi aliquam, sed tincidunt sapien facilisis. Proin aliquam ultricies ipsum, vitae pharetra lectus laoreet et. Morbi aliquet lectus eu ante varius porttitor sed eu tellus. Nam mattis erat dui, id egestas urna placerat a. Suspendisse placerat id orci eget viverra. Cras luctus cursus ipsum, vel tincidunt ipsum imperdiet ut. Etiam vestibulum leo libero, a pharetra nulla elementum iaculis. Duis accumsan tellus eget magna egestas, finibus volutpat est faucibus. Aliquam quis suscipit metus.

Mauris et lorem vitae sapien semper blandit in vel tellus. Fusce quis vestibulum nulla, vel aliquam leo. Vestibulum volutpat, sem quis bibendum feugiat, dolor lectus interdum urna, non lacinia magna quam a nisl. Aliquam at turpis non magna vulputate lobortis et ac ipsum. In hac habitasse platea dictumst. Mauris a neque vitae nisl viverra sagittis ac sed est. Suspendisse vehicula consequat interdum. Pellentesque facilisis mauris et tincidunt mattis. Mauris rutrum orci erat, et efficitur est lacinia non.

Duis in magna velit. Praesent suscipit, est quis eleifend luctus, ante sapien hendrerit turpis, non consectetur odio nibh ut ligula. Cras porta libero et vehicula feugiat. Pellentesque et malesuada tortor. Maecenas feugiat sagittis nisl, ac pretium ex laoreet ac. Nunc pharetra, nulla nec efficitur pretium, velit tellus eleifend sem, eu feugiat nibh erat nec purus. Nulla a massa accumsan, porttitor dui eget, tincidunt arcu. Curabitur sit amet sagittis dui, quis convallis neque. Fusce lobortis est a tortor congue blandit eu a urna.

Fusce interdum aliquet mauris. Mauris nunc metus, consectetur in lectus a, ullamcorper aliquet nulla. Mauris non dui dapibus, sollicitudin diam vitae, tempor ligula. Etiam sit amet lectus elementum, mollis purus eu, accumsan velit. Ut nec tortor eget tellus fringilla lobortis ut sit amet tortor. Proin condimentum suscipit orci et euismod. Pellentesque sapien lacus, efficitur sit amet lobortis eu, efficitur nec justo. Pellentesque quis suscipit arcu. Maecenas feugiat nec erat in cursus.

Mauris nec rutrum leo. Fusce in urna tempor lectus lacinia imperdiet at ac mauris. Mauris interdum malesuada consectetur. Donec mattis quam tellus, quis lacinia ante vulputate et. Vivamus vel massa sodales, laoreet turpis id, rutrum mi. Cras ullamcorper nisl eu diam mollis vestibulum. Integer id aliquam erat. Nulla eleifend magna magna, a egestas leo iaculis ac.

Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aenean vestibulum et tellus ut tempus. Aliquam sit amet feugiat eros, vulputate congue massa. Ut eu sapien elit. Sed tincidunt turpis eget ipsum tincidunt, sit amet blandit mi aliquam. Sed nulla ex, egestas a vulputate ac, eleifend at enim. Morbi suscipit tellus sed lorem efficitur, sit amet rutrum sem ultricies. Mauris leo orci, ultrices non enim id, sagittis tempor elit. Fusce sit amet risus rhoncus, lacinia neque ac, rhoncus enim. Donec felis sem, pulvinar ac nulla vitae, tristique suscipit quam. Nullam nec posuere augue. Aenean varius, metus nec laoreet sodales, diam dolor scelerisque arcu, vitae finibus odio velit in ex. Vestibulum sem neque, fringilla sit amet finibus in, dignissim a libero.

Nam accumsan lorem et velit rutrum, sit amet egestas ex dictum. Morbi faucibus nisi eget urna scelerisque fringilla. Integer porta ipsum a quam porta, vitae sagittis erat elementum. Nunc tincidunt sem ut efficitur viverra. Aliquam vel laoreet velit, vel placerat erat. Nam sollicitudin lectus quam, at facilisis velit rutrum in. Aenean finibus, ante id tristique elementum, nisl libero iaculis tellus, in ornare dui libero sed nibh. Nunc congue urna ligula, eu pulvinar tortor congue eget. Sed ornare pharetra nulla. Nam molestie sed justo nec tempus. In elementum neque quis ipsum auctor, vel sollicitudin tortor vehicula. Mauris nec sapien vehicula, cursus neque id, molestie augue. Nunc quis leo lectus. Integer suscipit commodo imperdiet.

Nulla sem felis, convallis quis cursus at, convallis quis felis. Mauris dictum lorem id metus eleifend, quis rutrum purus ullamcorper. Integer non lorem eu felis suscipit accumsan. In ultrices erat ipsum, maximus convallis nisi eleifend nec. Donec tortor lacus, rutrum quis tempor at, pretium vitae nibh. Aliquam sit amet metus vitae augue finibus pellentesque a non turpis. Morbi pretium sagittis ipsum, euismod semper dolor placerat at.

Suspendisse vel arcu id sem efficitur venenatis. Aenean in mi a risus dictum cursus. Suspendisse potenti. Etiam non volutpat orci. Nulla et sapien vehicula, pellentesque velit id, sollicitudin ante. Fusce ac dapibus ipsum. Nam sit amet quam in mi scelerisque condimentum sed at velit. Nunc rhoncus porttitor tempus. Proin sed congue libero, eget vehicula libero. Maecenas ultrices lacus a mi tincidunt, vestibulum auctor magna rhoncus. Aliquam tempor rhoncus nulla, in mattis nibh tristique vel.

Praesent non est interdum, eleifend sapien in, blandit felis. Mauris ut tortor sit amet diam posuere ultrices. Proin ornare nisl ac augue mattis rutrum. Vestibulum id ornare diam. Vestibulum turpis mauris, venenatis vitae nisl et, finibus posuere ligula. Nullam consequat nunc scelerisque neque malesuada, ac consectetur orci accumsan. Vivamus facilisis nulla blandit mauris aliquam, imperdiet facilisis ligula sodales.

Phasellus diam eros, convallis id iaculis sit amet, laoreet ut dui. Phasellus malesuada justo sit amet felis dignissim tristique. Duis sit amet leo id dolor pretium condimentum eu in lorem. Sed porta facilisis nulla ut vehicula. Praesent quis pulvinar quam. Phasellus blandit diam eget dui elementum, nec tempus purus sagittis. Praesent tristique orci quis facilisis venenatis. Pellentesque aliquam varius est, vel egestas lacus dignissim ut. Donec laoreet ante eget velit placerat, non ultrices justo feugiat. Proin suscipit varius ultrices. Donec nec tellus quis arcu iaculis dignissim. Nulla viverra sapien enim, nec finibus massa egestas nec. Nulla porttitor justo a felis lobortis pretium. Nam in mauris ut arcu imperdiet luctus. Curabitur blandit pulvinar diam quis sodales. Mauris quis turpis ac libero cursus vestibulum.

Ut vitae eros erat. Nam molestie venenatis quam vitae molestie. Suspendisse varius nunc molestie tortor hendrerit viverra. Vivamus ut tempus nulla, eu viverra sapien. Aliquam erat volutpat. Mauris et dignissim arcu, eu pellentesque justo. Etiam vestibulum eget magna eget pellentesque. Aliquam non dui nec leo egestas porta maximus ac mi. Nam eleifend nulla eu congue varius. Praesent eget risus quis neque blandit maximus.

Quisque magna elit, volutpat vel egestas vitae, interdum id est. Nulla vulputate congue sem ut tristique. Donec malesuada fringilla porttitor. Donec suscipit pharetra sem, non volutpat orci malesuada sit amet. Mauris erat urna, ultrices at nulla ut, pretium pellentesque sem. Ut mattis finibus magna. Nunc at neque id orci fringilla vestibulum venenatis id urna. Curabitur id mollis magna. In non aliquam ex. Aliquam erat volutpat. Nam pharetra nunc lectus, eget pulvinar purus pharetra sed.

Proin arcu diam, convallis a condimentum vitae, ultrices eu urna. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus fringilla ipsum nec tellus lobortis lacinia. Donec egestas urna turpis, et maximus erat imperdiet id. Nulla viverra ante ut enim venenatis, nec cursus turpis mattis. Pellentesque tristique feugiat neque. Suspendisse eu euismod ipsum.

Maecenas lobortis, risus sed ultricies efficitur, nulla sapien interdum nunc, nec semper metus erat varius ipsum. Maecenas semper urna et nibh ultrices ornare. Proin dignissim nisl enim, a maximus quam faucibus ut. Fusce euismod consectetur leo at rhoncus. Etiam vulputate neque at dapibus efficitur. Interdum et malesuada fames ac ante ipsum primis in faucibus. Maecenas eu sollicitudin ligula. Integer malesuada mollis nulla nec accumsan. Vestibulum ut quam eget mauris gravida laoreet a eu arcu.

Sed sit amet ante id sem convallis convallis quis sit amet lorem. In ullamcorper efficitur massa, quis placerat nibh blandit et. Aliquam erat volutpat. Maecenas vitae mattis dolor. Maecenas ut sodales arcu, ut accumsan metus. Donec pellentesque neque vel feugiat fermentum. Proin et elementum justo. Proin non libero eget est dignissim convallis eget a ex. Suspendisse dictum at libero in cursus.

Phasellus tincidunt, enim a hendrerit fermentum, nisi lorem posuere dui, at varius elit enim aliquet mi. Fusce cursus ipsum ligula, sit amet sagittis tortor finibus mattis. Sed dapibus et erat vel volutpat. Quisque tristique urna vitae libero viverra, eu aliquet ex sollicitudin. Curabitur enim nibh, ullamcorper nec sapien suscipit, dapibus semper tellus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Fusce dapibus orci consequat, semper diam ut, bibendum diam. In accumsan ultricies elit. Quisque varius quam sed metus iaculis, vel ornare ipsum porttitor. Donec venenatis magna quis pretium placerat. Cras vehicula tellus quis ipsum ornare, non rhoncus justo tempor.

Etiam fermentum fringilla tincidunt. Sed accumsan rhoncus eros, sit amet porttitor tortor lobortis id. Pellentesque ligula lectus, pharetra in magna quis, finibus consectetur nisl. Etiam pharetra a purus ut ultrices. Mauris gravida ipsum metus, ut laoreet ligula sodales quis. Cras non metus diam. In quis gravida orci, eget convallis justo. Mauris consectetur tristique sapien, a feugiat dolor accumsan ut. Sed dapibus vehicula purus non tincidunt. Vestibulum mi nisi, dictum sed enim a, faucibus sodales tellus. Etiam sagittis, tortor vel viverra gravida, ante magna sodales dui, nec porta magna urna ac augue.

Sed posuere felis augue, sit amet auctor diam tincidunt eu. Vestibulum aliquet convallis luctus. Aliquam quis ex sodales risus maximus efficitur. Donec bibendum volutpat nisl, in efficitur purus. Nullam sit amet tempus ligula, sit amet congue neque. Vestibulum vel sodales ante, dignissim ultrices risus. Quisque eget elit non felis tincidunt interdum. Praesent vitae sem mi. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec interdum libero sollicitudin metus finibus efficitur. Maecenas sed diam nec ligula vestibulum rutrum.

Nulla luctus volutpat ligula vitae lobortis. Fusce varius leo ac dolor commodo, et condimentum erat ultrices. Mauris lacinia consectetur ante id lobortis. Aenean neque ipsum, euismod et urna in, dignissim euismod ante. Nam sit amet metus vitae nisl viverra blandit. Fusce hendrerit ac magna vitae lacinia. Cras non molestie neque, eget placerat quam. Donec pellentesque neque at mi fringilla, quis blandit nunc vestibulum. Ut vitae turpis eu erat dictum tempus. In eleifend ipsum eu enim consectetur, a viverra leo pulvinar. Integer purus orci, tincidunt eu ante at, eleifend faucibus mi. In eleifend tempor nisl id aliquam. Duis aliquet mauris quis turpis facilisis gravida. Morbi pharetra leo ut nisi faucibus semper.

Aliquam a nibh magna. Praesent efficitur tortor in enim porta semper. Sed vitae lorem ut purus finibus sodales nec in mi. Fusce elit orci, imperdiet ultricies dignissim vitae, vulputate quis sapien. Nulla neque dui, laoreet in elit vitae, euismod lobortis tortor. Praesent est diam, porta sit amet porta nec, mollis non sapien. Nulla vel eleifend lorem. Sed malesuada at est ut dapibus. Nam at tempus elit.

Sed pellentesque turpis id tellus convallis, eget convallis leo euismod. Donec congue ultrices iaculis. Quisque tincidunt leo vitae magna semper suscipit. Cras ac diam quis massa suscipit volutpat. Nullam mollis massa vel tortor sodales tempor. Sed gravida leo est. Phasellus et mollis ex, et varius ante. Proin tristique lectus in nibh dictum, id viverra metus tempus. Nam odio sapien, ornare et egestas a, venenatis vitae quam. Suspendisse potenti. Duis ut magna laoreet magna ullamcorper finibus sit amet vel libero. Nullam ac tellus eget dolor porta porttitor. Nam id volutpat enim. Sed a ultricies felis.

Pellentesque ipsum sapien, ultrices ut erat ut, imperdiet ultrices eros. Quisque vitae ex porttitor, tristique erat egestas, volutpat nulla. Aenean malesuada libero a ligula porttitor dignissim. Nulla elementum diam interdum, pulvinar mauris ut, fringilla ligula. Suspendisse sit amet libero et sem venenatis vulputate eu et odio. In dapibus lorem et est aliquet accumsan. In fringilla risus vel libero pretium, vitae tincidunt neque varius. Proin malesuada, mauris nec facilisis fringilla, diam tortor faucibus est, id convallis nisl nisi quis diam.

Vestibulum vel tempus nisi. Etiam cursus nec nisl nec bibendum. Pellentesque suscipit, diam sit amet dictum cursus, felis justo elementum nisl, ut molestie odio sem at nulla. Vestibulum volutpat risus mollis, consequat arcu quis, ornare purus. Ut a tempor odio. Curabitur mollis pellentesque eros ac facilisis. Nullam sed porta sem, eget consequat velit. Curabitur dictum dui a arcu fermentum, id cursus quam posuere. Quisque euismod tincidunt congue. Mauris a ultrices mauris, id viverra tellus. Nam mollis massa eget magna posuere, vitae ullamcorper justo commodo. Vestibulum sollicitudin ipsum in eros tincidunt, at facilisis dolor venenatis.

Sed nec ligula sem. Vestibulum non mauris metus. Nullam quis lectus at felis tempus sollicitudin. Mauris dignissim eros nunc, consequat sollicitudin magna faucibus ac. Integer iaculis turpis ac orci efficitur, a pulvinar libero sodales. Vivamus nec nunc posuere quam fermentum sodales. Sed eu ultrices risus. Maecenas aliquet rhoncus iaculis. Ut sed nulla sodales, ornare turpis non, varius eros.''';
  bool isChecked = false;

  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  bool _reObscureText = true;
  void _reToggle() {
    setState(() {
      _reObscureText = !_reObscureText;
    });
  }

  bool _pinObscureText = true;
  void _pinToggle() {
    setState(() {
      _pinObscureText = !_pinObscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final registerationConsumer = useRegisterationProvider(context);
    return Form(
      key: widget.formKey,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Wrap(
          alignment: WrapAlignment.center,
          runSpacing: 8,
          children: [
            InputTextField(
              hintText: "Create Password*",
              // controller: _password,
              obscureText: _obscureText,
              enableSuggestions: false,
              autocorrect: false,
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      _toggle();
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 16),
                      child: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              prefixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      margin: const EdgeInsets.only(left: 16, right: 16),
                      child: Image.asset("assets/images/password_icon.png")),
                ],
              ),
              onChange: (String value) {
                setState(() {
                  createPasswordStateValue = value;
                });
              },
              validator: (String? value) {
                Map<String, dynamic> validations = {};

                if (value?.isEmpty == true) {
                  validations["error"] = true;
                  validations["message"] = "Password is required";
                } else if (!Validate.password(value ?? "")) {
                  validations["error"] = true;
                  validations["message"] = "Invalid Password";
                }

                return validations;
              },
            ),
            InputTextField(
              hintText: "Retype Password*",
              // controller: _rePassword,
              obscureText: _reObscureText,
              enableSuggestions: false,
              autocorrect: false,
              prefixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      margin: const EdgeInsets.only(left: 16, right: 16),
                      child: Image.asset("assets/images/password_icon.png")),
                ],
              ),
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      _reToggle();
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 16),
                      child: Icon(
                        _reObscureText
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              onChange: (String value) {},
              validator: (String? value) {
                Map<String, dynamic> validations = {};
                if (value?.isEmpty == true) {
                  validations["error"] = true;
                  validations["message"] = "Re-enter password";
                } else if (value != createPasswordStateValue) {
                  validations["error"] = true;
                  validations["message"] = "Password do not match";
                }

                return validations;
              },
              onSaved: (String? value) {
                registerationConsumer.updateUserMaster(password: value);
              },
            ),
            InputTextField(
              hintText: "Create Pen Unlock Pin*",
              // controller: _pin,
              obscureText: _pinObscureText,
              enableSuggestions: false,
              autocorrect: false,
              keyboardType: TextInputType.number,
              prefixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      margin: const EdgeInsets.only(left: 16, right: 16),
                      child: Image.asset("assets/images/password_icon.png")),
                ],
              ),
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      _pinToggle();
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 16),
                      child: Icon(
                        _pinObscureText
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              onChange: (String value) {},
              validator: (String? value) {
                Map<String, dynamic> validations = {};

                if (value?.isEmpty == true) {
                  validations["error"] = true;
                  validations["message"] = "Pin is required";
                } else if ((value?.length ?? 0) < 6) {
                  validations["error"] = true;
                  validations["message"] = "Pin is too short";
                } else if ((value?.length ?? 0) > 6) {
                  validations["error"] = true;
                  validations["message"] = "Pin is too long";
                }

                return validations;
              },
              onSaved: (String? value) {
                registerationConsumer.updateUserMaster(passcode: value);
              },
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(
                left: 16,
              ),
              child: RichText(
                text: const TextSpan(
                    text: 'Password Policy :',
                    style: TextStyle(
                        color: ReplyColors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0),
                    children: [
                      TextSpan(
                        text:
                            '\n\nPassword   should  contain  1 Uppercase latter, 1\n digit, 1 Special Symbol, Atleast 8 digit, Maximum 16 digit.',
                        style: TextStyle(
                          color: ReplyColors.black,
                          fontWeight: FontWeight.w300,
                          fontSize: 12.0,
                        ),
                      )
                    ]),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: ReplyColors.green,
              value: isChecked,
              checkColor: ReplyColors.white,
              onChanged: (value) {
                setState(() {
                  isChecked = !isChecked;
                });
              },
              title: GestureDetector(
                // onTap: () {
                //   Navigator.of(context).restorablePush(alertDialogBox);
                // },
                // onTap: () {
                //   setState(() {
                //     alertDialogBox(
                //       context: context,
                //       title: const Text('Basic dialog title'),
                //       content: const Text(
                //         'A dialog is a type of modal window that\n'
                //         'appears in front of app content to\n'
                //         'provide critical information, or prompt\n'
                //         'for a decision to be made.',
                //       ),
                //       actions: ({required BuildContext context, Map? data}) =>
                //           <Widget>[
                //         TextButton(
                //           style: TextButton.styleFrom(
                //             textStyle: Theme.of(context).textTheme.labelLarge,
                //           ),
                //           child: const Text('Disable'),
                //           onPressed: () {
                //             Navigator.pop(context, {
                //               "_password.text": _password.text,
                //               "_rePassword.text": _rePassword.text,
                //               ...?data
                //             });
                //           },
                //         ),
                //         TextButton(
                //           style: TextButton.styleFrom(
                //             textStyle: Theme.of(context).textTheme.labelLarge,
                //           ),
                //           child: const Text('Enable'),
                //           onPressed: () {
                //             Navigator.of(context).pop();
                //           },
                //         ),
                //       ],
                //     ).then((value) => setState(() {
                //           _password.text = value?["_password.text"];
                //           _rePassword.text = value?["_rePassword.text"];
                //         }));
                //   });
                // },
                onTap: () {
                  alertDialogBox(
                    context: context,
                    title: const Text('Terms & Conditions'),
                    content: ConstrainedBox(
                        constraints:
                            const BoxConstraints(maxHeight: 500, maxWidth: 250),
                        child: SingleChildScrollView(child: Text(s))),
                    actions: ({required BuildContext context, Map? data}) =>
                        <Widget>[
                      TextButton(
                        child: const Text('Accept'),
                        onPressed: () {
                          Navigator.pop(context, {
                            "createPasswordStateValue": createPasswordStateValue
                          });
                        },
                      ),
                    ],
                  ).then((value) {
                    createPasswordStateValue =
                        value?["createPasswordStateValue"];
                  });
                },
                // onTap: () {
                //   setState(() {
                //     showDialog(
                //         context: context,
                //         builder: (BuildContext context) {
                //           return AlertDialog(
                //             title: Text('Conformation'),
                //             content: ConstrainedBox(
                //                 constraints: BoxConstraints(
                //                     maxHeight: 500, maxWidth: 250),
                //                 child:
                //                     SingleChildScrollView(child: Text('$s'))),
                //             actions: [
                //               TextButton(
                //                 onPressed: () {
                //                   //Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateAccount()));
                //                   Navigator.pop(context);
                //                 },
                //                 child: Text('Close'),
                //               ),
                //             ],
                //           );
                //         }).then((value) {});
                //   });
                // },
                child: RichText(
                  text: const TextSpan(
                      text: 'By checking this box, you agree to be \nbound'
                          ' by our',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0),
                      children: [
                        TextSpan(
                          text: ' Terms and Condition',
                          style: TextStyle(
                            color: ReplyColors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ]),
                ),
              ),
            ),
            Button(
              text: 'Submit',
              onTap: () {
                hideKeyboard(context);
                if (widget.formKey.currentState!.validate()) {
                  widget.formKey.currentState!.save();
                  registerationConsumer.postDB(context);
                }
              },
              disabled: !isChecked,
            ),
            // Container(
            //   constraints: BoxConstraints.expand(width: 110.0, height: 45.0),
            //   alignment: Alignment.center,
            //   child: ElevatedButton(
            //     onPressed: isChecked ? () {} : null,
            //     style: ElevatedButton.styleFrom(
            //         padding: EdgeInsets.all(1.0),
            //         backgroundColor: Colors.white,
            //         elevation: 10,
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(20.0),
            //         )),
            //     child: GestureDetector(
            //       onTap: () {
            //         registerationConsumer.postDB(context);
            //       },
            //       child: Ink(
            //         decoration: BoxDecoration(
            //             gradient: LinearGradient(
            //                 begin: Alignment.topCenter,
            //                 end: Alignment.bottomCenter,
            //                 colors: [Color(0xff58669A), Color(0xff202538)]),
            //             borderRadius: BorderRadius.circular(20)),
            //         child: Container(
            //           width: 121,
            //           height: 47,
            //           alignment: Alignment.center,
            //           child: Text(
            //             'SUBMIT',
            //             textAlign: TextAlign.center,
            //             style: TextStyle(
            //               fontSize: 17.0,
            //               fontWeight: FontWeight.w300,
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
