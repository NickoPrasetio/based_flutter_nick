import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_localizations/src/utils/date_localizations.dart'
    as util;

/*
 * Override _MaterialLocalizationsDelegate from material_localizations.dart
 * to delegate custom localization class
 */
class BackButtonTextDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const BackButtonTextDelegate(this._localName);

  final String _localName;

  @override
  Future<BackButtonTextOverride> load(Locale locale) {
    util.loadDateIntlDataIfNotLoaded();

    final String localeName = intl.Intl.canonicalizedLocale(locale.toString());
    assert(
      locale.toString() == localeName,
      'Flutter does not support the non-standard locale form $locale (which '
      'might be $localeName',
    );

    intl.DateFormat fullYearFormat;
    intl.DateFormat compactDateFormat;
    intl.DateFormat shortDateFormat;
    intl.DateFormat mediumDateFormat;
    intl.DateFormat longDateFormat;
    intl.DateFormat yearMonthFormat;
    intl.DateFormat shortMonthDayFormat;
    if (intl.DateFormat.localeExists(localeName)) {
      fullYearFormat = intl.DateFormat.y(localeName);
      compactDateFormat = intl.DateFormat.yMd(localeName);
      shortDateFormat = intl.DateFormat.yMMMd(localeName);
      mediumDateFormat = intl.DateFormat.MMMEd(localeName);
      longDateFormat = intl.DateFormat.yMMMMEEEEd(localeName);
      yearMonthFormat = intl.DateFormat.yMMMM(localeName);
      shortMonthDayFormat = intl.DateFormat.MMMd(localeName);
    } else if (intl.DateFormat.localeExists(locale.languageCode)) {
      fullYearFormat = intl.DateFormat.y(locale.languageCode);
      compactDateFormat = intl.DateFormat.yMd(locale.languageCode);
      shortDateFormat = intl.DateFormat.yMMMd(locale.languageCode);
      mediumDateFormat = intl.DateFormat.MMMEd(locale.languageCode);
      longDateFormat = intl.DateFormat.yMMMMEEEEd(locale.languageCode);
      yearMonthFormat = intl.DateFormat.yMMMM(locale.languageCode);
      shortMonthDayFormat = intl.DateFormat.MMMd(locale.languageCode);
    } else {
      fullYearFormat = intl.DateFormat.y();
      compactDateFormat = intl.DateFormat.yMd();
      shortDateFormat = intl.DateFormat.yMMMd();
      mediumDateFormat = intl.DateFormat.MMMEd();
      longDateFormat = intl.DateFormat.yMMMMEEEEd();
      yearMonthFormat = intl.DateFormat.yMMMM();
      shortMonthDayFormat = intl.DateFormat.MMMd();
    }

    intl.NumberFormat decimalFormat;
    intl.NumberFormat twoDigitZeroPaddedFormat;
    if (intl.NumberFormat.localeExists(localeName)) {
      decimalFormat = intl.NumberFormat.decimalPattern(localeName);
      twoDigitZeroPaddedFormat = intl.NumberFormat('00', localeName);
    } else if (intl.NumberFormat.localeExists(locale.languageCode)) {
      decimalFormat = intl.NumberFormat.decimalPattern(locale.languageCode);
      twoDigitZeroPaddedFormat = intl.NumberFormat('00', locale.languageCode);
    } else {
      decimalFormat = intl.NumberFormat.decimalPattern();
      twoDigitZeroPaddedFormat = intl.NumberFormat('00');
    }
    return SynchronousFuture(BackButtonTextOverride(
        localeName: localeName,
        fullYearFormat: fullYearFormat,
        compactDateFormat: compactDateFormat,
        shortDateFormat: shortDateFormat,
        mediumDateFormat: mediumDateFormat,
        longDateFormat: longDateFormat,
        yearMonthFormat: yearMonthFormat,
        shortMonthDayFormat: shortMonthDayFormat,
        decimalFormat: decimalFormat,
        twoDigitZeroPaddedFormat: twoDigitZeroPaddedFormat));
  }

  @override
  bool shouldReload(BackButtonTextDelegate old) => false;

  @override
  bool isSupported(Locale locale) {
    return [_localName].contains(locale.languageCode);
  }
}

