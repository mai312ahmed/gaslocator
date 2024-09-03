enum CenterStatus { open, close }

extension CenterStatusX on CenterStatus {
  String get name {
    switch (this) {
      case CenterStatus.close:
        return 'close';

      case CenterStatus.open:
        return 'open';
    }
  }
}
