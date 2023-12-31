
abstract class OnboardEvent{}

class ChangeAxisEvent extends OnboardEvent{
  double ? xAxis;
  double ? yAxis;

  ChangeAxisEvent({this.xAxis, this.yAxis});
}

class NextPageEvent extends OnboardEvent{}
