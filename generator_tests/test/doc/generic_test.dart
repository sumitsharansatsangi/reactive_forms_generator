@Timeout(Duration(seconds: 145))
import 'package:test/test.dart';

import '../helpers.dart';

const fileName = 'generic';

void main() {
  group('reactive_forms_generator', () {
    test(
      'Freezed support',
      () async {
        return testGenerator(
          fileName: fileName,
          model: '''
            import 'package:freezed_annotation/freezed_annotation.dart';
            import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
            
            part '$fileName.freezed.dart';
            part '$fileName.gform.dart';
            
            @freezed
            @ReactiveFormAnnotation()
            class Tags<T> with _$Tags<T> {
              factory Tags({
                @FormControlAnnotation() required List<T>? tags,
              }) = _Tags;
            
              const Tags._();
            }
          ''',
          generatedFile: generatedFile,
        );
      },
    );
  });
}

const generatedFile = r'''// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file:

part of 'generic.dart';

// **************************************************************************
// ReactiveFormsGenerator
// **************************************************************************

class ReactiveTagsFormConsumer extends StatelessWidget {
  const ReactiveTagsFormConsumer({
    Key? key,
    required this.builder,
    this.child,
  }) : super(key: key);

  final Widget? child;

  final Widget Function(BuildContext context, TagsForm formModel, Widget? child)
      builder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveTagsForm.of(context);

    if (formModel is! TagsForm) {
      throw FormControlParentNotFoundException(this);
    }
    return builder(context, formModel, child);
  }
}

class TagsFormInheritedStreamer extends InheritedStreamer<dynamic> {
  const TagsFormInheritedStreamer({
    Key? key,
    required this.form,
    required Stream<dynamic> stream,
    required Widget child,
  }) : super(
          stream,
          child,
          key: key,
        );

  final TagsForm form;
}

class ReactiveTagsForm extends StatelessWidget {
  const ReactiveTagsForm({
    Key? key,
    required this.form,
    required this.child,
    this.onWillPop,
  }) : super(key: key);

  final Widget child;

  final TagsForm form;

  final WillPopCallback? onWillPop;

  static TagsForm? of(
    BuildContext context, {
    bool listen = true,
  }) {
    if (listen) {
      return context
          .dependOnInheritedWidgetOfExactType<TagsFormInheritedStreamer>()
          ?.form;
    }

    final element = context
        .getElementForInheritedWidgetOfExactType<TagsFormInheritedStreamer>();
    return element == null
        ? null
        : (element.widget as TagsFormInheritedStreamer).form;
  }

  @override
  Widget build(BuildContext context) {
    return TagsFormInheritedStreamer(
      form: form,
      stream: form.form.statusChanged,
      child: WillPopScope(
        onWillPop: onWillPop,
        child: child,
      ),
    );
  }
}

class TagsFormBuilder<T> extends StatefulWidget {
  const TagsFormBuilder({
    Key? key,
    this.model,
    this.child,
    this.onWillPop,
    required this.builder,
    this.initState,
  }) : super(key: key);

  final Tags<T>? model;

  final Widget? child;

  final WillPopCallback? onWillPop;

  final Widget Function(BuildContext context, TagsForm formModel, Widget? child)
      builder;

  final void Function(BuildContext context, TagsForm formModel)? initState;

  @override
  _TagsFormBuilderState<T> createState() => _TagsFormBuilderState<T>();
}

class _TagsFormBuilderState<T> extends State<TagsFormBuilder<T>> {
  late FormGroup _form;

  late TagsForm _formModel;

  @override
  void initState() {
    _form = FormGroup({});
    _formModel = TagsForm<T>(widget.model, _form, null);

    final elements = _formModel.formElements();
    _form.setValidators(elements.validators);
    _form.setAsyncValidators(elements.asyncValidators);

    if (elements.disabled) {
      _form.markAsDisabled();
    }

    _form.addAll(elements.controls);

    widget.initState?.call(context, _formModel);

    super.initState();
  }

  @override
  void dispose() {
    _form.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveTagsForm(
      form: _formModel,
      onWillPop: widget.onWillPop,
      child: ReactiveFormBuilder(
        form: () => _form,
        onWillPop: widget.onWillPop,
        builder: (BuildContext context, FormGroup formGroup, Widget? child) =>
            widget.builder(context, _formModel, widget.child),
        child: widget.child,
      ),
    );
  }
}

class TagsForm<T> implements FormModel<Tags<T>> {
  TagsForm(
    this.tags,
    this.form,
    this.path,
  ) {}

  static String tagsControlName = "tags";

  final Tags<T>? tags;

  final FormGroup form;

  final String? path;

  String tagsControlPath() => pathBuilder(tagsControlName);
  List<T>? get _tagsValue => tagsControl?.value;
  bool get containsTags {
    try {
      form.control(tagsControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  Object? get tagsErrors => tagsControl?.errors;
  void get tagsFocus => form.focus(tagsControlPath());
  void tagsRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsTags) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          tagsControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            tagsControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void tagsValueUpdate(
    List<T>? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    tagsControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void tagsValuePatch(
    List<T>? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    tagsControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void tagsValueReset(
    List<T>? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      tagsControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  FormControl<List<T>>? get tagsControl => containsTags
      ? form.control(tagsControlPath()) as FormControl<List<T>>?
      : null;
  void tagsSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      tagsControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      tagsControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  Tags<T> get model {
    if (!form.valid) {
      debugPrint(
        'Prefer not to call `model` on non-valid form it could cause unexpected exceptions in case you created a non-nullable field in model and expect it to be guarded by some kind of `required` validator.',
      );
    }
    return Tags<T>(tags: _tagsValue);
  }

  TagsForm<T> copyWithPath(String? path) {
    return TagsForm<T>(tags, form, path);
  }

  void updateValue(
    Tags<T> value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.updateValue(
          TagsForm<T>(value, FormGroup({}), null).formElements().rawValue,
          updateParent: updateParent,
          emitEvent: emitEvent);
  void resetValue(
    Tags<T> value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.reset(
          value:
              TagsForm<T>(value, FormGroup({}), null).formElements().rawValue,
          updateParent: updateParent,
          emitEvent: emitEvent);
  void reset({
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.reset(
          value: formElements().rawValue,
          updateParent: updateParent,
          emitEvent: emitEvent);
  String pathBuilder(String? pathItem) =>
      [path, pathItem].whereType<String>().join(".");
  FormGroup formElements() => FormGroup({
        tagsControlName: FormControl<List<T>>(
            value: tags?.tags,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false)
      },
          validators: [],
          asyncValidators: [],
          asyncValidatorsDebounceTime: 250,
          disabled: false);
}

class ReactiveTagsFormArrayBuilder<T> extends StatelessWidget {
  const ReactiveTagsFormArrayBuilder({
    Key? key,
    this.control,
    this.formControl,
    this.builder,
    required this.itemBuilder,
  })  : assert(control != null || formControl != null,
            "You have to specify `control` or `formControl`!"),
        super(key: key);

  final FormArray<T>? formControl;

  final FormArray<T>? Function(TagsForm formModel)? control;

  final Widget Function(
      BuildContext context, List<Widget> itemList, TagsForm formModel)? builder;

  final Widget Function(
      BuildContext context, int i, T? item, TagsForm formModel) itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveTagsForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    return ReactiveFormArray<T>(
      formArray: formControl ?? control?.call(formModel),
      builder: (context, formArray, child) {
        final itemList = (formArray.value ?? [])
            .asMap()
            .map((i, item) {
              return MapEntry(
                i,
                itemBuilder(
                  context,
                  i,
                  item,
                  formModel,
                ),
              );
            })
            .values
            .toList();

        return builder?.call(
              context,
              itemList,
              formModel,
            ) ??
            Column(children: itemList);
      },
    );
  }
}

class ReactiveTagsFormFormGroupArrayBuilder<V> extends StatelessWidget {
  const ReactiveTagsFormFormGroupArrayBuilder({
    Key? key,
    this.extended,
    this.getExtended,
    this.builder,
    required this.itemBuilder,
  })  : assert(extended != null || getExtended != null,
            "You have to specify `control` or `formControl`!"),
        super(key: key);

  final ExtendedControl<List<Map<String, Object?>?>, List<V>>? extended;

  final ExtendedControl<List<Map<String, Object?>?>, List<V>> Function(
      TagsForm formModel)? getExtended;

  final Widget Function(
      BuildContext context, List<Widget> itemList, TagsForm formModel)? builder;

  final Widget Function(
      BuildContext context, int i, V? item, TagsForm formModel) itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveTagsForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    final value = (extended ?? getExtended?.call(formModel))!;

    return StreamBuilder<List<Map<String, Object?>?>?>(
      stream: value.control.valueChanges,
      builder: (context, snapshot) {
        final itemList = (value.value() ?? <V>[])
            .asMap()
            .map((i, item) => MapEntry(
                  i,
                  itemBuilder(
                    context,
                    i,
                    item,
                    formModel,
                  ),
                ))
            .values
            .toList();

        return builder?.call(
              context,
              itemList,
              formModel,
            ) ??
            Column(children: itemList);
      },
    );
  }
}
''';
