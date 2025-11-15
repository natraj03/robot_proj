*** Settings ***
Resource    ../../keywords/rerverseofstr.robot

*** Test Cases ***
Reverse Basic String
	[Tags]    regression    001     SMO_009
	${input_str}    Set Variable    hello
	${expected_rev_str}     Set Variable    olleh
	${rev_str}      Reverse Given String    ${input_str}
	Should Be Equal As Strings    ${expected_rev_str}     ${rev_str}


Reverse Case Basic String
    [Tags]    sanity    002    SMO_003

	${input_str}    Set Variable    Hello
	${expected_rev_str}     Set Variable    olleH
	${rev_str}      Reverse Given String    ${input_str}
	Should Be Equal As Strings    ${expected_rev_str}     ${rev_str}


Reverse Case Basic with number String
	[Tags]    regression    003    SMO_007      smoke    sanity

	${input_str}    Set Variable    Hello123
	${expected_rev_str}     Set Variable    321olleH
	${rev_str}      Reverse Given String    ${input_str}
	Should Be Equal As Strings    ${expected_rev_str}     ${rev_str}

