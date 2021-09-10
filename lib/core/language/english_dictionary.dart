import 'package:capimobile/core/language/language_dictionary.dart';
import 'package:cloud_firestore_platform_interface/src/timestamp.dart';

class EnglishDictionary implements LanguageDictionary {
  @override
  String get Surveys => 'Surveys';
  @override
  String get Best_Practices => 'Best Practices';
  @override
  String get My_Surveys => 'My Surveys';
  @override
  String get Edit => 'Edit';
  @override
  String get Calculate => 'Calculate';
  @override
  String get Results => 'Results';
  @override
  String get New_Survey => 'New Survey';
  @override
  String get Warning => 'Warning';
  @override
  String get SURVEY_DELETION_CONFIRMATION =>
      'Are you shure you want to delete the selected survey?';
  @override
  String get CAMERA_DELETION_CONFIRMATION =>
      'Are you shure you want to delete the selected camera?';
  @override
  String get Yes => 'Yes';
  @override
  String get No => 'No';

  @override
  String get FastAndFurious => 'Fast and furious';

  @override
  String get FastAndFuriousTEXT =>
      'Always use the best (and fastest) memory cards, to avoid file corruption. If taking photographs in RAW format, there is usually a 1- to 2-seconds delay for the file to be written before you can take another one. With UAVs (drones) this delay is accounted for in the time it takes for the aircraft to move from one waypoint to the next, but with handheld cameras it’s easy to forget about this and take several pictures in sequence, just to realize the files weren’t recorded correctly after you’re back in the office. Respect the limitations of your equipment and avoid adapters such as using mini-SD cards with a SD-compatible camera. Take a laptop to the field and download the photos immediately, to check for any errors;\n\n  Try to take the photographs in a timely manner. Don’t take too long to acquire the images of the entire outcrop, as the light can change both in position and in quality (with a passing cloud, for instance). If possible, take pictures in the morning and in the afternoon;';

  @override
  String get FixedPointInTime => 'Fixed point in time';

  @override
  String get FixedPointInTimeTEXT =>
      'Use permanent markers for the survey points (total station, GPS) such as a steel screw with a small metal washer inserted into the asphalt of a roadway. This will allow you to re-occupy the same point in case additional surveys are necessary, without the need to collect more DGPS data. If possible, insert at least a couple of screws in the outcrop, placed far from each other. In case you need/want to return another day and make a new set of photographs, most likely you will need to place a new set of targets for georeferencing. It will be much faster to set the total station from the known X, Y, Z coordinates of the outcrop points than from the (distant) DGPS points;';

  @override
  String get GetTheBigPcture => 'Get the big picture';

  @override
  String get GetTheBigPctureTEXT =>
      'Take photographs of the outcrop from a larger distance, to create a preliminary 3D model that can help you plan for the next steps of the project, like positioning of targets, effects of illumination, etc. This model can be built in the field with “low-quality” settings of any SfM-MVS software, which do not require much RAM memory or processing power. These images can also serve as guide during the interpretation of the results at the office. ';

  @override
  // ignore: non_constant_identifier_names
  String get KnowThyEnemy => 'Know thy enemy';

  @override
  // ignore: non_constant_identifier_names
  String get KnowThyEnemyTEXT =>
      'It is very important to know the area to be surveyed beforehand. A simple “visit” with GoogleEarthTM won’t be enough to properly plan the activities. Visit the area and check for access paths, parking areas, places to position the equipment (GPS, Total Station, etc.) and physical constraints for image acquisition (can you get close of the outcrop, or do you need telephoto lens? Is there any infrastructure that can interfere in a RPA flight?);';

  @override
  // ignore: non_constant_identifier_names
  String get LetThereBeLight => 'Let there be light';

  @override
  // ignore: non_constant_identifier_names
  String get LetThereBeLightTEXT =>
      'Good lightning is the key to a successful SfM-MVS reconstruction. If the target outcrop is not so large, and you plan to do all (DGPS, total station and photographs) on one day, attach the targets to the outcrop and take the photographs before setting up the total station and DGPS, to take advantage of the mid-morning light. Try to avoid very sunny days since the shadows will be harder. If at all possible, try to take the photographs in cloudy days. There are several mobile applications that can help to predict the position of the sun (and shadows) for any place on Earth at any desired date and time. If you want to use artificial lightning, remember to use at least two diferente light sources, so that the source won’t be recognizable in the images.';