/*
 * Override MaterialLocalizationId from generated_material_localizations.dart
 * only need to change backButton tooltip to null to not show tooltip if backButton AppBar long pressed
 * for more info check generated_material_localizations.dart
 */
class BackButtonTextOverride extends GlobalMaterialLocalizations {
  const BackButtonTextOverride({
    String localeName,
    @required intl.DateFormat fullYearFormat,
    @required intl.DateFormat compactDateFormat,
    @required intl.DateFormat shortDateFormat,
    @required intl.DateFormat mediumDateFormat,
    @required intl.DateFormat longDateFormat,
    @required intl.DateFormat yearMonthFormat,
    @required intl.DateFormat shortMonthDayFormat,
    @required intl.NumberFormat decimalFormat,
    @required intl.NumberFormat twoDigitZeroPaddedFormat,
  }) : super(
          localeName: localeName,
          fullYearFormat: fullYearFormat,
          compactDateFormat: compactDateFormat,
          shortDateFormat: shortDateFormat,
          mediumDateFormat: mediumDateFormat,
          longDateFormat: longDateFormat,
          yearMonthFormat: yearMonthFormat,
          shortMonthDayFormat: shortMonthDayFormat,
          decimalFormat: decimalFormat,
          twoDigitZeroPaddedFormat: twoDigitZeroPaddedFormat,
        );

  @override
  String get aboutListTileTitleRaw => 'Tentang \$applicationName';

  @override
  String get alertDialogLabel => 'Notifikasi';

  @override
  String get anteMeridiemAbbreviation => 'AM';

  // only needs to refactor this backButton tooltip
  @override
  String get backButtonTooltip => null;

  @override
  String get calendarModeButtonLabel => 'Switch to calendar';

  @override
  String get cancelButtonLabel => 'BATAL';

  @override
  String get closeButtonLabel => 'TUTUP';

  @override
  String get closeButtonTooltip => 'Tutup';

  @override
  String get collapsedIconTapHint => 'Luaskan';

  @override
  String get continueButtonLabel => 'LANJUTKAN';

  @override
  String get copyButtonLabel => 'SALIN';

  @override
  String get cutButtonLabel => 'POTONG';

  @override
  String get dateHelpText => 'mm/dd/yyyy';

  @override
  String get dateInputLabel => 'Enter Date';

  @override
  String get dateOutOfRangeLabel => 'Out of range.';

  @override
  String get datePickerHelpText => 'SELECT DATE';

  @override
  String get dateRangeEndDateSemanticLabelRaw => 'End date \$fullDate';

  @override
  String get dateRangeEndLabel => 'End Date';

  @override
  String get dateRangePickerHelpText => 'SELECT RANGE';

  @override
  String get dateRangeStartDateSemanticLabelRaw => 'Start date \$fullDate';

  @override
  String get dateRangeStartLabel => 'Start Date';

  @override
  String get dateSeparator => '/';

  @override
  String get deleteButtonTooltip => 'Hapus';

  @override
  String get dialogLabel => 'Dialog';

  @override
  String get drawerLabel => 'Menu navigasi';

  @override
  String get expandedIconTapHint => 'Ciutkan';

  @override
  String get hideAccountsLabel => 'Sembunyikan akun';

  @override
  String get inputDateModeButtonLabel => 'Switch to input';

  @override
  String get invalidDateFormatLabel => 'Invalid format.';

  @override
  String get invalidDateRangeLabel => 'Invalid range.';

  @override
  String get licensesPageTitle => 'Lisensi';

  @override
  String get modalBarrierDismissLabel => 'Tutup';

  @override
  String get moreButtonTooltip => 'Lainnya';

  @override
  String get nextMonthTooltip => 'Bulan berikutnya';

  @override
  String get nextPageTooltip => 'Halaman berikutnya';

  @override
  String get okButtonLabel => 'OKE';

  @override
  String get openAppDrawerTooltip => 'Buka menu navigasi';

  @override
  String get pageRowsInfoTitleRaw => '\$firstRow–\$lastRow dari \$rowCount';

