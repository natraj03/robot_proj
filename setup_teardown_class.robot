*** Test Cases ***

sample TC 1
   [Setup]    Load file data
   Log    sample tc 1

   [Teardown]    Teardown Keyword


sample TC 2
   [Setup]    Setup Keyword
   Log    sample tc 1

   [Teardown]    Load file data


*** Keywords ***


Setup Keyword
	Log   this should be called in setup

Teardown Keyword
	Log   this should be called in teardown


Load file data
	Log   file data loaded rerady to exeute