  @override
  // ignore: non_constant_identifier_names
  String get PowerToThePeople => 'Power to the people';

  @override
  // ignore: non_constant_identifier_names
  String get PowerToThePeopleTEXT =>
      'Check all your batteries the day beforehand, but carry a “power bank” to the field. It can save the trip if by any chance the GPS Data Collector, a small camera or even your cellphone runs out of juice.';

  @override
  // ignore: non_constant_identifier_names
  String get RomeWasntBuildInADay => 'Rome wasn’t built in a day';

  @override
  // ignore: non_constant_identifier_names
  String get RomeWasntBuildInADayTEXT =>
      'Always plan for more than one day of fieldwork (or plan more than one short trip). Acquiring DGPS data and total station readings will take at least a day. With post-processing of DGPS data, the precise coordinates will only be available after you return to the office. Usually there’s not enough time to collect total station, DGPS data, structural measures and take the photographs on the same day (unless there’s a big team working at the same time);';

  @override
  // ignore: non_constant_identifier_names
  String get Email => 'E-mail';

  @override
  // ignore: non_constant_identifier_names
  String get ForgotPassword => 'Forgot password?';

  @override
  // ignore: non_constant_identifier_names
  String get LogIn => 'Log in';

  @override
  // ignore: non_constant_identifier_names
  String get LoginViaGoogle => 'Login via Google';

  @override
  // ignore: non_constant_identifier_names
  String get Name => 'Name';

  @override
  String get Password => 'Password';

  @override
  String get SignUp => 'Sign up';

  @override
  String get RecoverPassword => 'Recover Password';

  @override
  String get UserProfile => 'User Profile';

  @override
  String get CameraName => 'Camera Name';

  @override
  String get Dimensions => 'Dimensions';

  @override
  String get FocalLength => 'Focal Length';

  @override
  String get FrontOverlap => 'Frontal Overlap';

  @override
  String get Gsd => 'GSD';

  @override
  String get HorizontalStructures => 'Horizontal Structures';

  @override
  String get OutcropDistance => 'Outcrop Distance';

  @override
  String get OutcropHeight => 'Outcrop Height';

  @override
  String get OutcropWidth => 'Outcrop Width';

  @override
  String get PhotoOrientation => 'Photo Orientation';

  @override
  String get SensorHeightMm => 'Sensor Height (mm)';

  @override
  String get SensorHeightPx => 'Sensor Height (px)';

  @override
  String get SensorWidthMm => 'Sensor Width (mm)';

  @override
  String get SersorWidthPx => 'Sensor Width (px)';

  @override
  String get SideOverlap => 'Side Overlap';

  @override
  String get VerticalStructures => 'Vertical Structures';

  @override
  String get CameraModel => 'Camera Model';

  @override
  String get Required => 'required';

  @override
  String get Login => 'Login';

  @override
  String get NoSurveysYet => 'No Surveys yet';

  @override
  String get Cancel => 'Cancel';

  @override
  String get Ok => 'Ok';

  @override
  String get Save => 'Save';

  @override
  String get RepeatedName => 'Repeated Name';

  @override
  String get SuccessfullySaved => 'Successfully Saved';
  @override
  String get Loading => 'Loading...';

  @override
  String get RegisterNewCamera => 'Register new camera';

  @override
  String get LoginError => 'Login error';
  @override
  String get SigUpRequested => 'Sign up requested';
  @override
  String get EmailNotVerified => 'E-mail not verified';
  @override
  String get PASSWORD_SIZE_ERROR =>
      'The password should contain at least 8 characters';
  @override
  String get Landscape => 'Landscape';
  @override
  String get Portrait => 'Portrait';

  @override
  String formatTimeStampToDate(Timestamp date) {
    return ('${date.toDate().month}/${date.toDate().day}/${date.toDate().year}');
  }

  @override
  String get APPNAME => 'SurvAid';

  @override
  String get CameraData => 'Camera Data';

  @override
  String get Capture => 'Capture';

  @override
  String get DateOfCreation => 'Date of Creation';

  @override
  String get FootPrint => 'Footprint';

  @override
  String get OutcropData => 'Outcrop Data';

  @override
  String get OverlapConfiguration => 'Overlap Configuration';

  @override
  String get ProvidedData => 'Provided Data';

  @override
  String get SurveyOverview => 'Survey Overview';
  @override
  String get SurveyName => 'Survey Name';