  @override
  String get pageRowsInfoTitleApproximateRaw =>
      '\$firstRow–\$lastRow dari kira-kira \$rowCount';

  @override
  String get pasteButtonLabel => 'TEMPEL';

  @override
  String get popupMenuLabel => 'Menu pop-up';

  @override
  String get postMeridiemAbbreviation => 'PM';

  @override
  String get previousMonthTooltip => 'Bulan sebelumnya';

  @override
  String get previousPageTooltip => 'Halaman sebelumnya';

  @override
  String get refreshIndicatorSemanticLabel => 'Memuat ulang';

  @override
  String get remainingTextFieldCharacterCountFew => null;

  @override
  String get remainingTextFieldCharacterCountMany => null;

  @override
  String get remainingTextFieldCharacterCountOne => 'Sisa 1 karakter';

  @override
  String get remainingTextFieldCharacterCountOther =>
      'Sisa \$remainingCount karakter';

  @override
  String get remainingTextFieldCharacterCountTwo => null;

  @override
  String get remainingTextFieldCharacterCountZero => 'TBD';

  @override
  String get reorderItemDown => 'Turunkan';

  @override
  String get reorderItemLeft => 'Pindahkan ke kiri';

  @override
  String get reorderItemRight => 'Pindahkan ke kanan';

  @override
  String get reorderItemToEnd => 'Pindahkan ke akhir';

  @override
  String get reorderItemToStart => 'Pindahkan ke awal';

  @override
  String get reorderItemUp => 'Naikkan';

  @override
  String get rowsPerPageTitle => 'Baris per halaman:';

  @override
  String get saveButtonLabel => 'SAVE';

  @override
  ScriptCategory get scriptCategory => ScriptCategory.englishLike;

  @override
  String get searchFieldLabel => 'Telusuri';

  @override
  String get selectAllButtonLabel => 'PILIH SEMUA';

  @override
  String get selectYearSemanticsLabel => 'Select year';

  @override
  String get selectedRowCountTitleFew => null;

  @override
  String get selectedRowCountTitleMany => null;

  @override
  String get selectedRowCountTitleOne => '1 item dipilih';

  @override
  String get selectedRowCountTitleOther => '\$selectedRowCount item dipilih';

  @override
  String get selectedRowCountTitleTwo => null;

  @override
  String get selectedRowCountTitleZero => null;

  @override
  String get showAccountsLabel => 'Tampilkan akun';

  @override
  String get showMenuTooltip => 'Tampilkan menu';

  @override
  String get signedInLabel => 'Telah login';

  @override
  String get tabLabelRaw => 'Tab \$tabIndex dari \$tabCount';

  @override
  TimeOfDayFormat get timeOfDayFormatRaw => TimeOfDayFormat.HH_colon_mm;

  @override
  String get timePickerHourModeAnnouncement => 'Pilih jam';

  @override
  String get timePickerMinuteModeAnnouncement => 'Pilih menit';

  @override
  String get unspecifiedDate => 'Date';

  @override
  String get unspecifiedDateRange => 'Date Range';

  @override
  String get viewLicensesButtonLabel => 'LIHAT LISENSI';

  @override
  // TODO: implement dialModeButtonLabel
  String get dialModeButtonLabel => throw UnimplementedError();

  @override
  // TODO: implement inputTimeModeButtonLabel
  String get inputTimeModeButtonLabel => throw UnimplementedError();

  @override
  // TODO: implement invalidTimeLabel
  String get invalidTimeLabel => throw UnimplementedError();

  @override
  // TODO: implement licensesPackageDetailTextOther
  String get licensesPackageDetailTextOther => throw UnimplementedError();

  @override
  // TODO: implement timePickerDialHelpText
  String get timePickerDialHelpText => throw UnimplementedError();

  @override
  // TODO: implement timePickerHourLabel
  String get timePickerHourLabel => throw UnimplementedError();

  @override
  // TODO: implement timePickerInputHelpText
  String get timePickerInputHelpText => throw UnimplementedError();

  @override
  // TODO: implement timePickerMinuteLabel
  String get timePickerMinuteLabel => throw UnimplementedError();
}
