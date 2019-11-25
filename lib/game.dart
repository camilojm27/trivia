//https://codingwithjoe.com/dart-fundamentals-working-with-lists/
class Question {
  String text;
  List<String> answers;

  Question(this.text, this.answers);

  String get texto{
    return '$text $answers';
  }
}

 List<Question> _questiions = [
   Question('What is Android Jetpack?', ['all of these', 'tools', 'documentation', 'libraries']),
   Question('Base class for Layout?', ['ViewGroup', 'ViewSet', 'ViewCollection', 'ViewRoot']),
    Question('Layout for complex Screens?',[
                    'ConstraintLayout', 'GridLayout', 'LinearLayout', 'FrameLayout']),
            Question('Pushing structured data into a Layout?',[
                    'Data Binding', 'Data Pushing', 'Set Text', 'OnClick']),
            Question('Inflate layout in fragments?',[
                    'onCreateView', 'onActivityCreated', 'onCreateLayout', 'onInflateLayout']),
            Question( 'Build system for Android?',[
                    'Gradle', 'Graddle', 'Grodle', 'Groyle']),
            Question('Android vector format?',[
                    'VectorDrawable', 'AndroidVectorDrawable', 'DrawableVector', 'AndroidVector']),
            Question('Android Navigation Component?',[
                    'NavController', 'NavCentral', 'NavMaster', 'NavSwitcher']),
            Question('Registers app with launcher?',[
                    'intent-filter', 'app-registry', 'launcher-registry', 'app-launcher']),
            Question('Mark a layout for Data Binding?', ['<layout>', '<binding>', '<data-binding>', '<dbinding>'])];
 
 void logr (){
   _questiions.forEach((n) => print(n.texto));
 }