  @override
  String get AmountOfPhotos => 'Amount of photos';

  @override
  String get EstimatedProcessTime => 'Estimated Process Time';

  @override
  String get FootPrintHeight => 'Footprint Height';

  @override
  String get FootprintWidth => 'Footprint Width';

  @override
  String get NumberOfLines => 'Number of lines';

  @override
  String get PhotosPerSpot => 'Photos per spot';

  @override
  String get SpaceBetweenLines => 'Space between lines';
  @override
  String get SpaceBetweenPhotos => 'Space between photos';
  @override
  String get CaptureAndProcessing => 'Capture and Processing';

  @override
  String get UnavailableData => 'Unavailable Data';
  @override
  String get OVERLAP_ERROR => 'Error! Verify Overlap';
  @override
  String get OpenPDF => 'View PDF';

  @override
  String get CLEAR_ALL_FIELDS_CONFIRMATION => 'Clear all fields to default?';

  @override
  String get RESTORE_TO_PREVIOUS_STATE_CONFIRMATION =>
      'Restore all fields to the last saved state?';

  @override
  String get General => 'General';

  @override
  String get QRCodeExport => 'QR Code Export';

  @override
  String get QR_CODE_INSTRUCTIONS =>
      'To import the current project parameters to another device go to the "My Surveys" page , open the QR code option and scan this QR Code';

  @override
  String get ManualInput => 'Manual Input';

  @override
  String get QrCodeImport => 'QR Code Import';
  @override
  String get QrCodeError => 'QR Code Error';

  @override
  String get About => 'About';

  @override
  String get AboutMetashape => 'About Metashape';

  @override
  String get ABOUT_METASHAPE_CPU =>
      'The Central Process Unity is the computer’s brain. It is responsible for the tasks and calculation during the processing. It has a direct influence on the processing speed.';

  @override
  String get ABOUT_METASHAPE_DEVELOPMENT =>
      'Whoever tried to generate a model knows that the processing can take quite a lot of time, and even be impractical depending on your computer. With that in mind, we present here some useful information that may help you build an ideal computer or estimate the processing time of your data.';

  @override
  String get ABOUT_METASHAPE_GPU =>
      'While the Graphics Processing Unit is dedicated to graphics tasks, working in parallel with the CPU splitting the tasks and accelerating processing. Although it is not an essential component, it is highly recommended as the graphical calculation is very complex and the CPU may take a while to solve it.';

  @override
  String get ABOUT_METASHAPE_INTRO =>
      ' (former Photoscan) has become one of the most popular SfM-MVS based software. It has a simple and intuitive interface, and the company offers a series of manuals and tutorials, and a user forum that can solve most of your questions.';

  @override
  String get ABOUT_METASHAPE_OUTRO =>
      'But first, lets understand which are the three basic hardware components that the software uses:';

  @override
  String get ABOUT_METASHAPE_RAM =>
      'The Random Access Memory is the temporary space that the software uses to store all the data during a certain processing stage.';

  @override
  String get Cpu => 'CPU';

  @override
  String get Gpu => 'GPU';

  @override
  String get Ram => 'RAM';

  @override
  String get Licenses => 'Licenses';

  @override
  String get Author => 'Author';

  @override
  String get LicenseType => 'LicenseType';

  @override
  String get Version => 'Version';
  @override
  String get Description => 'Description';

  @override
  String get SaveBeforeLeavingThePage =>
      'Save the current project before leaving?';
  @override
  String get ClearAll => 'Clear All';
  @override
  String get Undo => 'Undo';

  @override
  String get ABOUT_METASHAPE_AT_AGiSOFT =>
      'At Agisoft website you can find the ';

  @override
  String get ABOUT_METASHAPE_A_USEFUL_TIP => 'A useful tip:';
  @override
  String get ABOUT_METASHAPE_A_USEFUL_TIP_CONTINUATION =>
      ' whenever you install or update Metashape, go to Tool > Preferences > GPU, select all your GPUs and uncheck the option to use CPU during GPU processing. This will ensure that the software will use only GPUs when GPU acceleration is available.';

  @override
  String get ABOUT_METASHAPE_BASIC_CONFIGURATION => 'basic configuration';

  @override
  String get ABOUT_METASHAPE_CPU_WITH =>
      ': CPU with 4 to 8 core Intel or AMD processor, 2.0+ GHz; 16-32 GB RAM; and GPU NVIDIA or AMD 700+ cores.';

