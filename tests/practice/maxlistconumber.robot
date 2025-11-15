*** Settings ***
Library        ../../library/countmaxinlist.py


*** Test Cases ***
Get max test
	[Tags]    regression    011   SMO_011    sanity
	${mylist}   Create List    15   13  11  3  1  6
    ${expected_num}     Set Variable    15
    ${result}   Get Max Num From List   ${mylist}
    Should Be Equal As Integers    ${result}    ${expected_num}

