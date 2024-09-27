String timeHandler(String time) {
  switch (time) {
    case '00':
      return '12AM';
    case '01':
      return '1AM';
    case '02':
      return '2AM';
    case '03':
      return '3AM';
    case '04':
      return '4AM';
    case '05':
      return '5AM';
    case '06':
      return '6AM';
    case '07':
      return '7AM';
    case '08':
      return '8AM';
    case '09':
      return '9AM';
    case '10':
      return '10AM';
    case '11':
      return '11AM';
    case '12':
      return '12PM';
    case '13':
      return '1PM';
    case '14':
      return '2PM';
    case '15':
      return '3PM';
    case '16':
      return '4PM';
    case '17':
      return '5PM';
    case '18':
      return '6PM';
    case '19':
      return '7PM';
    case '20':
      return '8PM';
    case '21':
      return '9PM';
    case '22':
      return '10PM';
    case '23':
      return '11PM';
    default:
      return '';
  }
}