  @override
  String get ABOUT_METASHAPE_ON_YOUR_COMPUTER => ' on your computer';

  @override
  String get ABOUT_METASHAPE_TEST_RESULTS =>
      'benchmark test results of Puget Systems';

  @override
  String get ABOUT_METASHAPE_THEIR_RECOMMENDATIONS =>
      '. Their recommendations will be useful if you want to buy a new computer or update yours to run Metashape.';

  @override
  String get ABOUT_METASHAPE_THIS_LIST =>
      'This list only covers the basics, for instance ensures that the software will run on your computer. To know more about hardware performance, take a look at the ';

  @override
  String get ABOUT_METASHAPE_YOU_CAN => 'You can also ';

  @override
  String get ABOUT_METASHAPE_RUN_THE_BENCHMARK => 'run the benchmark test';

  @override
  String get ABOUT_INTRO =>
      'This app was developed as part of CD Viana’s PhD research, at the Institute of Geosciences of the University of São Paulo. It is a first attempt to gather the most relevant information about image surveying for outcrop 3D models generation using Structure from Motion - Multi-view Stereo. The main goal is to aid non-specialists at field surveying.';
  @override
  String get ABOUT_INTRO_WEB =>
      'This site was developed as part of CD Viana’s PhD research, at the Institute of Geosciences of the University of São Paulo. It is a first attempt to gather the most relevant information about image surveying for outcrop 3D models generation using Structure from Motion - Multi-view Stereo. The main goal is to aid non-specialists at field surveying.';
  @override
  String get ABOUT_ARTHUR =>
      ' M.Sc. Electric Engineer with emphasis in electronic systems. Researcher at the Integrated Systems Laboratory of the Polytechnic School of the University of São Paulo.';
  @override
  String get ABOUT_CAMILA =>
      ' M.Sc. Geologist. Computer Engineering undergrad student. Researches and works with SfM since 2013.';
  @override
  String get About_the_Authors => 'About the authors';

  @override
  String get Resend_confirmation_email => 'Resend confirmation e-mail?';
  @override
  String get Based_on => 'Based on "Best Practices For Fieldwork" from ';

  @override
  String get HELP_DIMENSIONS_CONSIDER =>
      'Consider the vertical dimension of the outcrop as height, and the horizontal as width. If the outcrop is horizontal, consider the largest dimension as width.';
  @override
  String get HELP_DIMENSIONS_TO_DETERMINE =>
      'To determine the level of detail of the images, two possibilities are provided:';
  @override
  String get HELP_DIMENSIONS_SET_OUTCROP => 'Set the outcrop distance';
  @override
  String get HELP_DIMENSIONS_SET_OUTCROP_TEXT =>
      'This option is mainly used when there are restrictions on the distance that the camera can be from the outcrop.';
  @override
  String get HELP_DIMENSIONS_SET_GSD => 'Set the GSD';
  @override
  String get HELP_DIMENSIONS_SET_GSD_TEXT =>
      'GSD (Ground Sampling Distance) is a theoretical measure that, based on the distance from the camera to the object and the geometry of the camera, calculates how much each pixel of the image represents in real measure.';

  @override
  String get HELP_GENERAL_SIDE_OVERLAP_TEXT =>
      'Overlap between images of the same line.';

  @override
  String get HELP_GENERAL_FRONTAL_OVERLAP_TEXT =>
      'Overlap between two different lines.';
  @override
  String get HELP_GENERAL_STRUCTURES => 'Structures';
  @override
  String get HELP_GENERAL_STRUCTURES_TEXT =>
      'If the outcrop presents persistent structures, such as faults or fractures, check the options according to the approximate orientation (vertical and / or horizontal). This will add skewed images to the set, ensuring greater coverage.';

  @override
  String get HELP_GENERAL_CAMERA_ORIENTATION_P1 =>
      'To optimize the number of lines, they must be perpendicular to the smallest dimension of the outcrop, and the largest dimension of the sensor must be perpendicular to the lines.';
  @override
  String get HELP_GENERAL_CAMERA_ORIENTATION_P2 =>
      'On a rectangular vertical outcrop, lines are optimized when the handheld camera is used in the portrait position.';
  @override
  String get HELP_GENERAL_CAMERA_ORIENTATION_P3 =>
      'Using a drone on a vertical mission, the camera will be in a landscape position, which reduces the number of photos per line and increases the number of lines.';
}
