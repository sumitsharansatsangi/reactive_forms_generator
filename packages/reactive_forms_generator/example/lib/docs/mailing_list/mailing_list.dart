import 'package:example/helpers.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

part 'mailing_list.gform.dart';

@ReactiveFormAnnotation()
class MailingList {
  final List<String?> emailList;
  final String content;

  MailingList(
      {@FormArrayAnnotation(
        validators: [
          mailingListValidator,
        ],
        itemValidators: [
          emailValidator,
        ],
      )
          this.emailList = const [],
      @FormControlAnnotation(
        validators: [requiredValidator],
      )
          this.content = ""});
}
